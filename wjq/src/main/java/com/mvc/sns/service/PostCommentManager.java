package com.mvc.sns.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;
import com.mvc.member.model.Member;
import com.mvc.sns.model.Post;
import com.mvc.sns.model.PostComment;

@Service
public class PostCommentManager extends BaseService<PostComment, Serializable>{
	
	public List<PostComment> getCommentsByPostId(Long postId) {
		String sql = "select A from " + getActualArgumentType().getName() + " A"+" where A.postId= "+postId+" order by A.createDate desc";
		return searchBySql(sql);
	}
	
	public List<PostComment> getCommentsByPage(Long postId,Integer begin,Integer pageSize) {
		String sql="SELECT C,D FROM "+ PostComment.class.getName()+" C,"+ Member.class.getName()+" D WHERE C.commentatorId=D.objectId and C.postId="+postId +" order by C.createDate asc";
		
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != begin) {
			query.setFirstResult(begin);
		}
		if (null != pageSize) {
			query.setMaxResults(pageSize);
		}
		List<Object[]> list = query.list();
		List<PostComment> tempList=new ArrayList<PostComment>();
		for(Object[] temp:list){
			PostComment postCom=(PostComment)temp[0];
			postCom.setMember((Member)(temp[1]));
			tempList.add(postCom);
		}
		return tempList;
	}
	
	public void getCommentsByPageSearch(PageSearch pageSearch,Long postId){
		String sql="SELECT count(*) FROM "+ PostComment.class.getName()+" C WHERE C.postId="+postId;
		Session session = getSession();
	    Query query = session.createQuery(sql);
	    List<Long> countList = query.list();
        if(countList.size()>0){
            pageSearch.setTotalCount(countList.get(0).intValue());
        }else{
            pageSearch.setTotalCount(0);
        }
		
		int  currentPage=pageSearch.getPage()<=0?1:pageSearch.getPage();
		int pageSize=0;
		int begin=0;
		if(currentPage==1){
			 pageSize= pageSearch.getPageSize()-1;
		     begin = 0;
		}else{
			pageSize= pageSearch.getPageSize();
		    begin = (currentPage-1)*pageSize-1;
		}
        List<PostComment> list= getCommentsByPage(postId,begin,pageSize);
        int total=list.size();
        PostComment temp=null;
        for(int i=0;i<total;i++){
        	temp=list.get(i);
        	temp.setLevelCount(begin+i+2);
        }
        pageSearch.setList(list);
	}
	
	@SuppressWarnings("unchecked")
	 public List<PostComment> getByCommentatorId(Long commentatorId) {
	    	String sql = "select A from " + getActualArgumentType().getName() + " A"+" where A.commentatorId= " +commentatorId ;
	        Query query = getSession().createQuery(sql);
	        return query.list();
	    }
}
