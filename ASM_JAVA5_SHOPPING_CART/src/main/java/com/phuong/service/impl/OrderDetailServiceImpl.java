package com.phuong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuong.model.OrderDetail;
import com.phuong.repository.OrderDetailRepository;
import com.phuong.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Override
	public OrderDetail insert(OrderDetail model) {
		return orderDetailRepository.save(model);
	}

	@Override
	public OrderDetail update(OrderDetail model) {
		return orderDetailRepository.save(model);
	}

	@Override
	public void delete(Long id) {
		orderDetailRepository.deleteById(id);

	}

	@Override
	public List<OrderDetail> getAll() {
		return orderDetailRepository.findAll();
	}

	@Override
	public OrderDetail getById(Long id) {
		return orderDetailRepository.findById(id).get();
	}

}
