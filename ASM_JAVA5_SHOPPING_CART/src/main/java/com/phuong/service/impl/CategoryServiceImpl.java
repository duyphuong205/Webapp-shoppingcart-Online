package com.phuong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuong.model.Account;
import com.phuong.model.Category;
import com.phuong.repository.AccountRepository;
import com.phuong.repository.CategoryRepository;
import com.phuong.service.AccountService;
import com.phuong.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Category insert(Category model) {
		return categoryRepository.save(model);
	}

	@Override
	public Category update(Category model) {
		return categoryRepository.save(model);
	}

	@Override
	public Category getById(String id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public List<Category> getAll() {
		return categoryRepository.findAll();
	}

	@Override
	public void delete(String id) {
		categoryRepository.deleteById(id);

	}

}
