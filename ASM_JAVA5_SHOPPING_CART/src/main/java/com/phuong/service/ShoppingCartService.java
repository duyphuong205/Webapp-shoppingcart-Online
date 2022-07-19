package com.phuong.service;

import java.util.Collection;

import com.phuong.model.CartItem;

public interface ShoppingCartService {

	CartItem add(Integer id);

	CartItem update(Integer id, Integer quantity);

	void remove(Integer id);

	void clear();

	Collection<CartItem> getItems();

	Integer getCounts();

	Double getAmounts();

	Double getTotals();

}
