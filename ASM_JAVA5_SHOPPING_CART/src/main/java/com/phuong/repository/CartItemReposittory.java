package com.phuong.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.phuong.model.CartItem;

public interface CartItemReposittory extends JpaRepository<CartItem, Integer> {

	@Query("select c from CartItem c where concat(c.name,c.account.username) like %?1%")
	Page<CartItem> findByKeyword(String keyword, Pageable pageable);
}
