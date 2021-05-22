package com.spring.groupware.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.board.model.BoardDAO;
import com.spring.groupware.board.model.BoardVO;
import com.spring.groupware.board.model.InterBoardDAO;

//=== Service 선언 === 
//트랜잭션 처리를 담당하는곳 , 업무를 처리하는 곳, 비지니스(Business)단
@Component
@Service
public class BoardService implements InterBoardService {

	@Autowired
	private InterBoardDAO dao;

	// === 글쓰기(파일첨부가 없는 글쓰기) === //
	@Override
	public int add(BoardVO boardvo) {
		int n = dao.add(boardvo);
		return n;
	}

	// == 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	@Override
	public List<BoardVO> boardListNoSearch() {
		List<BoardVO> boardList = dao.boardListNoSearch();
		return boardList;
	}

	// === 글조회수 증가와 함께 글1개를 조회해주는 것 === //
	@Override
	public BoardVO getView(String cnotice_seq, String login_userid) {
		
		BoardVO boardvo = dao.getView(cnotice_seq); // 글1개 조회하기
		
		if(login_userid != null && boardvo != null && 
		   !login_userid.equals("admin") ) {// 관리자가 로그인하지 않았을 경우에는 조회수 증가
			
			dao.setAddReadCount(cnotice_seq); // 글 조회수 1 증가하기	
			boardvo = dao.getView(cnotice_seq);
		}
		
		return boardvo; 
	}

	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것
	@Override
	public BoardVO getViewWithNoAddCount(String cnotice_seq) {
		BoardVO boardvo = dao.getView(cnotice_seq); // 글1개 조회하기
		return boardvo;
	}

	// === 1개글 삭제하기 === //
	@Override
	public int del(Map<String, String> paraMap) {
		int n = dao.del(paraMap);
		return n;
	}
	
}
