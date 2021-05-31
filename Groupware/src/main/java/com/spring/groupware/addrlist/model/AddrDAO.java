package com.spring.groupware.addrlist.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class AddrDAO implements InterAddrDAO {	
	
	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결

	// === 총 게시물 수 === //
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("address.getAddrTotalCount", paraMap);
		return n;
	}

	// === 페이징 처리한 글 목록 === //
	@Override
	public List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap) {
		List<AddrVO> addrList = sqlsession.selectList("address.addrListSearchWithPaging", paraMap);		
		return addrList;
	}

	// === 글 검색 === //
	@Override
	public List<String> wordSearchShow(Map<String, String> paraMap) {
		List<String> addrList = sqlsession.selectList("address.addrWordSearchShow", paraMap);
		return addrList;
	}

	@Override
	public AddrVO getView(String addr_seq) {
		AddrVO addrvo = sqlsession.selectOne("address.getAddrView", addr_seq);
		return addrvo;
	}

}
