package com.spring.groupware.board.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class FormboardDAO implements InterFormboardDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결

	// === #56. 글쓰기(파일첨부가 없는 글쓰기) === //
	@Override
	public int add(FormboardVO formboardvo) {
		int n = sqlsession.insert("board.formAdd", formboardvo);
		return n;
	}

	// === 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	@Override
	public List<FormboardVO> boardListNoSearch() {
		List<FormboardVO> boardList = sqlsession.selectList("board.formListNoSearch");
		return boardList;
	}

	// === 글 조회수 1 증가하기 === //
	@Override
	public void setAddReadCount(String form_seq) {
		sqlsession.update("board.setFormAddHit", form_seq);
	}

	// === 글 1개 조회하기 === //
	@Override
	public FormboardVO getView(String form_seq) {
		FormboardVO formboardvo = sqlsession.selectOne("board.getFormView", form_seq);
		return formboardvo;
	}

	// === 1개글 삭제하기 === //
	@Override
	public int del(Map<String, String> paraMap) {
		int n = sqlsession.delete("board.delForm",paraMap);		
		return n;
	}

	// === 1개글 수정하기 === //
	@Override
	public int edit(FormboardVO formboardvo) {
		int n = sqlsession.update("board.editForm", formboardvo);
		return n;
	}
}
