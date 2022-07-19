package com.phuong.service;

import java.util.List;

import com.phuong.model.Account;

public interface AccountService {
	Account insert(Account model);

	Account update(Account model);

	Account getById(String id);

	List<Account> getAll();

	void delete(String id);
}
