package com.mvc.product.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.mvc.framework.service.BaseService;
import com.mvc.order.model.OrderDetails;
import com.mvc.product.model.Product;

@Service
public class ProductManager extends BaseService<Product, Serializable>{

	@Override
	public Product getByObjectId(Serializable objectId) {
		return super.getByObjectId(objectId);
	}
	
	public List<Product> searchProductByOrderDetails(List<OrderDetails> list) {
		List<Product> productList=new ArrayList<Product>();
		for (OrderDetails od : list) {
			productList.add(getByObjectId(od.getProductId()));
		}
		return productList;
	}
	
	public List<Product> searchcontent(String keyword){
		List<Product> names=null;
		String sql="SELECT * FROM PRODUCT_PROD C WHERE C.name LIKE '%"+keyword+"%' ";
		names=searchByNativeSql(Product.class,sql);
		return names;
	}
}
