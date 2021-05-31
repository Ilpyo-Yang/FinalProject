package com.spring.groupware.addrlist.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.addrlist.model.AddrVO;
import com.spring.groupware.addrlist.model.InterAddrDAO;

@Component
@Service
public class AddrService implements InterAddrService {

	@Autowired
	private InterAddrDAO adao;

	// === 총 게시물 수 === //
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = adao.getTotalCount(paraMap);
		return n;
	}

	// === 페이징 처리한 글 목록 === //
	@Override
	public List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap) {
		List<AddrVO> addrList = adao.addrListSearchWithPaging(paraMap);
	    return addrList;
	}

	// === 글 검색 === //
	@Override
	public List<String> wordSearchShow(Map<String, String> paraMap) {
		List<String> wordList = adao.wordSearchShow(paraMap);
		return wordList;
	}
	
}
