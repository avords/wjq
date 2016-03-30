package com.mvc.order.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.order.model.OrderDetails;
@Service
public class OrderDetailsManager extends BaseService<OrderDetails, Serializable>{

	public List<OrderDetails> searchOrderDetailsByOrderId(Long orderId) {
		@SuppressWarnings("rawtypes")
        Class entityClass = getActualArgumentType();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT A FROM  ").append(entityClass.getName()).append(" A WHERE ").append("orderId=?");
		return super.searchBySql(sql.toString(), orderId);
	}


}
