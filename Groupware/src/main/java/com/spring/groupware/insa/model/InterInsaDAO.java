package com.spring.groupware.insa.model;

import java.util.List;


public interface InterInsaDAO {

	// 인사정보 등록하기
	int insaRegister1End(InsaVO insavo);

	// 멤버 리스트 가져오기
	List<InsaVO> getInsaList(String category);

	// 시퀀스 가져오기
	int getSequence();
	
	// view1할 멤버 정보 가져오기
	InsaVO getInsaView1(String seq);

	// view2할 멤버 정보 가져오기
	List<EduVO> getEduList(String seq);

	// 최종학력 가져오기
	int getMaxEduLevel(String seq);

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

    // 학력번호 가져오기
	int getEduSeq();

	// 학력 삭제하기
	int insaEduDel(String edu_seq);

    // 자격증번호 가져오기
	int getCertiSeq();

	// 자격증 삭제하기
	int insaCertiDel(String certi_seq);

	// 학력정보 가져오기
	EduVO getEduInfo(String edu_seq);

    // 학력정보 수정하기
	int eduModify(EduVO evo);

	// 자격증 정보 가져오기
	CertiVO getCertiInfo(String certi_seq);

    // 자격증정보 수정하기
	int certiModify(CertiVO cvo);

    // 개인별 급여 정보 가져오기
	PayInfoVO getPayInfo(String seq);

    // 개인별 이달 급여 정보 가져오기
	PaymentVO getPayment(String seq);

    // 개인 급여 정보 등록하기
	int payRegister(PayInfoVO pivo);

    // 개인 급여 정보 수정하기
	int payModify(PayInfoVO pivo);

    // 개인 급여 정보 삭제하기
	int payDel(String seq);


}
