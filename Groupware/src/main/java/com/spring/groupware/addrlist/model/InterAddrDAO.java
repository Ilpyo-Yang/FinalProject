package com.spring.groupware.addrlist.model;

import java.util.List;
import java.util.Map;

public interface InterAddrDAO {

	// 총 주소록 수
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 주소록 목록
	List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap);

	// 주소록 검색
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 주소록 상세 
	AddrVO getView(String addr_seq);


}
