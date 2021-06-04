package com.spring.groupware.workmanage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.workmanage.model.InterWorkmanageDAO;
import com.spring.groupware.workmanage.model.TodoVO;
import com.spring.groupware.workmanage.model.WorkMemberVO;
import com.spring.groupware.workmanage.model.WorkVO;

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

	
	// == 업무(요청,보고) 등록하기 트랜잭션 처리  == //
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor= {Throwable.class})
	public int workAddEnd(WorkVO workvo, List<WorkMemberVO> workmbrList) {
		int n = dao.workAddEnd(workvo);
		int m = 0;
		
		if (n == 1) {
			for (WorkMemberVO workmbr: workmbrList) {
				workmbr.setFk_wmno(workvo.getWmno());
				m = dao.workAddMember(workmbr);
				
				if (m == 0) break;
			}
		}
		
		return n*m;
	}

	// == 업무 리스트(요청,보고) 보여주기 == // 
	@Override
	public List<WorkVO> workList(Map<String, String> paraMap) {
		dao.updateWorkStatusByTime(paraMap); // 마감 지난 업무상태 변경하기
		
		List<WorkVO> workList = dao.workList(paraMap);
		return workList;
	}

	// == 참조 업무 리스트(요청,보고) 보여주기  == // 
	@Override
	public List<WorkVO> workListForRefer(Map<String, String> paraMap) {
		List<WorkVO> workList = dao.workListForRefer(paraMap);
		return workList;
	}

	// == 페이징 처리 - 총 게시물 건수 가져오기 == //
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}

	// == 선택한 업무(요청,보고) 상세 보기  == //
	@Override
	public WorkVO showDetailWork(Map<String, String> paraMap) {
		WorkVO workvo = dao.showDetailWork(paraMap);
		return workvo;
	}

	// 담당자, 참조자 지정하기 위한 우선멤버 가져오기
	@Override
	public List<MemberVO> memberSearchShow(Map<String, String> paraMap) {
		List<MemberVO> memberList = dao.memberSearchShow(paraMap);
		return memberList;
	}

	// 채번 해오기
	@Override
	public String getWorkno() {
		String wmno = dao.getWorkno();
		return wmno;
	}

	// 담당자들의 업무 정보 가져오기
	@Override
	public List<WorkMemberVO> getWorkStatusEachMember(String wmno) {
		List<WorkMemberVO> workmbrList = dao.getWorkStatusEachMember(wmno);
		return workmbrList;
	}

	// 업무 수정하기
	@Override
	public int workEditEnd(WorkVO workvo) {
		int n = dao.workEditEnd(workvo);
		return n;
	}

}
