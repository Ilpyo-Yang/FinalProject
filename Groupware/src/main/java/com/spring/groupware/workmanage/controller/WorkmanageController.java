package com.spring.groupware.workmanage.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.workmanage.model.TodoVO;
import com.spring.groupware.workmanage.model.WorkVO;
import com.spring.groupware.workmanage.service.InterWorkmanageService;

@Component
@Controller
public class WorkmanageController {
	
	@Autowired	 // type에 따라 자동 객체 삽입
	private InterWorkmanageService service; 
	
	List<WorkVO> workList;
	List<TodoVO> todoList;
	
	public WorkmanageController() {
		workList = new ArrayList<>();
		
		WorkVO wmvo1 = new WorkVO("1", "1", "이두나", "김관리", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "", "0");
		WorkVO wmvo2 = new WorkVO("2", "1", "이두나", "김관리", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "", "1");
		WorkVO wmvo3 = new WorkVO("3", "1", "이두나", "김관리", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "", "2");
		
		WorkVO wmvo4 = new WorkVO("4", "2", "김관리", "이두나", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "", "3");
		WorkVO wmvo5 = new WorkVO("5", "2", "박관리", "이두나", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "", "4");
		WorkVO wmvo6 = new WorkVO("6", "2", "박관리", "이두나", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "", "5");
		
		
		workList.add(wmvo1);
		workList.add(wmvo2);
		workList.add(wmvo3);
		
		workList.add(wmvo4);
		workList.add(wmvo5);
		workList.add(wmvo6);
		
		
	}

	// == 업무 등록 페이지 보여주기 (할일, 요청, 보고 등록) == //
	@RequestMapping(value = "/workAdd.opis")
	public ModelAndView requiredLogin_workAdd(HttpServletRequest request, HttpServletResponse res, ModelAndView mav) {
		mav.setViewName("workmanage/workAdd.tiles1");
		return mav;
	}

	// == 업무 등록 중 나의 할일 등록하기   == //
	@RequestMapping(value = "/workAddTodoEnd.opis", method = {RequestMethod.POST})
	public ModelAndView workAddTodoEnd(ModelAndView mav, TodoVO tdvo) {
		
		/* 
		 * >> 추가로 해야할 일
		 * 	- 내용(contens) 등록할 때 inject처리, 개행문자 처리 => 추후 스마트 에디터 사용 예정
		 * 	- 첨부파일(addfile) 등록처리
		 */
		
		int n = service.workAddTodoEnd(tdvo);
		
		if (n == 1) {
			mav.setViewName("redirect:/todoList.opis");
		}
		else {
			String message = "일정 등록에 실패하였습니다. 다시 시도하세요";
			String loc = "javascript:history.back()";
			
			mav.addObject("message",message);
			mav.addObject("loc",loc);
			
			mav.setViewName("msg");			
		}
		
		return mav;
	}	
	
	// == 나의 할 일 리스트 보여주기 (전체) == //
	@RequestMapping(value = "/todoList.opis")
	public ModelAndView requiredLogin_todoList(HttpServletRequest request, HttpServletResponse res, ModelAndView mav) {	
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); 
		
		// 현재 로그인 되어있는 멤버의 seq를 통해 해당 멤버의 할일 리스트 가져온다.
		String fk_mbr_seq = String.valueOf(loginuser.getMbr_seq());
		List<TodoVO> todoList = service.todoList(fk_mbr_seq);
		
		mav.addObject("todoList", todoList);
		mav.setViewName("workmanage/todoList.tiles1");
		return mav;
	}
		
	// == 나의 할 일 상세 조회 페이지 == //
	@RequestMapping(value = "/showDetailTodo.opis")
	public ModelAndView showDetailTodo(ModelAndView mav, HttpServletRequest request) {

		// tbl_todolist 테이블에서 업무고유 번호에 해당하는 값 가져오기 
		String tdno = request.getParameter("tdno");
		String fk_mbr_seq = request.getParameter("mbr_seq"); 
		
		Map<String, String> paraMap = new HashedMap<>();
		paraMap.put("tdno", tdno);
		paraMap.put("fk_mbr_seq", fk_mbr_seq);
		
		TodoVO tdvo = service.showDetailTodo(paraMap);

		mav.addObject("tdvo", tdvo);
		mav.setViewName("workmanage/showDetailTodo.tiles1");
		return mav;
	}

	// ㄴ 할일 작업 
	///////////////////////////////////////////////////////////////////////////////
	// 업무 작업 ㄱ
	
	// == 업무(요청,보고) 등록하기   == //
	@RequestMapping(value = "/workAddEnd.opis", method = {RequestMethod.POST})
	public ModelAndView workAddEnd(ModelAndView mav, WorkVO workvo, HttpServletRequest request) {
		
		/* 
		 * >> 추가로 해야할 일
		 * 	- 내용(contens) 등록할 때 inject처리, 개행문자 처리 => 추후 스마트 에디터 사용 예정
		 * 	- 첨부파일(addfile) 등록처리
		 */
		
		int n = service.workAddEnd(workvo);
		String workRole = request.getParameter("workRole");
		
		if (n == 1) {
			mav.setViewName("redirect:/workList.opis?workType"+workvo.getFk_wtno()+"&workRole="+workRole);
		}
		else {
			String message = "일정 등록에 실패하였습니다. 다시 시도하세요";
			String loc = "javascript:history.back()";
			
			mav.addObject("message",message);
			mav.addObject("loc",loc);
			
			mav.setViewName("msg");			
		}
		
		return mav;
	}		
	
	
	// == 내가 한 업무 리스트 보여주기 == //
	@RequestMapping(value = "/workList.opis")
	public ModelAndView workList(ModelAndView mav, HttpServletRequest request) {
		
		String workType = request.getParameter("workType"); // 추후 DB 에서 fk_wtno 를 가지고 타입에 맞는 데이터를 가져올 것 
		String workRole = request.getParameter("workRole"); // 추후 DB 에서 역할에 맞는  데이터를 가져올 것 (발신자, 수신자, 참조자)
		
		List<WorkVO> newWorkList = new ArrayList<>();
		
		for (WorkVO wmvo : workList) {
			if (workType.equals(wmvo.getFk_wtno())) {
				newWorkList.add(wmvo);
			}
		}
		
		mav.addObject("workType", workType);
		mav.addObject("workRole", workRole); 
		mav.addObject("workList", newWorkList); // fk_wtno 에 해당하는 데이터 리스트
		
		mav.setViewName("workmanage/workList.tiles1");
		return mav;
	}

	
	// == 업무상태 모달 페이지 보여주기 == //
	@RequestMapping(value = "/workStatusModal.opis")
	public ModelAndView workStatusModal(ModelAndView mav, HttpServletRequest request) {
		
		Map<String, String> paraMap = new HashedMap<>();
		
		paraMap.put("receiver", (String) request.getAttribute("receiver"));
		mav.addObject("paraMap", paraMap);
		mav.setViewName("workmanage/workStatus_modal");
		return mav;
	}
	
	// == 읽음 확인 모달 페이지 보여주기 == //
	@RequestMapping(value = "/readCheckModal.opis")
	public ModelAndView readCheckModal(ModelAndView mav) {
		mav.setViewName("workmanage/readCheck_modal");
		return mav;
	}
	
	
	// == 내가 한 업무 상세 조회 페이지 == //
	@RequestMapping(value="/showDetailWork.opis")
	public ModelAndView showDetailWork(ModelAndView mav, HttpServletRequest request) {
		
		int wmno = Integer.parseInt(request.getParameter("wmno")); // 업무고유 번호 받아오기
		WorkVO wmvo = workList.get(wmno-1); // 추후 DB 에서 wmno 로 정보 가져오기
		
		String workType = request.getParameter("workType"); // 추후 DB 에서 fk_wtno 를 가지고 타입에 맞는 데이터를 가져올 것 
		String workRole = request.getParameter("workRole"); // 추후 DB 에서 type 에 맞는  데이터를 가져올 것 (발신자, 수신자, 참조자)
		
		mav.addObject("workType", workType);
		mav.addObject("workRole", workRole); 
		mav.addObject("wmvo", wmvo);
		
		mav.setViewName("workmanage/showDetailWork.tiles1");
		return mav;
	}
	
	
}
