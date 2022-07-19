package com.phuong.service;

import javax.mail.MessagingException;

import com.phuong.model.MailInfo;

public interface MailService {

	void send(MailInfo mail_info) throws MessagingException;

	void send(String to, String subject, String body) throws MessagingException;
}
