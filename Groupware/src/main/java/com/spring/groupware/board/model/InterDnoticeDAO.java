package com.spring.groupware.board.model;

import java.util.List;
import java.util.Map;

public interface InterDnoticeDAO {

	// 글쓰기(파일첨부가 없는 글쓰기)
	int add(DnoticeVO dnoticevo);

	// == 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	List<DnoticeVO> boardListNoSearch();

	// 글 조회수 1 증가하기
	void setAddReadCount(String dnotice_seq);

	// 글 1개 조회하기
	DnoticeVO getView(String dnotice_seq);

	// 1개글 삭제하기
	int del(Map<String, String> paraMap);
	
}
