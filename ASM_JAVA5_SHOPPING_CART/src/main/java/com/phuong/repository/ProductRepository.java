package com.phuong.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.phuong.model.InventoryReport;
import com.phuong.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query("select p from Product p where concat(p.name,p.category.id) like %?1%")
	public Page<Product> findByKeyword(String keyword, Pageable pageable);

	@Query("select p from Product p where p.category.id = ?1")
	// or DSL query
	Page<Product> findByCategoryId(String id, Pageable pageable);

	@Query("select p from Product p where p.price BETWEEN ?1 AND ?2")
	// or DSL query
	// List<Product> findByPriceBetween(double min, double max);
	Page<Product> findByPrice(double min, double max, Pageable pageable);

	// inventory by category
	@Query("select new InventoryReport(p.category.name,sum(p.price),count(p)) from Product p Group By p.category.name Order By sum(p.price) DESC")
	List<InventoryReport> findInventoryByCategory();
}
