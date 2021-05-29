package com.spring.groupware.insa.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

// import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.insa.model.InsaDAO;
import com.spring.groupware.insa.model.InterInsaDAO;
import com.spring.groupware.insa.model.InsaVO;


//=== #31. Service 선언 === 
//트랜잭션 처리를 담당하는곳 , 업무를 처리하는 곳, 비지니스(Business)단
@Component
@Service
public class InsaService implements InterInsaService {

	@Autowired
	private InterInsaDAO idao;

	
	// 인사정보 등록하기
	@Override
	public int insaRegister1End(InsaVO Insavo, int seq) {
		int n = idao.insaRegister1End(Insavo, seq);
		System.out.println("service => "+n);
		return n;
	}



	@Override
	public List<InsaVO> getInsaList(String category) {
		List<InsaVO> InsaList = idao.getInsaList(category);
		return InsaList;
	}


	// 시퀀스 가져오기
	@Override
	public int getSequence() {
		int seq = idao.getSequence();
		return seq;
	}



	// view1할 멤버 정보 가져오기
	@Override
	public InsaVO getInsaView1(String seq) {
		InsaVO Insavo = idao.getInsaView1(seq);
		return Insavo;
	}



	// view2할 멤버 정보 가져오기
	@Override
	public List<InsaVO> getEduList(String seq) {
		List<InsaVO> eduList = idao.getEduList(seq);
		return eduList;
	}

	
	
}
