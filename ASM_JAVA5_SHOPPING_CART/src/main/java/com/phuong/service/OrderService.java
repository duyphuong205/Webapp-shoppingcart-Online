package com.phuong.service;

import java.util.List;

import com.phuong.model.Order;

public interface OrderService {

	Order insert(Order model);

	Order update(Order model);

	void delete(Long id);

	List<Order> getAll();

	Order getById(Long id);
}
