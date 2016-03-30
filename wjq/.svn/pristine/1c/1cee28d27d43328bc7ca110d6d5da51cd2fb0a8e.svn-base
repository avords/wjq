package com.mvc.sns.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;
import com.mvc.sns.model.Post;

@Service
public class PostManager extends BaseService<Post, Serializable>{

	@SuppressWarnings("unchecked")
    public List<Post> getPost(PageSearch pageSearch,String text,Long themeId,Integer type){
        String sql = "select count(*) from " + getActualArgumentType().getName() + " A where 1=1 ";
        if(text!=null&&text!=""){
            sql=sql+" and A.name like '%"+text+"%' ";
        }
        if(themeId!=null&&themeId!=0){
            sql=sql+" and A.themeId="+themeId;
        }
        if(type!=null&&type!=0){
            sql=sql+" and A.type="+type;
        }
        Session session = getSession();
        Query query = session.createQuery(sql);
        List<Long> countList = query.list();
        if(countList.size()>0){
            pageSearch.setTotalCount(countList.get(0).intValue());
        }else{
            pageSearch.setTotalCount(0);
        }
        int  currentPage=pageSearch.getPage()<=0?1:pageSearch.getPage();
        int pageSize =pageSearch.getPageSize();
        int begin = (currentPage-1)*pageSize;
        List<Post> posts= searchAllPost(text,themeId,type,begin,pageSize);
        return posts;
    }
	
	@SuppressWarnings("unchecked")
    public List<Post> getPost(PageSearch pageSearch,Long memberId){
        String sql = "select count(*) from " + getActualArgumentType().getName() + " A where 1=1 ";
        
        if(memberId!=null&&memberId!=0){
            sql=sql+" and A.memberId="+memberId;
        }
        Session session = getSession();
        Query query = session.createQuery(sql);
        List<Long> countList = query.list();
        if(countList.size()>0){
            pageSearch.setTotalCount(countList.get(0).intValue());
        }else{
            pageSearch.setTotalCount(0);
        }
        int  currentPage=pageSearch.getPage()<=0?1:pageSearch.getPage();
        int pageSize =pageSearch.getPageSize();
        int begin = (currentPage-1)*pageSize;
        List<Post> posts= searchAllPost(memberId,begin,pageSize);
        return posts;
    }

	@SuppressWarnings("unchecked")
    public List<Post> searchAllPost(String text,Long themeId,Integer type,Integer begin,Integer limited) {
        String sql = "select A from " + getActualArgumentType().getName() + " A where 1=1 ";
        if(text!=null&&text!=""){
            sql=sql+" and A.name like '%"+text+"%' ";
        }
        if(themeId!=null&&themeId!=0){
            sql=sql+" and A.themeId="+themeId;
        }
        if(type!=null&&type!=0){
            sql=sql+" and A.type="+type;
        }
        sql=sql+" order by A.isTop asc,A.latestReplyDate asc";

        Session session = getSession();
        Query query = session.createQuery(sql);
        if (null != begin) {
            query.setFirstResult(begin);
        }
        if (null != limited) {
            query.setMaxResults(limited);
        }
        List<Post> list = query.list();
        return list;
    }
	
	@SuppressWarnings("unchecked")
    public List<Post> searchAllPost(Long memberId,Integer begin,Integer limited) {
        String sql = "select A from " + getActualArgumentType().getName() + " A where 1=1 ";
        if(memberId!=null&&memberId!=0){
            sql=sql+" and A.memberId="+memberId;
        }
        sql=sql+" order by A.createDate desc";

        Session session = getSession();
        Query query = session.createQuery(sql);
        if (null != begin) {
            query.setFirstResult(begin);
        }
        if (null != limited) {
            query.setMaxResults(limited);
        }
        List<Post> list = query.list();
        return list;
    }

    public void isTop(Long objectId) {
        String hql = "update "+Post.class.getName()+" set is_top=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, 1);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }

    public void updateReplyDate(Long postId) {
        String hql = "update "+Post.class.getName()+" set latestReplyDate=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, new Date());
        query.setParameter(1, postId);
        query.executeUpdate();

    }

    public void notTop(Long objectId) {
        String hql = "update "+Post.class.getName()+" set is_top=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, 2);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
    @SuppressWarnings("unchecked")
    public List<Post> getNewestPost(int count) {
        String hql = "select A from "+Post.class.getName()+" A order by A.latestReplyDate desc";
        Query query = getSession().createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(count);
        return query.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<Post> getByMemberId(Long memberId) {
    	String sql = "select A from " + getActualArgumentType().getName() + " A"+" where A.memberId= " +memberId ;
        Query query = getSession().createQuery(sql);
        return query.list();
    }
}
