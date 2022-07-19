package com.phuong.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.phuong.model.OrderDetail;
import com.phuong.model.RevenueReport;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

	@Query("select od from OrderDetail od where od.order.id = ?1")
	List<OrderDetail> findByOrderId(Long id);
	
	// thong ke doanh thu tong hop k có điều kiện
	@Query("select new RevenueReport (o.product.category.id, o.product.name, sum(o.quantity), count(o.order.account.username), o.order.createdate, sum(o.price * o.quantity)) from OrderDetail o group by o.product.category.id, o.product.name, o.order.createdate order by sum(o.price * o.quantity) desc")
	List<RevenueReport> getRevenue();
	
	// thong ke doanh thu tong hop có tìm theo điều kiện
	@Query("select new RevenueReport (o.product.category.id, o.product.name, sum(o.quantity), count(o.order.account.username), o.order.createdate, sum(o.price * o.quantity)) from OrderDetail o where o.order.createdate BETWEEN ?1 AND ?2 group by o.product.category.id, o.product.name, o.order.createdate order by sum(o.price * o.quantity) desc")
	List<RevenueReport> getRevenueByDate(Date minDate, Date maxDate);

}
