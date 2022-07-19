package com.phuong.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.phuong.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

	@Query("select o from Order o where concat(o.account.username,o.address,o.phone) like %?1%")
	Page<Order> findByKeyword(String keyword, Pageable pageable);

	@Query("select o from Order o where o.account.username = ?1")
	List<Order> findAllOrderByUsername(String username);
}
