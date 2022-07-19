package com.phuong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuong.model.Account;
import com.phuong.repository.AccountRepository;
import com.phuong.service.AccountService;

@Service
public class AccoutServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public Account insert(Account model) {
		return accountRepository.save(model);
	}

	@Override
	public Account getById(String id) {
		return accountRepository.findById(id).get();
	}

	@Override
	public List<Account> getAll() {
		return accountRepository.findAll();
	}

	@Override
	public void delete(String id) {
		accountRepository.deleteById(id);

	}

	@Override
	public Account update(Account model) {
		return accountRepository.save(model);
	}

}
