package com.mvc.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.ProductPicture;
import com.mvc.product.service.ProductPictureManager;

@Controller
@RequestMapping("productyPicture")
public class ProductPictureController extends PageController<ProductPicture>{

	@Autowired
	private ProductPictureManager productPictureGoryManager;

	@Override
	public PageManager<ProductPicture> getEntityManager() {
		return productPictureGoryManager;
	}

	@Override
	public String getFileBasePath() {
		// TODO Auto-generated method stub
		return "product/";
	}

}
