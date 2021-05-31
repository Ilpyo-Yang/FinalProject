package com.spring.groupware.addrlist.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.addrlist.model.InterAddrDAO;

@Component
@Service
public class AddrService implements InterAddrService {

	@Autowired
	private InterAddrDAO adao;
	
}
