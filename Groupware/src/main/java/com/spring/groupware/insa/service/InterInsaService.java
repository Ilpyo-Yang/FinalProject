package com.spring.groupware.insa.service;

import java.util.List;

import com.spring.groupware.insa.model.CertiVO;
import com.spring.groupware.insa.model.EduVO;
import com.spring.groupware.insa.model.InsaVO;
import com.spring.groupware.insa.model.PaymentVO;

public interface InterInsaService {
	// 인사정보 등록하기
	int insaRegister1End(InsaVO insavo);

	// 멤버 리스트 가져오기
	List<InsaVO> getInsaList(String category);

	// 시퀀스 가져오기
	int getSequence();

	// view1할 멤버 정보 가져오기
	InsaVO getInsaView1(String seq);

	// view2할 학력리스트 가져오기
	List<EduVO> getEduList(String seq);

	// 최종학력 가져오기
	String getEduLevel(String seq);
	
	// 학력정보 가져오기
	int getEduNum(String seq);

	// 자격증정보 가져오기
	int getCertiNum(String seq);

	// 학력정보 입력하기
	int insaRegister2EndEdu(EduVO evo);

	// 자격증정보 입력하기
	int insaRegister2EndCerti(CertiVO cvo);

	// 자격증 리스트 가져오기
	List<CertiVO> getCertiList(String seq);

	// 개인별 급여 리스트 가져오기
	List<PaymentVO> getPaymentList(String seq);




	
	
}
