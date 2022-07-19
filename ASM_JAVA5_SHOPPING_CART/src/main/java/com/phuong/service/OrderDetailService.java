package com.phuong.service;

import java.util.List;

import com.phuong.model.OrderDetail;

public interface OrderDetailService {

	OrderDetail insert(OrderDetail model);

	OrderDetail update(OrderDetail model);

	void delete(Long id);

	List<OrderDetail> getAll();

	OrderDetail getById(Long id);
}
