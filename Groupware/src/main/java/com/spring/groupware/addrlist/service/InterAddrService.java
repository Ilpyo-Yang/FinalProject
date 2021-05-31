package com.spring.groupware.addrlist.service;

import java.util.List;
import java.util.Map;

import com.spring.groupware.addrlist.model.AddrVO;

public interface InterAddrService {

	// 주소록 작성
	int add(AddrVO addrvo);

	// 총 주소록 개수
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 리스트
	List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap);

	// 주소록 검색
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 주소록 조회
	AddrVO getView(String addr_seq);

	// 주소록 정보 수정
	int edit(AddrVO addrvo);

	// 주소록 삭제
	int del(Map<String, String> paraMap);


}
