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

	
	// === 주소록 추가 === //
	@Override
	public int add(AddrVO addrvo) {
		int n =  sqlsession.insert("address.addrAdd", addrvo);
		return n;
	}
	
	// === 총 등록 주소록 수 === //
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("address.getAddrTotalCount", paraMap);
		return n;
	}

	// === 페이징 처리한 주소록 목록 === //
	@Override
	public List<AddrVO> addrListSearchWithPaging(Map<String, String> paraMap) {
		List<AddrVO> addrList = sqlsession.selectList("address.addrListSearchWithPaging", paraMap);		
		return addrList;
	}

	// === 주소록 검색 === //
	@Override
	public List<String> wordSearchShow(Map<String, String> paraMap) {
		List<String> addrList = sqlsession.selectList("address.addrWordSearchShow", paraMap);
		return addrList;
	}

	// === 주소록 상세 조회 === //
	@Override
	public AddrVO getView(String addr_seq) {
		AddrVO addrvo = sqlsession.selectOne("address.getAddrView", addr_seq);
		return addrvo;
	}

	// === 주소록 정보 수정 === //
	@Override
	public int edit(AddrVO addrvo) {
		int n = sqlsession.update("address.editAddr",addrvo);		
		return n;
	}

	// === 주소록 삭제 === //
	@Override
	public int del(Map<String, String> paraMap) {
		int n = sqlsession.delete("address.delAddr",paraMap);		
		return n;
	}

	
	

}
