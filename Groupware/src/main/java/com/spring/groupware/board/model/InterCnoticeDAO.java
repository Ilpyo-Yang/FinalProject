package com.spring.groupware.board.model;

import java.util.List;
import java.util.Map;

public interface InterCnoticeDAO {

	// 글쓰기(파일첨부가 없는 글쓰기)
	int add(CnoticeVO cnoticevo);

	// == 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	List<CnoticeVO> boardListNoSearch();

	// 글 조회수 1 증가하기
	void setAddReadCount(String cnotice_seq);

	// 글 1개 조회하기
	CnoticeVO getView(String cnotice_seq);

	// 1개글 삭제하기
	int del(Map<String, String> paraMap);

	// 1개글 수정하기
	int edit(CnoticeVO cnoticevo);
	
}
