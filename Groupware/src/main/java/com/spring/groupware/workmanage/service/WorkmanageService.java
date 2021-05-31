package com.spring.groupware.workmanage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.workmanage.model.InterWorkmanageDAO;
import com.spring.groupware.workmanage.model.TodoVO;

@Component
@Service
public class WorkmanageService implements InterWorkmanageService {

	@Autowired
	private InterWorkmanageDAO dao;
	
	// == 업무 등록 페이지에서 나의 할일 등록하기 == // 
	@Override
	public int workAddTodoEnd(TodoVO tdvo) {
		int n = dao.workAddTodoEnd(tdvo);
		return n;
	}

	// == 나의 할일 리스트 페이지 보여주기 (전체) == // 
	@Override
	public List<TodoVO> todoList(String fk_mbr_seq) {
		List<TodoVO> todoList = dao.todoList(fk_mbr_seq);
		return todoList;
	}

	// == 선택한 나의 할일 상세 보기 == // 
	@Override
	public TodoVO showDetailTodo(Map<String, String> paraMap) {
		TodoVO tdvo = dao.showDetailTodo(paraMap);
		return tdvo;
	}

}
