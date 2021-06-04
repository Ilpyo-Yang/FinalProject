package com.spring.groupware.workmanage.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.groupware.member.model.MemberVO;

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

	// == 업무(요청,보고) 리스트 조회하기 == //  
	@Override
	public List<WorkVO> workList(Map<String, String> paraMap) {
		List<WorkVO> workList = sqlsession.selectList("workmanage.workList", paraMap);
		return workList;
	}

	// == 참조 업무 리스트(요청,보고) 보여주기  == //
	@Override
	public List<WorkVO> workListForRefer(Map<String, String> paraMap) {
		List<WorkVO> workList = sqlsession.selectList("workmanage.workListForRefer", paraMap);
		return workList;
	}

	// == 페이징 처리 - 총 게시물 건수 가져오기 == //
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("workmanage.getTotalCount", paraMap);
		return n;
	}

	// == 선택한 업무(요청,보고) 상세 보기 == // 
	@Override
	public WorkVO showDetailWork(Map<String, String> paraMap) {
		WorkVO workvo = sqlsession.selectOne("workmanage.showDetailWork", paraMap);  
		return workvo;
	}

	// 담당자, 참조자 지정하기 위한 우선멤버 가져오기
	@Override
	public List<MemberVO> memberSearchShow(Map<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("workmanage.memberSearchShow", paraMap);
		return memberList;
	}

	// 업무번호 채번해오기
	@Override
	public String getWorkno() {
		String wmno = sqlsession.selectOne("workmanage.getWorkno");
		return wmno;
	}

	// 업무에 해당하는 멤버 seq저장
	@Override
	public int workAddMember(WorkMemberVO workmbr) {
		int n = sqlsession.insert("workmanage.workAddMember", workmbr);
		return n;
	}

	// 마감일자지난 업무상태 변경
	@Override
	public int updateWorkStatusByTime(Map<String, String> paraMap) {
		int n = sqlsession.update("workmanage.updateWorkStatusByTime", paraMap);
		return n;
	}

	// 담당자들의 업무 정보 가져오기
	@Override
	public List<WorkMemberVO> getWorkStatusEachMember(String wmno) {
		List<WorkMemberVO> workmbrList = sqlsession.selectList("workmanage.getWorkStatusEachMember", wmno);
		return workmbrList;
	}

	// 업무 수정하기
	@Override
	public int workEditEnd(WorkVO workvo) {
		int n = sqlsession.update("workmanage.workEditEnd", workvo);
		return n;
	}

	// 업무 삭제하기
	@Override
	public int workDel(Map<String, String> paraMap) {
		int n = sqlsession.update("workmanage.workDel", paraMap);
		return n;
	}
	
	

}
