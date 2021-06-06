package com.spring.groupware.addrlist.model;

import java.util.List;
import java.util.Map;

public interface InterAddrDAO {

	/*
		전체 주소록
	*/
	
	// 주소록 추가
	int add(AddrVO addrvo);
	
	// 총 주소록 수
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 주소록 목록
	List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap);

	// 주소록 검색
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 주소록 상세 
	AddrVO getView(String addr_seq);

	// 주소록 정보 수정
	int edit(AddrVO addrvo);

	// 주소록 삭제
	int del(Map<String, String> paraMap);

	/*
		개인 주소록
	*/
	
	
	/*
		개인 주소록 관리
	*/
	
	// 페이징 처리한 주소록 그룹 목록
	List<AddrGroupVO> addrgroupListWithPaging(Map<String, String> paraMap);

	// 총 주소록 그룹 수
	int getAddrgroupTotalCount(Map<String, String> paraMap);

	// 주소록 그룹 추가
	int addAddrgroup(AddrGroupVO agvo);



}
