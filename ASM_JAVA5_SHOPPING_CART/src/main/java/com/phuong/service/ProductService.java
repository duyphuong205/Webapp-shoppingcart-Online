package com.phuong.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.phuong.model.Product;

public interface ProductService {

	List<Product> getAll();

	Product insert(Product model);

	Product update(Product model);

	Product getById(Integer id);

	void delete(Integer id);

	Page<Product> findProductByCategoryId(String id, Pageable pageable);
}
