package com.phuong.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.Order;
import com.phuong.model.OrderDetail;
import com.phuong.repository.OrderDetailRepository;
import com.phuong.repository.OrderRepository;
import com.phuong.service.OrderDetailService;

@Controller
@RequestMapping("/admin")
public class OrderController {

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@GetMapping("/order")
	public String viewOrder(Model model, @RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<Order> pageList = orderRepository.findAll(pageable);
		model.addAttribute("orders", pageList.getContent());
		model.addAttribute("pageNumber", pageList.getNumber());
		model.addAttribute("pageTotals", pageList.getTotalPages());
		return "admin/orderList";
	}

	@PostMapping("/order/search")
	public String orderSearch(Model model, @RequestParam("keyword") Optional<String> keyword, Pageable pageable) {
		Page<Order> pageList;
		if (keyword.isPresent()) {
			pageList = orderRepository.findByKeyword(keyword.get(), pageable);
		} else {
			pageList = orderRepository.findAll(pageable);
		}
		model.addAttribute("orders", pageList.getContent());
		model.addAttribute("pageNumber", pageList.getNumber());
		model.addAttribute("pageTotals", pageList.getTotalPages());
		return "admin/orderList";
	}

	@GetMapping("/order/orderDetail/{id}")
	public String orderDetail(Model model, @PathVariable("id") Long id) {
		List<OrderDetail> orderDetails_list = orderDetailRepository.findByOrderId(id);
		model.addAttribute("orderDetails", orderDetails_list);
		return "admin/orderDetailList";
	}
}
