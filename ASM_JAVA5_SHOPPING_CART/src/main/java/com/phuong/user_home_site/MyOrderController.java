package com.phuong.user_home_site;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phuong.model.Account;
import com.phuong.model.OrderDetail;
import com.phuong.repository.OrderDetailRepository;
import com.phuong.repository.OrderRepository;
import com.phuong.service.AccountService;
import com.phuong.service.OrderDetailService;
import com.phuong.service.OrderService;
import com.phuong.utils.SessionUtils;

@Controller
@RequestMapping("/home")
public class MyOrderController {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private SessionUtils session;

	@Autowired
	AccountService accountService;

	@GetMapping("/myOrder/{username}")
	public String viewMyOrder(Model model, @PathVariable("username") String username) {
		Account accCurrent = session.getAttibute("user");
		if (accCurrent != null) {
			accCurrent.setUsername(username);
			model.addAttribute("myOrders", orderRepository.findAllOrderByUsername(accCurrent.getUsername()));
		}
		return "home/myorder";
	}

	@GetMapping("/orderDetail/{id}")
	public String viewOrderDetail(Model model, @PathVariable("id") Long id) {
		List<OrderDetail> list_OrderDetail = orderDetailRepository.findByOrderId(id);
		model.addAttribute("orderDetails", list_OrderDetail);
		return "home/orderdetail";
	}

}
