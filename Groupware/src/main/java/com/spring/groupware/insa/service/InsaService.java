package com.spring.groupware.insa.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

// import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.insa.model.CertiVO;
import com.spring.groupware.insa.model.EduVO;
import com.spring.groupware.insa.model.InsaDAO;
import com.spring.groupware.insa.model.InterInsaDAO;
import com.spring.groupware.insa.model.PaymentVO;
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
	public int insaRegister1End(InsaVO insavo) {
		int n = idao.insaRegister1End(insavo);
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



	// view2할 학력 리스트 가져오기
	@Override
	public List<EduVO> getEduList(String seq) {
		List<EduVO> eduList = idao.getEduList(seq);
		return eduList;
	}



	// 최종학력 가져오기
	@Override
	public String getMaxEduLevel(String seq) {
		String maxEduLevel = idao.getMaxEduLevel(seq);
		return maxEduLevel;
	}


	// 자격증 리스트 가져오기
	@Override
	public List<CertiVO> getCertiList(String seq) {
		List<CertiVO> certiList = idao.getCertiList(seq);
		return certiList;
	}

	// 학력정보 가져오기
	@Override
	public int getEduNum(String seq) {
		int n = idao.getEduNum(seq);
		return n;
	}


	// 자격증정보 가져오기
	@Override
	public int getCertiNum(String seq) {
		int m = idao.getCertiNum(seq);
		return m;
	}



	// 학력정보 입력하기
	@Override
	public int insaRegister2EndEdu(EduVO evo) {
		int n = idao.insaRegister2EndEdu(evo);
		return n;
	}



	// 자격증정보 입력하기
	@Override
	public int insaRegister2EndCerti(CertiVO cvo) {
		int m = idao.insaRegister2EndCerti(cvo);
		return m;
	}



	// 개인별 급여 리스트 가져오기
	@Override
	public List<PaymentVO> getPaymentList(String seq) {
		List<PaymentVO> paymentList = idao.getPaymentList(seq);
		return paymentList;
	}



	
	
}
