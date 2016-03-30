package com.mvc.product.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;
import com.mvc.framework.service.BaseService;
import com.mvc.product.model.Cart;

@Service
public class CartManager extends BaseService<Cart, Serializable>{

	public List<Cart> getByMemberId(Long memberId) {
		return null;
		
	}

}
