package com.spring.groupware.insa.model;

import java.util.List;


public interface InterInsaDAO {

	// 인사정보 등록하기
	int insaRegister1End(InsaVO insavo, int seq);

	// 멤버 리스트 가져오기
	List<InsaVO> getInsaList(String category);

	// 시퀀스 가져오기
	int getSequence();
	
	// view1할 멤버 정보 가져오기
	InsaVO getInsaView1(String seq);

	// view2할 멤버 정보 가져오기
	List<InsaVO> getEduList(String seq);


}
