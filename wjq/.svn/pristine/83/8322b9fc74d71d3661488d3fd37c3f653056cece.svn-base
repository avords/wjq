package com.mvc.base.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.base.model.KeyWords;
import com.mvc.framework.service.BaseService;

@Service
public class KeyWordsManager extends BaseService<KeyWords, Serializable>{

    @SuppressWarnings("unchecked")
    public List<String> getAllKeyWords() {
        String sql = "select distinct A.name from "+KeyWords.class.getName()+" A";
        Session session = getSession();
        Query query = session.createQuery(sql);
        List<String> list = query.list();
        return list;
    }
}
