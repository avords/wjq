package com.mvc.sns.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.sns.model.PostTheme;

@Service
public class PostThemeManager extends BaseService<PostTheme, Serializable>{

	@Override
	public List<PostTheme> getAll() {
		String sql = "select A from " + getActualArgumentType().getName() + " A order by A.sortNo asc";
		Session session = getSession();
        Query query = session.createQuery(sql);
        List<PostTheme> list = query.list();
		return list;
	}
	
	

}
