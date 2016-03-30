package com.mvc.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.WJQConstants;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Cart;
import com.mvc.product.model.Product;
import com.mvc.product.service.CartManager;
import com.mvc.product.service.ProductManager;

@Controller
@RequestMapping("member/car")
public class CartController extends PageController<Cart>{

	@Autowired
	private CartManager carManager;
	
	@Autowired
	private ProductManager productManager;
	
	@Override
	public PageManager<Cart> getEntityManager() {
		// TODO Auto-generated method stub
		return carManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "car/";
	}
	
	@RequestMapping("getByMemberId")
	public String getByMemberId(HttpServletRequest request,ModelMap map){
		Long memberId = Long.parseLong(request.getSession().getAttribute(WJQConstants.MEMBER_ID).toString());
		
		List<Cart> cars=carManager.getByMemberId(memberId);
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT A FROM  " + Product.class.getName() + " A WHERE A.objectId in(0");
		for(Cart c : cars){
			sql.append(","+c.getProductId());
		}
		
		List<Product> products=productManager.searchBySql(sql.toString());
		
		StringBuffer json = new StringBuffer();
		json.append("{name:jack,objectId:12345},");
		for(Product p : products){
			json.append("{name:"+p.getName()+",objectId:"+p.getObjectId()+"}");
		}
		
		map.addAttribute("products", "json");
		
		return "jsonView";
	}
	
	
}
