package com.mvc.product.web;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Product;
import com.mvc.product.service.ProductManager;

@Controller
@RequestMapping("service/product")
public class ProductController extends PageController<Product>{

	@Autowired
	private ProductManager productManager;
	
	@Autowired
	private ProductCateGoryController productCateGoryController;
	
	@Override
	public PageManager<Product> getEntityManager() {
		// TODO Auto-generated method stub
		return productManager;
	}

	@Override
	public String getFileBasePath() {
		return "product/";
	}
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		//获得商品分类编号
		productCateGoryController.getProductCateGorys(request);
		return super.handlePage(request, page);
	}
	
	@Override
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
		//获得商品分类编号
		productCateGoryController.getProductCateGorys(request);
		return super.handleEdit(request, response, objectId);
	}
	
}
