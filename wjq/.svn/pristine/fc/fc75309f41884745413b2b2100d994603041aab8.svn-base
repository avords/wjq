package com.mvc.member.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.Member;
import com.mvc.security.service.PasswordChangedManager;
import com.mvc.security.util.SecurityUtils;


@Service
public class MemberManager extends BaseService<Member, Serializable>{

	@Autowired
	private PasswordChangedManager passwordChangedManager;
	public boolean checkMemberName(String loginName) {
		if(searchByWhere("loginName=?", loginName)!=null){
			return false;
		}
		return true;
	}
 
	public boolean checkCellPhone(String cellPhone) {
		if(searchByWhere("cellPhone=?", cellPhone)!=null){
			return false;
		}
		return true;
	}
	
	public boolean authentication(Member member) {
		boolean result = false;
		String loginName = member.getLoginName();
		String password = member.getPassword();
		Member realUser = null;
		if (loginName != null && loginName.length() > 0) {
			if (password != null && password.length() > 0) {
				realUser = getMemberByLoginName(loginName);
			}
		}
		if (null != realUser && null != realUser.getPassword()&&realUser.getPassword().equals(SecurityUtils.generatePassword(member.getPassword()))) {
			result = true;
		}
		return result;
	}

	public Member getMemberByLoginName(String loginName) {
		String sql = "select A from " + Member.class.getName() + " A where loginName=?";
		List<Member> users =  searchBySql(sql, new Object[] { loginName });
		if (users.size() > 0) {
			Member user = users.get(0);
			return user;
		}
		return null;
	}

	public void updatePassword(Member member) {
		StringBuilder hql = new StringBuilder();
		hql.append("UPDATE ").append(Member.class.getName()).append(" SET password = '").append(member.getPassword())
		        .append("' WHERE ").append("objectId = ").append(member.getObjectId());
		Query query = getSession().createQuery(hql.toString());
		query.executeUpdate();

		}

	public Member getMemberBean(Long objectid) {
		String sql = "select A from " + Member.class.getName() + " A  where A.objectId =  ? ";
		List<Member> list=searchBySql(sql, objectid);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public Member getByObjectId(Long objectId){
		return super.getByObjectId(objectId);
	}

	public boolean checkMemberEmail(String email) {
		if(searchByWhere("email=?", email)==null){
			return false;
		}
		return true;
	}

	public Member getMemberByEmail(String email) {
		String sql = "select A from " + Member.class.getName() + " A where email=?";
		List<Member> users =  searchBySql(sql, new Object[] { email });
		if (users.size() > 0) {
			Member user = users.get(0);
			return user;
		}
		return null;
	}

}
