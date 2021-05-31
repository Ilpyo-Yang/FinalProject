package com.spring.groupware.addrlist.model;

import java.util.List;
import java.util.Map;

public interface InterAddrDAO {

	// 총 게시물 수
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 글 목록
	List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap);

	// 글 검색
	List<String> wordSearchShow(Map<String, String> paraMap);


}
