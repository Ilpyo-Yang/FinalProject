package com.spring.groupware.addrlist.service;

import java.util.List;
import java.util.Map;

import com.spring.groupware.addrlist.model.AddrVO;

public interface InterAddrService {

	// 총 게시물 개수
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 리스트
	List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap);

	// 글 검색
	List<String> wordSearchShow(Map<String, String> paraMap);

}
