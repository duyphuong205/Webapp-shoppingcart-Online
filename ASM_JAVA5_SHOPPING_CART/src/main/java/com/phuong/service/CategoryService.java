package com.phuong.service;

import java.util.List;

import com.phuong.model.Category;

public interface CategoryService {
	Category insert(Category model);

	Category update(Category model);

	Category getById(String id);

	List<Category> getAll();

	void delete(String id);
}
