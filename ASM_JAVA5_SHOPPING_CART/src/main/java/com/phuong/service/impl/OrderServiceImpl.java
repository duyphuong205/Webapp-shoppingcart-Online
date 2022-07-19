package com.phuong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuong.model.Order;
import com.phuong.repository.OrderRepository;
import com.phuong.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepository orderRepository;

	@Override
	public Order insert(Order model) {
		return orderRepository.save(model);
	}

	@Override
	public Order update(Order model) {
		return orderRepository.save(model);
	}

	@Override
	public void delete(Long id) {
		orderRepository.deleteById(id);

	}

	@Override
	public List<Order> getAll() {
		return orderRepository.findAll();
	}

	@Override
	public Order getById(Long id) {
		return orderRepository.findById(id).get();
	}

}
