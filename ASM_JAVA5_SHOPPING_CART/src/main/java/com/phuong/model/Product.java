package com.phuong.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String image;
	private Double price;
	private Date createdate;
	private Boolean avaiable;
	private String description;
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderdetails;
	@ManyToOne
	@JoinColumn(name = "categoryid")
	Category category;
	@OneToMany(mappedBy = "product",cascade = CascadeType.ALL)
	List<CartItem> cartItems;
}
