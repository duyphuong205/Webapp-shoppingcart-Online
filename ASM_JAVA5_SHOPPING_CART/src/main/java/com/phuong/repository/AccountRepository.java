package com.phuong.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.phuong.model.Account;

public interface AccountRepository extends JpaRepository<Account, String>{

	@Query("select a from Account a where concat(a.username,a.fullname,a.password,a.email,a.photo) like %?1%")
	Page<Account> findByKeyword(String keyword,Pageable pageable);
	
}
