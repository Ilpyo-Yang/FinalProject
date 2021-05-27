package com.spring.groupware.workmanage.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.workmanage.model.TodoVO;
import com.spring.groupware.workmanage.model.WorkManageVO;

@Component
@Controller
public class WorkmanageController {
	
	List<WorkManageVO> workList;
	List<TodoVO> todoList;
	
	public WorkmanageController() {
		workList = new ArrayList<>();
		
		WorkManageVO wmvo1 = new WorkManageVO("1", "1", "이두나", "김관리", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "", "0");
		WorkManageVO wmvo2 = new WorkManageVO("2", "1", "이두나", "김관리", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "", "1");
		WorkManageVO wmvo3 = new WorkManageVO("3", "1", "이두나", "김관리", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "", "2");
		
		WorkManageVO wmvo4 = new WorkManageVO("4", "2", "김관리", "이두나", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "", "3");
		WorkManageVO wmvo5 = new WorkManageVO("5", "2", "박관리", "이두나", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "", "4");
		WorkManageVO wmvo6 = new WorkManageVO("6", "2", "박관리", "이두나", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "", "5");
		
		
		workList.add(wmvo1);
		workList.add(wmvo2);
		workList.add(wmvo3);
		
		workList.add(wmvo4);
		workList.add(wmvo5);
		workList.add(wmvo6);
		
		todoList = new ArrayList<>();
		
		// String tdno, String fk_mbr_seq, String subject, String contents, String registerday, String deadline, String important, String fk_statno
		TodoVO tdvo1 = new TodoVO("1", "1", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "0");
		TodoVO tdvo2 = new TodoVO("2", "2", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "1");
		TodoVO tdvo3 = new TodoVO("3", "3", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "2");
		
		todoList.add(tdvo1);
		todoList.add(tdvo2);
		todoList.add(tdvo3);
		
	}

	// == 업무 등록 하기 == //
	@RequestMapping(value = "/workListAdd.opis")
	public ModelAndView workListAdd(ModelAndView mav) {
		mav.setViewName("workmanage/workListAdd.tiles1");
		return mav;
	}

	// == 할 일 리스트 보여주기 == //
	@RequestMapping(value = "/todoList.opis")
	public ModelAndView todoList(ModelAndView mav, HttpServletRequest request) {
		
		mav.addObject("todoList", todoList); // fk_wtno 에 해당하는 데이터 리스트
		mav.setViewName("workmanage/todoList.tiles1");
		return mav;
	}

	// == 내가 한 업무 리스트 보여주기 == //
	@RequestMapping(value = "/workList.opis")
	public ModelAndView workList(ModelAndView mav, HttpServletRequest request) {
		
		String fk_wtno = request.getParameter("fk_wtno"); // 추후 DB 에서 fk_wtno 를 가지고 타입에 맞는 데이터를 가져올 것 
		String type = request.getParameter("type"); // 추후 DB 에서 type 에 맞는  데이터를 가져올 것 (발신자, 수신자, 참조자)
		
		List<WorkManageVO> newWorkList = new ArrayList<>();
		
		for (WorkManageVO wmvo : workList) {
			if (fk_wtno.equals(wmvo.getFk_wtno())) {
				newWorkList.add(wmvo);
			}
		}
		
		mav.addObject("fk_wtno", fk_wtno);
		mav.addObject("type", type); 
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
		WorkManageVO wmvo = workList.get(wmno-1); // 추후 DB 에서 wmno 로 정보 가져오기
		
		String fk_wtno = request.getParameter("fk_wtno"); // 추후 DB 에서 fk_wtno 를 가지고 타입에 맞는 데이터를 가져올 것 
		String type = request.getParameter("type"); // 추후 DB 에서 type 에 맞는  데이터를 가져올 것 (발신자, 수신자, 참조자)
		
		mav.addObject("type", type); 
		mav.addObject("fk_wtno", fk_wtno);
		mav.addObject("wmvo", wmvo);
		
		mav.setViewName("workmanage/showDetailWork.tiles1");
		return mav;
	}
	
	// == 나의 할 일 상세 조회 페이지 == //
	@RequestMapping(value = "/showDetailTodo.opis")
	public ModelAndView showDetailTodo(ModelAndView mav, HttpServletRequest request) {

		int tdno = Integer.parseInt(request.getParameter("tdno")); // 업무고유 번호 받아오기
		TodoVO tdvo = todoList.get(tdno - 1); // 추후 DB 에서 wmno 로 정보 가져오기

		mav.addObject("tdvo", tdvo);

		mav.setViewName("workmanage/showDetailTodo.tiles1");
		return mav;
	}
}
