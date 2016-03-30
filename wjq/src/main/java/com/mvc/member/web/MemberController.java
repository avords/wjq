package com.mvc.member.web;

import java.awt.Frame;
import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.WJQConstants;
import com.mvc.base.service.FileManager;
import com.mvc.component.mail.MailConfig;
import com.mvc.component.mail.service.EmailManagerImpl;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.FrameworkContextUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.framework.util.UploadFile;
import com.mvc.member.model.Member;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.ValicateCodeManager;
import com.mvc.order.model.Order;
import com.mvc.order.service.OrderManager;
import com.mvc.search.service.SensitivewordFilterManager;
import com.mvc.security.util.SecurityUtils;
import com.mvc.sns.model.Post;
import com.mvc.sns.model.PostComment;
import com.mvc.sns.service.PostCommentManager;
import com.mvc.sns.service.PostManager;
import com.mvc.util.ImageUtils;
import com.mvc.util.SmsSendUtils;

@Controller
@RequestMapping("/member")
public class MemberController{

	@Resource(name="fileManagerExpand")
	private FileManager fileManager;
	@Autowired
	private EmailManagerImpl emailManager;
	@Autowired
	private PostManager postManager;
	@Autowired
	private ValicateCodeManager validateCodeManager;
	@Autowired
	private MemberManager memberManager;
	@Autowired
	private OrderManager orderManager;
	@Autowired 
	private PostCommentManager postCommentManager;
	 @Autowired
	private SensitivewordFilterManager sensitivewordFilterManager;
	
	@RequestMapping(value = "/memberCenter")
    public String memberCenter(HttpServletRequest request, HttpServletResponse response) {
		Long memberId = (Long)request.getSession().getAttribute(WJQConstants.MEMBER_ID);
		request.setAttribute("member", memberManager.getByObjectId(memberId));
		return "member/memberCenter";
    }
	
	@RequestMapping(value = "/postSave")
    public String postSave(HttpServletRequest request,Post t) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute(WJQConstants.MEMBER_ID)==null){
			return "home/login";
		}
		
		/**
		 *保存发帖内容
		 ***/
		if(t.getThemeId()!=null){
		Long member_id = (Long)request.getSession().getAttribute(WJQConstants.MEMBER_ID);
		t.setMemberId(member_id);
		t.setIsTop(2);
		t.setCreateDate(new Date());
		t.setUpdateDate(t.getCreateDate());
		t.setLatestReplyDate(t.getCreateDate());
		postManager.save(t);
		request.setAttribute("message","发帖成功");
		}
		
        return "redirect:/home/post";
    }
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute(WJQConstants.MEMBER_ID)==null){
			return "home/login";
		}
		else{
		Long objectId = Long.parseLong(session.getAttribute(WJQConstants.MEMBER_ID).toString());
		Object member = memberManager.getByObjectId(objectId);
		request.setAttribute("member", member);
		return "member/modifyInformation";
		}
	}

	@RequestMapping("/saveModify")
	public String saveModify(HttpServletRequest request, ModelMap modelMap) {
		Member member=(Member)request.getSession().getAttribute(WJQConstants.SESSION_MEMBER);
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String areaCode = request.getParameter("areaCode");
		String idCardNo = request.getParameter("idCardNo");
		String passpordNo = request.getParameter("passpordNo");
		String zip = request.getParameter("zip");
		String weChatNu = request.getParameter("weChatNu");
		String company = request.getParameter("company");
		member.setWeChatNu(weChatNu);
		member.setIdCardNo(idCardNo);
		member.setSex(Integer.parseInt(sex));
		member.setPasspordNo(passpordNo);
		member.setName(name);
		member.setCompany(company);
		member.setZip(zip);
		member.setAreaCode(areaCode);
		member.setAddress(address);
		memberManager.save(member);
		request.setAttribute("member", member);
		request.setAttribute("message","success");
		request.getSession().setAttribute(WJQConstants.SESSION_MEMBER,member);
		return "member/modifyInformation";
	}
 
	
	@RequestMapping("/modifyPassword")
	public String modifyPassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long objectId = Long.parseLong(session.getAttribute(WJQConstants.MEMBER_ID).toString());
		Member member=memberManager.getMemberBean(objectId);
	    request.setAttribute("member", member);
		return "member/modifyPassword";
	}
	
	@RequestMapping("/savePassword")
	public String savePassword(HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		Long objectId = Long.parseLong(session.getAttribute(WJQConstants.MEMBER_ID).toString());
		String newPassword = request.getParameter("password");
		Member member = memberManager.getByObjectId(objectId);
		member.setPassword(SecurityUtils.generatePassword(newPassword));
		memberManager.updatePassword(member);
		return "home/login";
	}
	
	@RequestMapping(value = "/postCommentSave")
    public String postCommentSave(HttpServletRequest request,PostComment t) {
		
		Long postId=Long.parseLong(request.getParameter("postId"));
		Member member=(Member)request.getSession().getAttribute(WJQConstants.SESSION_MEMBER);
		t.setCommentatorId(member.getObjectId());
		t.setCommentatorName(member.getLoginName());
		t.setCreateDate(new Date());
		t.setPostId(postId);
		t.setCreateDate(new Date());
		postCommentManager.save(t);
		postManager.updateReplyDate(postId);
		
        return "redirect:/home/postComment?postId="+postId;
    }
	
	@RequestMapping("/uploadImage")
	public String uploadImage(HttpServletRequest request, HttpServletResponse response,ModelMap map) throws Exception {
		/**
		 *会员头像上传
		 ***/
		String result = "false";
		UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "uploadFile");
		String fileName = uploadFile.getFileName();
		if (StringUtils.isNotBlank(fileName)){
		if (fileName.endsWith(".jpg")||fileName.endsWith(".bmp")||fileName.endsWith(".gif")||fileName.endsWith(".png")||fileName.endsWith(".JPG")||fileName.endsWith(".BMP")||fileName.endsWith(".GIF")||fileName.endsWith(".PNG")) {
			byte[] fileData = FileUpDownUtils.getFileContent(uploadFile.getFile());
			String filePath = fileManager.saveImageFile(fileData, uploadFile.getFileName());
			BufferedImage image = ImageUtils.readImage(uploadFile.getFile().getAbsolutePath());
			result = "true";
			Member member=(Member)request.getSession().getAttribute(WJQConstants.SESSION_MEMBER);
			member.setPictureAddress(filePath.trim());
			memberManager.save(member);
			request.getSession().setAttribute(WJQConstants.SESSION_MEMBER, member);
			map.addAttribute("filePath", filePath.trim());
			if (image != null) {
				map.put("width", image.getWidth() + "");
				map.put("height", image.getHeight() + "");
			}
		} else {
			map.put("message", "图片格式必须为jpg/bmp/gif/png");
		}
		}
		map.put("result", result);
		return "jsonView";
	}
	
	@RequestMapping("/sensitiveWord")
	public String  sensitiveWord(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {
		
			 String title=request.getParameter("title").toString();
		     String content=request.getParameter("content").toString();
		     if (sensitivewordFilterManager.isContaintSensitiveWord(title, SensitivewordFilterManager.minMatchTYpe)||sensitivewordFilterManager.isContaintSensitiveWord(content, SensitivewordFilterManager.minMatchTYpe)) {
		            modelMap.addAttribute("isHaveSensitiveword", true);
		        } else {
		        	modelMap.addAttribute("isHaveSensitiveword", false);
		        }
			return "jsonView";
	}
	
	@RequestMapping("/modifyCellPhone")
	public String modifyCellPhone(HttpServletRequest request) {
		Member member=(Member)request.getSession().getAttribute(WJQConstants.SESSION_MEMBER);
	    request.setAttribute("member", member);
		return "member/modifyCellPhone";
	}
	
	
	//校验手机号是否唯一
	@RequestMapping("/checkCellPhone")
	 @ResponseBody
	 public boolean checkCellPhone(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) throws Exception {
	        boolean result = true;
	        String cellPhone = request.getParameter("cellPhone");
	        result=memberManager.checkCellPhone(cellPhone);
	        return result;
	    }
	
	//保存修改的手机号
	@RequestMapping("/saveCellPhone")
	public String saveCellPhone(HttpServletRequest request, ModelMap modelMap) {
		Member member=(Member)request.getSession().getAttribute(WJQConstants.SESSION_MEMBER);
		String cellPhone = request.getParameter("cellPhone");
		member.setCellPhone(cellPhone);
		memberManager.save(member);
		request.setAttribute("member", member);
		request.getSession().setAttribute(WJQConstants.SESSION_MEMBER,member);
		return "member/memberCenter";
	}
	
	//修改手机发送的验证码
	@RequestMapping("/sendCode")
	@ResponseBody
	public ModelMap sendEmail(HttpServletRequest request,HttpServletResponse response) {
		String cellPhone =request.getParameter("cellPhone");
		String tempCode=SmsSendUtils.send(cellPhone);
			
		MailConfig mailConifg=new MailConfig();
		/*mailConifg.setTo(cellPhone);
		mailConifg.setSubject("手机修改的验证码！");
		String cellPhoneContent = "手机修改的验证码：<br/>"+tempCode+"<br/>有效期二分钟";
		mailConifg.setContent(cellPhoneContent);*/
		int flag=emailManager.sendEmail(mailConifg);
		ModelMap modelMap=new ModelMap();
		if(flag==0){
			modelMap.put("message", "验证码已发送");
			modelMap.put("tempCode", tempCode);
			modelMap.put("flag", true);
		}else{
			modelMap.put("message", "发送失败，请重试！");
			modelMap.put("flag", false);
		}
		return  modelMap;
	 }
	 
	@RequestMapping("/myWord")
	public String myWord(HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		Long memberId = Long.parseLong(session.getAttribute(WJQConstants.MEMBER_ID).toString());
		Member member=memberManager.getMemberBean(memberId);
		PageSearch pageSearch = PageUtils.preparePage(request,Post.class,true);
		pageSearch.getFilters().add(new PropertyFilter(Post.class.getName(),"EQL_memberId", memberId +""));
		postManager.find(pageSearch);
	    request.setAttribute("member", member);
		request.setAttribute("pageSearch", pageSearch);
		return "member/myWord";
	}
}
