package com.mvc.home.web;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.WJQConstants;
import com.mvc.base.model.CooperativeEnterprise;
import com.mvc.base.service.CooperativeEnterpriseManager;
import com.mvc.base.service.ServiceDirectionManager;
import com.mvc.cms.model.Content;
import com.mvc.cms.service.ContentManager;
import com.mvc.component.mail.EmailManager;
import com.mvc.component.mail.MailConfig;
import com.mvc.framework.service.DictionaryManager;
import com.mvc.framework.util.DomainUtils;
import com.mvc.framework.util.IpUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.member.model.Member;
import com.mvc.member.model.ValidateCode;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.ValidateCodeManager;
import com.mvc.security.util.SecurityUtils;
import com.mvc.sns.model.Post;
import com.mvc.sns.model.PostComment;
import com.mvc.sns.model.PostPraise;
import com.mvc.sns.service.PostCommentManager;
import com.mvc.sns.service.PostManager;
import com.mvc.sns.service.PostPraiseManager;
import com.mvc.sns.service.PostThemeManager;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private PostThemeManager postThemeManager;

	@Autowired
	private MemberManager memberManager;
	
	@Autowired
	private PostPraiseManager postPraiseManager;
	
	@Autowired
	private PostManager postManager;
	
	@Autowired
	private PostCommentManager postCommentManager;
	
	@Autowired
	private DictionaryManager dictionaryManager;
	
	@Autowired
	private EmailManager emailManager;
	
	@Autowired
	private ValidateCodeManager validateCodeManager;
	
	@Autowired
	private CooperativeEnterpriseManager cooperativeEnterpriseManager;
	
	@Autowired
	private ServiceDirectionManager serviceDirectionManager;
	
	@Autowired
    private ContentManager contentManager;
	
	/**
	 * 出国留学列表页
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/abroadStudy")
    public String abroadStudy(HttpServletRequest request) {
		request.setAttribute("serviceDirections",serviceDirectionManager.getAll());
		
		int serviceType=CooperativeEnterprise.SERVICE_TYPE_ABROADSTUDY;
		Long serviceDirectionId=0L;
		if (request.getParameter("serviceDirectionId")!=null) {
			serviceDirectionId=Long.parseLong(request.getParameter("serviceDirectionId").toString());
		}
		PageSearch pageSearch = PageUtils.getPageSearch(request);
		List<CooperativeEnterprise> ces=cooperativeEnterpriseManager.getCooperativeEnterprise(pageSearch,serviceType, serviceDirectionId);
		
		/**
		 * 热门留学资讯
		 */
		List<Content> titles=contentManager.getAllTitle("出国留学",0,9);
		request.setAttribute("titles",titles );
		/**
		 * 无事聊聊--出国留学
		 */
		List<Post> posts=postManager.searchAllPost("出国留学",null,null,0,3);
		for (Post post : posts) {
			List<PostComment> comments=postCommentManager.getCommentsByPostId(post.getObjectId());
			if (comments.size()!=0) {
				post.setLatestReplyName(comments.get(0).getCommentatorName());
			}
		}
		request.setAttribute("posts",posts );
		pageSearch.setList(ces);
		request.setAttribute("serviceType", serviceType);
		request.setAttribute("serviceDirectionId", serviceDirectionId);
		request.setAttribute("pageSearch", pageSearch);
        return "home/abroadStudy";
    }
	
	/**
	 * 出国留学详细
	 */
	@RequestMapping(value = "/abroadStudyDetail")
    public String abroadStudyDetail(HttpServletRequest request, Long cooperativeEnterpriseId){
		
		CooperativeEnterprise enterprise=cooperativeEnterpriseManager.getByObjectId(cooperativeEnterpriseId);
		
		
		/**
		 * 热门留学资讯
		 */
		List<Content> titles=contentManager.getAllTitle("出国留学",0,9);
		request.setAttribute("titles",titles );
		/**
		 * 无事聊聊--出国留学
		 */
		List<Post> posts=postManager.searchAllPost("出国留学",null,null,0,3);
		for (Post post : posts) {
			List<PostComment> comments=postCommentManager.getCommentsByPostId(post.getObjectId());
			if (comments.size()!=0) {
				post.setLatestReplyName(comments.get(0).getCommentatorName());
			}
		}
		request.setAttribute("enterprise",enterprise );
		request.setAttribute("posts",posts );
        return "home/abroadStudyDetail";
    }
	
	/**
	 * 帖子列表页
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/post")
    public String post(HttpServletRequest request,Post t) {
		request.setAttribute("themeNum",postThemeManager.getTotalCount());
		request.setAttribute("postNum",postManager.getTotalCount());
		
		PageSearch pageSearch = PageUtils.getPageSearch(request);
		pageSearch.setPageSize(10);
		
		request.setAttribute("themes", postThemeManager.getAll());
		request.setAttribute("types", dictionaryManager.getDictionariesByDictionaryId(1105));
		
		/**
		 * 会员或游客信息
		 */
		HttpSession session = request.getSession();
		if(session.getAttribute(WJQConstants.MEMBER_ID)==null){
			request.setAttribute("member", null);
		}
		else{
			Long objectId = Long.parseLong(session.getAttribute(WJQConstants.MEMBER_ID).toString());
			Member member = memberManager.getByObjectId(objectId);
			request.setAttribute("member", member);
		}
		
		Long themeId=0L;
		int type=0;
		if (request.getParameter("themeId")!=null) {
			themeId=Long.parseLong(request.getParameter("themeId").toString());
		}
		if (request.getParameter("type")!=null) {
			type=Integer.parseInt(request.getParameter("type").toString());
		}
		/**
		 *  本吧搜索
		 */
		String searchText=request.getParameter("searchText");
		List<Post> posts=postManager.getPost(pageSearch, searchText, themeId, type);
		for (Post post : posts) {
			Member member=memberManager.getByObjectId(post.getMemberId());
			post.setMemberLoginName(member.getLoginName());
			List<PostComment> comments=postCommentManager.getCommentsByPostId(post.getObjectId());
			post.setCommentNumber(comments.size());
			if (comments.size()!=0) {
				post.setLatestReplyName(comments.get(0).getCommentatorName());
			}
		}
		pageSearch.setList(posts);
		request.setAttribute("themeId", themeId);
		request.setAttribute("type", type);
		request.setAttribute("searchText", searchText);
		request.setAttribute("pageSearch", pageSearch);
        return "home/post";
    }
	
	/**
	 * 帖子详情
	 * @param request
	 * @param postId
	 * @return
	 */
	 
	@RequestMapping(value = "/postComment")
    public String postComment(HttpServletRequest request, Long postId) {
		request.setAttribute("themeNum",postThemeManager.getTotalCount());
		request.setAttribute("postNum",postManager.getTotalCount());
		
		Post  post =postManager.getByObjectId(postId);
		Long memberId = post.getMemberId();
		Long adminMemberId = (Long) request.getSession().getAttribute(WJQConstants. MEMBER_ID);
		Member member =memberManager.getByObjectId(memberId);
		Member adminMember =memberManager.getByObjectId(adminMemberId);
		PageSearch pageSearch = PageUtils.getPageSearch(request);
		postCommentManager.getCommentsByPageSearch(pageSearch,postId);
		request.setAttribute("pageSearch", pageSearch);
		
		List<PostPraise> postPraises = postPraiseManager.searchByPostId(postId);
		
		int praiseNumber = postPraises.size();
		request.setAttribute("adminMember", adminMember);
		request.setAttribute("member", member);
		request.setAttribute("post", post);
		request.setAttribute("postId", postId);
		request.setAttribute("praiseNumber", praiseNumber);
        return "home/postComment";
    }
	
	@RequestMapping(value = "/postPraise/{postId}")
	public String postPraise(HttpServletRequest request, @PathVariable Long postId,Model model) {
		PostPraise postPraise =new PostPraise();
		String memberIp = IpUtils.getRealIp(request);
		List<PostPraise> list = postPraiseManager.searchWhere(memberIp, postId);
		if(list.size()==0){
			postPraise.setMemberIp(memberIp);
			postPraise.setPostId(postId);
			postPraise.setCreateDate(new Date());
			postPraiseManager.save(postPraise);
		}
		List<PostPraise> postPraises = postPraiseManager.searchByPostId(postId);
		int total=postPraises.size();
		model.addAttribute("praiseNumber",total);
		return "jsonView";
    }
	
	 @RequestMapping("/checkMemberEmail")
	 @ResponseBody
	 public boolean checkMemberEmail(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) throws Exception {
	        boolean result = true;
	        String email = request.getParameter("email");
	        result=memberManager.checkMemberEmail(email);
	        return result;
	 }
	 
		@RequestMapping(value = "/sendEmail")
		public String sendEmail(HttpServletRequest request,HttpServletResponse response) {
			String email =request.getParameter("email");
			Member member=memberManager.getMemberByEmail(email);
			if(member!=null){
				MailConfig mailConifg=new MailConfig();
				mailConifg.setTo(email);
				mailConifg.setSubject("亲爱的"+ member.getLoginName()+"，请重新设置你的万家桥帐户密码！");
//				int i=(new Random().nextInt(899999)+100000); 
				String code=getValidateCode();
				ValidateCode validateCode=new ValidateCode();
				validateCode.setAccount(email);
				validateCode.setCode(code);
				validateCode.setValidateTime(new Date(System.currentTimeMillis()+10*60*1000));
				validateCode.setType(ValidateCode.VALIDATE_TYPE_FIND);
				validateCode.setMemberId(member.getObjectId());
				validateCodeManager.clearValidateRecords(email,ValidateCode.VALIDATE_TYPE_FIND);
				validateCodeManager.save(validateCode);
//				Long validateId=validateCodeManager.getValidateId(validateCode.getValidateTime());
			    String dynamicDomain = DomainUtils.getDynamicDomain();
		        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+dynamicDomain;
			    String resetPassHref =  basePath+"/home/resetPassword?account="+email;
			    String emailContent = "请勿回复本邮件.点击下面的链接,重设密码<br/><a href="+resetPassHref +" target='_BLANK'>点击我重新设置密码</a>" +
			     "<br/>tips:本邮件超过10分钟,链接将会失效，需要重新申请'找回密码'";
				mailConifg.setContent(emailContent);
				int flag=emailManager.sendEmail(mailConifg);
				if(flag==0){
					request.setAttribute("message", "重置密码邮件已发送");
				}else{
					request.setAttribute("message", "重置密码邮件发送失败，请联系管理员！");
				}
			}else{
				request.setAttribute("message", "重置密码邮件已发送");
			}
			
			
			return "home/findPassword";
	    }
		
		@RequestMapping(value = "/findPassword")
		public String findPassword(HttpServletRequest request) {
			return "home/findPassword";
	    }
		
		@RequestMapping(value = "/resetPassword")
		public String resetPassword(HttpServletRequest request) {
			String account=request.getParameter("account");
			request.setAttribute("account", account);
			String msg=checkResetLink(account);
			String path="";
			if(msg.length()>0){
				request.setAttribute("message", msg);
				path="home/errorPage";
			}else{
				path="home/resetPassword";
			}
			return path;
	    }
		
		private String checkResetLink(String email) {
			String msg = "";
		    if(StringUtils.isEmpty(email)){
		        msg="链接不完整,请重新生成";
		        return msg;
		    }
		    ValidateCode validateCode = validateCodeManager.getValidateCode(email,ValidateCode.VALIDATE_TYPE_FIND);
	    	 if(validateCode == null){
		         msg = "链接失效,无法找到匹配信息,请重新申请找回密码.";
			     return msg;
		      }
	    	 
	    	 Long temp=System.currentTimeMillis()-validateCode.getValidateTime().getTime();
	    	 if(temp>0 ){         //表示已经过期
	    		   validateCodeManager.delete(validateCode.getObjectId());
		           msg = "链接已经过期,请重新申请找回密码.";
				   return msg;
		      }
	    	return "";
		}
		
		@RequestMapping(value = "/update")
		public String updatePassword(HttpServletRequest request) {
			String email=request.getParameter("email");
			String passwrod=request.getParameter("password");
			ValidateCode validateCode = validateCodeManager.getValidateCode(email, ValidateCode.VALIDATE_TYPE_FIND);
			
			String msg="";
			String path="";
			if(validateCode==null){
				request.setAttribute("message", msg);
				path="home/errorPage";
			}else{
				Member member=memberManager.getByObjectId(validateCode.getMemberId());
				member.setPassword(SecurityUtils.generatePassword(passwrod));
				memberManager.save(member);
				validateCodeManager.clearValidateRecords(validateCode.getAccount(),ValidateCode.VALIDATE_TYPE_FIND);
				path="redirect:../home/index";
			}
			return path;
	    }
		
		 private String getValidateCode(){
			 String pattern="000000";
		     DecimalFormat df = new DecimalFormat(pattern);
		     Random r = new Random();
		     return df.format(r.nextInt(1000000));
		 }
		 
}
