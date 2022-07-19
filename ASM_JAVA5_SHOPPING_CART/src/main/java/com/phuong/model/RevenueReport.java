package com.phuong.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class RevenueReport implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String categoryId;
	private String productName;
	private Long quantity;
	private Long usernameOrder;
	private Date dateOrder;
	private Double totalRevenue;
}
