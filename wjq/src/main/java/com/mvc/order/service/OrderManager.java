package com.mvc.order.service;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.order.model.Order;
@Service
public class OrderManager extends BaseService<Order, Serializable>{
	public void executeCheck(Long objectId,int orderStatus) {
        String hql = "update "+Order.class.getName()+" set orderStatus=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, orderStatus);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
	
	public void updateCheckPersonId(Long objectId,Long checkPersonId) {
        String hql = "update "+Order.class.getName()+" set checkPersonId=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, checkPersonId);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
	
	public void addConfirmDate(Long objectId,Date confirmDate) {
        String hql = "update "+Order.class.getName()+" set confirmDate=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, confirmDate);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
}
