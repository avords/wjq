package com.mvc.sns.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.sns.model.PostPraise;

@Service
public class PostPraiseManager extends BaseService<PostPraise, Serializable>{

    @SuppressWarnings("unchecked")
    public List<PostPraise> searchByMemberId(Long memberId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT A FROM  ").append(getActualArgumentType().getName())
        .append(" A WHERE A.memberId="+memberId);
		List<PostPraise> list = searchBySql(getActualArgumentType(), sql.toString());
		return list;
	}

	@SuppressWarnings("unchecked")
    public List<PostPraise> searchByPostId(Long postId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT A FROM  ").append(getActualArgumentType().getName())
        .append(" A WHERE A.postId="+postId);
		List<PostPraise> list = searchBySql(getActualArgumentType(), sql.toString());
		return list;
	}

	@SuppressWarnings("unchecked")
    public List<PostPraise> searchWhere(String memberIp,Long postId) {
		String sql="SELECT A FROM  "+getActualArgumentType().getName()+"  A WHERE A.memberIp='%"+memberIp+"%' AND  A.postId="+postId;
		List<PostPraise> list = searchBySql(getActualArgumentType(), sql);
		return list;
	}
}
