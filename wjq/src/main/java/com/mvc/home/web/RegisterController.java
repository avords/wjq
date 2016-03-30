package com.mvc.home.web;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.component.mail.MailConfig;
import com.mvc.component.mail.service.EmailManagerImpl;
import com.mvc.member.model.Member;
import com.mvc.member.model.ValidateCode;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.ValidateCodeManager;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("home/register")
public class RegisterController {
	@Autowired
	private MemberManager memberManager;
	
	@Autowired
	private ValidateCodeManager validateCodeManager;
	@Autowired
	private EmailManagerImpl emailManager;
	

	@RequestMapping("")
	public String index(HttpServletRequest request,HttpServletResponse response) throws Exception {
		return "home/register";
	}

	@RequestMapping("/save")
	public String register(HttpServletRequest request,HttpServletResponse response,@Valid Member member, BindingResult result)  {
		if(member!=null&&member.getPassword()!=null){
			member.setPassword(SecurityUtils.generatePassword(member.getPassword()));
		}
		validateCodeManager.clearValidateRecords(member.getEmail(),ValidateCode.VALIDATE_TYPE_REGISTER);
		member.setStatus(Member.STATUS_NORMAL);
		memberManager.save(member);
		return "redirect:/home/login";
	}

	 @RequestMapping("/checkMemberName")
	 @ResponseBody
	 public boolean checkMemberName(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) throws Exception {
	        boolean result = true;
	        String loginName = request.getParameter("loginName");
	        result=memberManager.checkMemberName(loginName);
	        return result;
	 }
	 
	@RequestMapping("/sendEmail")
	@ResponseBody
	public ModelMap sendEmail(HttpServletRequest request,HttpServletResponse response) {
		String email =request.getParameter("email");
		ValidateCode validateCode=new ValidateCode();
		validateCode.setAccount(email);
//		int i=(new Random().nextInt(899999)+100000); 
		String code=getValidateCode();
		validateCode.setCode(code);
		validateCode.setValidateTime(new Date(System.currentTimeMillis()+10*60*1000));
		validateCode.setType(ValidateCode.VALIDATE_TYPE_REGISTER);
		validateCodeManager.clearValidateRecords(email, ValidateCode.VALIDATE_TYPE_REGISTER);
		validateCodeManager.save(validateCode);
			
		MailConfig mailConifg=new MailConfig();
		mailConifg.setTo(email);
		mailConifg.setSubject("万家桥注册帐户验证码！");
		String emailContent = "您的账户注册验证码：<br/>"+code+"<br/>有效期十分钟";
		mailConifg.setContent(emailContent);
		int flag=emailManager.sendEmail(mailConifg);
		ModelMap modelMap=new ModelMap();
		if(flag==0){
			modelMap.put("message", "注册验证码邮件邮件已发送");
			modelMap.put("flag", true);
		}else{
			modelMap.put("message", "注册验证码邮件发送失败，请联系管理员！");
			modelMap.put("flag", false);
		}
			
		return modelMap;
	 }
	

	 @RequestMapping("/checkValidateCode")
	 @ResponseBody
	 public boolean checkValidateCode(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {
	        boolean result = true;
	        String validateCode = request.getParameter("s_randomCode");
	        String email=request.getParameter("email");
	        if(validateCode==null||email==null){
	        	return false;
	        }
	        
	        result=validateCodeManager.checkValidateCode(email,ValidateCode.VALIDATE_TYPE_REGISTER,validateCode);
	        return result;
	 }
	 
	 @RequestMapping("/checkEmailUnique")
	 @ResponseBody
	 public boolean checkEmailUnique(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {
	        boolean result = true;
	        String email=request.getParameter("email");
	        if(email==null){
	        	return false;
	        }
	        
	        result=memberManager.checkMemberEmail(email);
	        if(result)
	        	return false;
	        return true;
	 }
	 
	 private String getValidateCode(){
		 String pattern="000000";
	     DecimalFormat df = new DecimalFormat(pattern);
	     Random r = new Random();
	     return df.format(r.nextInt(1000000));
	 }
}
