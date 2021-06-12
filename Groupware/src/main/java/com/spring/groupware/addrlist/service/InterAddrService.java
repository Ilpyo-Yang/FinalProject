package com.spring.groupware.addrlist.service;

import java.util.List;
import java.util.Map;

import com.spring.groupware.addrlist.model.AddrGroupVO;
import com.spring.groupware.addrlist.model.AddrVO;

public interface InterAddrService {

	/*
	 	전체 주소록
	*/
	
	// 주소록 작성
	int add(AddrVO addrvo);

	// 전체 주소록 개수
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 주소록 리스트
	List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap);

	// 주소록 검색
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 주소록 조회
	AddrVO getView(String addr_seq);

	// 주소록 정보 수정
	int edit(AddrVO addrvo);

	// 주소록 삭제
	int del(Map<String, String> paraMap);

	// 개인 주소록에 추가
	int addmyAddr(Map<String,String> paraMap);


	/*
	 	개인 주소록
	*/

	// 페이징 처리한 주소록그룹 상세리스트
	List<AddrVO> myAddrlistSearchWithPaging(Map<String, String> paraMap);

	
	/*
	 	개인 주소록 관리
	*/
	
	// 페이징 처리한 주소록그룹 리스트
	List<AddrGroupVO> addrgroupListWithPaging(Map<String, String> paraMap);

	// 총 주소록 그룹 개수
	int getAddrgroupTotalCount(Map<String, String> paraMap);

	// 주소록 그룹 추가
	int addAddrgroup(AddrGroupVO agvo);

	// 주소록 그룹 삭제
	int delAddrgroup(Map<String, String> paraMap);

	

	
}
