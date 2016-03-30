package com.mvc.cms.service;


import org.springframework.stereotype.Service;
import com.mvc.cms.model.ContentTxt;
import com.mvc.framework.service.BaseService;

@Service
public class ContentTxtManager extends BaseService<ContentTxt, Long> {

	public ContentTxt getContentTxtByContentId(Long objectId) {
			String sql = "select A from " + ContentTxt.class.getName() + " A  where  A.contentId =  ? ";
			return searchObjectBySql(sql, objectId);
	}

}
