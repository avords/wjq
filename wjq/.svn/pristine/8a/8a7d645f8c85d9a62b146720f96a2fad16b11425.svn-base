package com.mvc.base.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.base.model.CooperativeEnterprise;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;


@Service
public class CooperativeEnterpriseManager extends BaseService<CooperativeEnterprise, Serializable> {
	
	@SuppressWarnings("unchecked")
	public List<CooperativeEnterprise> getCooperativeEnterprise(PageSearch pageSearch,Integer serviceType,Long serviceDirectionId){
        String sql = "select count(*) from " + getActualArgumentType().getName() + " A where 1=1 ";
        if(serviceType!=null&&serviceType!=0){
            sql=sql+" and A.serviceType="+serviceType;
        }
        if(serviceDirectionId!=null&&serviceDirectionId!=0){
            sql=sql+" and A.objectId in ( select enterpriseId from B_ENTERPRISE_TO_SERVICE B where B.serviceDirectionId ="+serviceDirectionId+")";
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
        List<CooperativeEnterprise> list= searchAllCooperativeEnterprise(serviceType,serviceDirectionId,begin,pageSize);
        return list;
    }

	@SuppressWarnings("unchecked")
    public List<CooperativeEnterprise> searchAllCooperativeEnterprise(Integer serviceType,Long serviceDirectionId,Integer begin,Integer limited) {
        String sql = "select A from " + getActualArgumentType().getName() + " A where 1=1 ";
        if(serviceType!=null&&serviceType!=0){
            sql=sql+" and A.serviceType="+serviceType;
        }
        if(serviceDirectionId!=null&&serviceDirectionId!=0){
            sql=sql+" and A.objectId in ( select enterpriseId from B_ENTERPRISE_TO_SERVICE B where B.serviceDirectionId ="+serviceDirectionId+")";
        }
//        sql=sql+" order by A.isTop asc,A.latestReplyDate desc";

        Session session = getSession();
        Query query = session.createQuery(sql);
        if (null != begin) {
            query.setFirstResult(begin);
        }
        if (null != limited) {
            query.setMaxResults(limited);
        }
        List<CooperativeEnterprise> list = query.list();
        return list;
    }

}
