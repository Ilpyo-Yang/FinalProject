package com.spring.groupware.workmanage.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class WorkmanageDAO implements InterWorkmanageDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	// == 업무 등록 페이지에서 나의 할일 등록하기 == // 
	@Override
	public int workAddTodoEnd(TodoVO tdvo) {
		int n = sqlsession.insert("workmanage.workAddTodoEnd", tdvo);
		return n;
	}
	
	// == 나의 할일 리스트 페이지 보여주기 (전체) == // 
	@Override
	public List<TodoVO> todoList(String fk_mbr_seq) {
		List<TodoVO> todoList = sqlsession.selectList("workmanage.todoList", fk_mbr_seq);
		return todoList;
	}

	// == 선택한 나의 할일 상세 보기 == // 
	@Override
	public TodoVO showDetailTodo(Map<String, String> paraMap) {
		TodoVO tdvo = sqlsession.selectOne("workmanage.showDetailTodo", paraMap);
		return tdvo;
	}

	// == 업무(요청,보고) 등록하기 == //   
	@Override
	public int workAddEnd(WorkVO workvo) {
		int n = sqlsession.insert("workmanage.workAddEnd", workvo);
		return n;
	}
	
	

}
