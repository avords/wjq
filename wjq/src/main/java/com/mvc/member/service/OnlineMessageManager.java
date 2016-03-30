package com.mvc.member.service;

import java.io.Serializable;
import org.springframework.stereotype.Service;
import com.mvc.framework.service.BaseService;
import com.mvc.member.model.OnlineMessage;

@Service
public class OnlineMessageManager extends BaseService<OnlineMessage, Serializable>{
	@Override
	public OnlineMessage getByObjectId(Serializable objectId) {
		return super.getByObjectId(objectId);
	}
}
