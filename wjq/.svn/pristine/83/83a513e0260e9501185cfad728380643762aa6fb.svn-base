package com.mvc.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.ReplyMessage;
import com.mvc.member.service.ReplyMessageManager;

@Controller
@RequestMapping("replymessage")
public class ReplyMessageController extends PageController<ReplyMessage>{
	@Autowired
	private ReplyMessageManager replyMessageManager;
	@Override
	public PageManager<ReplyMessage> getEntityManager() {
		return replyMessageManager;
	}

	@Override
	public String getFileBasePath() {
		return "member/";
	}

}
