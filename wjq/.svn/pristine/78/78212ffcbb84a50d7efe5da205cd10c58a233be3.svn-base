package com.mvc.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.ProductCateGory;
import com.mvc.product.service.ProductCateGoryManager;

@Controller
@RequestMapping("productCateGory")
public class ProductCateGoryController extends PageController<ProductCateGory> {
	
	@Autowired
	private ProductCateGoryManager productCateGoryManager;

	@Override
	public PageManager<ProductCateGory> getEntityManager() {
		return productCateGoryManager;
	}

	@Override
	public String getFileBasePath() {
		return "product/";
	}
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		//获得商品分类编号
		this.getProductCateGorys(request);
		return super.handlePage(request, page);
	}
	
	@Override
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
		//获得商品分类编号
		this.getProductCateGorys(request);
		return super.handleEdit(request, response, objectId);
	}
	
	public void getProductCateGorys(HttpServletRequest request){
		//获得商品分类编号
		List<ProductCateGory> productCateGorys=productCateGoryManager.getAll();
		request.setAttribute("productCateGorys", productCateGorys);
	}
	
	
}
