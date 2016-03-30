package com.mvc.member.service;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.ValidateCode;

@Service
public class ValicateCodeManager  extends BaseService<ValidateCode, Serializable>{

    public boolean checkValidateCode(String email, int type, String validateCode) {
        String sql = "SELECT count(A.*) FROM " + ValidateCode.class.getName()
                + " A WHERE 1 = 1 AND A.type=:type AND A.account=:account AND A.code=:code AND A.validateTime>:date" ;
        Query query=getSession().createQuery(sql);
        query.setInteger("type", type);
        query.setString("account", email);
        query.setString("code", validateCode);
        query.setTimestamp("date",Calendar.getInstance().getTime());

        List<Long> codes = query.list();
        if(codes.size()>0&&codes.get(0)>0){
            return true;
        }
        return false;
    }

    public void clearValidateRecords(String account,int type) {
        String sql = "DELETE FROM " + ValidateCode.class.getName()
                + " A WHERE 1 = 1 AND A.type="+type+" AND A.account='"+account +"'";
        this.getSession().createQuery(sql).executeUpdate();
    }

    public ValidateCode getValidateCode(String email, int validateType) {
        String sql = "SELECT A FROM " + ValidateCode.class.getName()
                + " A WHERE 1 = 1 AND A.type="+validateType+" AND A.account='"+email+"' order by A.validate_time desc" ;
        List<ValidateCode> codes = searchBySql(ValidateCode.class, sql);
        if(codes!=null&&codes.size()>0){
            return codes.get(0);
        }
        return null;
    }
}
