package com.mvc.order.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.order.model.Order;
import com.mvc.order.model.OrderDetails;
import com.mvc.order.service.OrderDetailsManager;
import com.mvc.order.service.OrderManager;
import com.mvc.product.model.Product;
import com.mvc.product.service.ProductManager;
import com.mvc.security.SecurityConstants;

@Controller
@RequestMapping("order")
public class OrderController extends PageController<Order>{
	
	@Autowired
	private OrderManager orderManager;
	
	@Autowired
	private OrderDetailsManager orderDetailsManager;
	
	@Autowired
	private ProductManager productManager;
	
	@Override
	public PageManager<Order> getEntityManager() {
		return orderManager;
	}

	@Override
	public String getFileBasePath() {
		return "order/";
	}
	
	@RequestMapping("/check/{objectId}")
    public String check(HttpServletRequest request, HttpServletResponse response,@PathVariable Long objectId,int orderStatus){
		Long checkPersonId=(Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
		orderManager.updateCheckPersonId(objectId,checkPersonId);
		orderManager.executeCheck(objectId,orderStatus);
        return "redirect:/order/page";
    }
	
	@RequestMapping("/confirm/{objectId}")
    public String confirm(HttpServletRequest request, HttpServletResponse response,@PathVariable Long objectId,int orderStatus){
		Long checkPersonId=(Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
		orderManager.updateCheckPersonId(objectId,checkPersonId);
		orderManager.executeCheck(objectId,orderStatus);
		orderManager.addConfirmDate(objectId, new Date());
        return "redirect:/order/page";
    }
	
	@Override
    public String handleView(HttpServletRequest request, HttpServletResponse response, Long objectId)
            throws Exception {
        request.setAttribute(FrameworkConstants.VIEW, "1");
        if (null != objectId) {
        	Order entity =orderManager.getByObjectId(objectId);
            List<OrderDetails> orderDetailsList =orderDetailsManager.searchOrderDetailsByOrderId(objectId);
            List<Product> productList=productManager.searchProductByOrderDetails(orderDetailsList);
            request.setAttribute("entity", entity);
            request.setAttribute("orderDetailsList", orderDetailsList);
            request.setAttribute("productList", productList);
        }
        return getFileBasePath() + "viewOrder";
    }
}
