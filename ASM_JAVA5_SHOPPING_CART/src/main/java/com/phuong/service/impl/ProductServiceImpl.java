package com.phuong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.phuong.model.Product;
import com.phuong.repository.ProductRepository;
import com.phuong.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<Product> getAll() {
		return productRepository.findAll();
	}

	@Override
	public Product insert(Product model) {
		return productRepository.save(model);
	}

	@Override
	public Product update(Product model) {
		return productRepository.save(model);
	}

	@Override
	public Product getById(Integer id) {
		return productRepository.findById(id).get();
	}

	@Override
	public void delete(Integer id) {
		productRepository.deleteById(id);

	}

	@Override
	public Page<Product> findProductByCategoryId(String id,Pageable pageable) {
		return productRepository.findByCategoryId(id,pageable);
	}

}
