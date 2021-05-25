package com.spring.groupware.member.service;

// import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


//=== #31. Service 선언 === 
@Component
@Service
public class MemberService implements InterMemberService {

	@Override
	public int loginCheck(String id, String pwd) {
		
		return 0;
	}

	
	
	
	
	
}
