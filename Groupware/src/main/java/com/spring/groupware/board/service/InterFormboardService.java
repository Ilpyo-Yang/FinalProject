package com.spring.groupware.board.service;

import java.util.List;
import java.util.Map;

import com.spring.groupware.board.model.FormboardVO;

public interface InterFormboardService {

	// 글쓰기(파일첨부가 없는 글쓰기)
	int add(FormboardVO formboardvo);

	// == 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	List<FormboardVO> boardListNoSearch();

	// 글조회수 증가와 함께 글1개를 조회해주는 것
	FormboardVO getView(String form_seq, String login_userid);

	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
	FormboardVO getViewWithNoAddCount(String form_seq);

	// 글 삭제
	int del(Map<String, String> paraMap);

	// 글 수정
	int edit(FormboardVO formboardvo); 
}
