package com.phuong.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.phuong.model.Category;

public interface CategoryRepository extends JpaRepository<Category, String> {

	@Query("select c from Category c where concat(c.id,c.name) like %?1%")
	Page<Category> findByKeyword(String keyword , Pageable pageable);
}
