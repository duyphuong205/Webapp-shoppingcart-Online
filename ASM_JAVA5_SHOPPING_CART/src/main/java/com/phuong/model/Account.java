package com.phuong.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "account")
public class Account {
	@Id
	private String username;
	private String fullname;
	private String password;
	private String email;
	private String photo;
	private Boolean activated;
	private Boolean admin;
	@OneToMany(mappedBy = "account")
	List<Order> orders;
	@OneToMany(mappedBy = "account",cascade = CascadeType.ALL)
	List<CartItem> cartItems;
}
