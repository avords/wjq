package com.mvc.member.web;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.WJQConstants;
import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.OnlineMessage;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.OnlineMessageManager;

@Controller
@RequestMapping("onlineMessage")
public class OnlineMessageController extends PageController<OnlineMessage>{
	@Autowired
	private OnlineMessageManager onlineMessageManager;
	@Autowired
	private MemberManager memberManager;
	@Override
	public PageManager<OnlineMessage> getEntityManager() {
		return onlineMessageManager;
	}

	@Override
	public String getFileBasePath() {
		return "member/";
	}
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		request.setAttribute("users",memberManager.getAll());	
		return super.handlePage(request, page);
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, OnlineMessage t) throws Exception {
    	HttpSession session = request.getSession();
    	if(session.getAttribute(WJQConstants.MEMBER_ID)==null){
    		t.setType(OnlineMessage.USER_TYPE_VISTOR);
    		t.setOnlineMessageDate(new Date());
    	}
    	else{
    		t.setMemberId(Long.parseLong(session.getAttribute(WJQConstants.MEMBER_ID).toString()));
			t.setType(OnlineMessage.USER_TYPE_MEMBER);
			t.setOnlineMessageDate(new Date());
    	}
    	onlineMessageManager.save(t);
    	return "redirect:/onlineMessage/edit/"+t.getObjectId()+"?ajax=1&message=success";
	}
	
	@Override
	protected String handleView(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		request.setAttribute(FrameworkConstants.VIEW, "1");
		OnlineMessage entity =onlineMessageManager.getByObjectId(objectId);
		if (entity.getMemberId()!=null) {
			request.setAttribute("member", memberManager.getByObjectId(entity.getMemberId()));
		}
		request.setAttribute("entity", entity);
		 return getFileBasePath() + "viewOnlineMessage";
	}
}
