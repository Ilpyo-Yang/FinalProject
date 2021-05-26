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

import com.spring.groupware.workmanage.model.WorkManageVO;

@Component
@Controller
public class WorkmanageController {
	
	List<WorkManageVO> workList;
	
	public WorkmanageController() {
		workList = new ArrayList<>();
		
		WorkManageVO wmvo1 = new WorkManageVO("1", "1", "이두나", "김관리", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "", "0");
		WorkManageVO wmvo2 = new WorkManageVO("2", "1", "이두나", "김관리", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "", "1");
		WorkManageVO wmvo3 = new WorkManageVO("3", "1", "이두나", "김관리", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "", "2");
		
		WorkManageVO wmvo4 = new WorkManageVO("1", "2", "김관리", "이두나", "계약서 작성요청1", "계약서 좀 빨리 작성해주세요", "2021.04.21", "2021.05.21", "0", "", "3");
		WorkManageVO wmvo5 = new WorkManageVO("2", "2", "박관리", "이두나", "계약서 작성요청2", "계약서 좀 빨리 작성해주세요!", "2021.04.22", "2021.05.21", "0", "", "4");
		WorkManageVO wmvo6 = new WorkManageVO("3", "2", "박관리", "이두나", "계약서 작성요청3", "계약서 좀 빨리 작성해주세요!!", "2021.04.23", "2021.05.21", "0", "", "5");
		
		
		workList.add(wmvo1);
		workList.add(wmvo2);
		workList.add(wmvo3);
		
		workList.add(wmvo4);
		workList.add(wmvo5);
		workList.add(wmvo6);
	}

	// == 업무 등록 하기 == //
	@RequestMapping(value = "/worklistAdd.opis")
	public ModelAndView worklistAdd(ModelAndView mav) {
		mav.setViewName("workmanage/worklist_add.tiles1");
		return mav;
	}

	// == 할 일 리스트 보여주기 == //
	@RequestMapping(value = "/todolist.opis")
	public ModelAndView todolist(ModelAndView mav) {
		mav.setViewName("workmanage/todolist_view.tiles1");
		return mav;
	}

	// == 내가 한 업무 요청 리스트 보여주기 == //
	@RequestMapping(value = "/sendWorkList.opis")
	public ModelAndView sendWorkList(ModelAndView mav, HttpServletRequest request) {
		
		String fk_wtno = request.getParameter("fk_wtno"); 
		List<WorkManageVO> newWorkList = new ArrayList<>();
		
		for (WorkManageVO wmvo : workList) {
			if (fk_wtno.equals(wmvo.getFk_wtno())) {
				newWorkList.add(wmvo);
			}
		}
		
		mav.addObject("fk_wtno", fk_wtno); // 추후 DB 에서 fk_wtno 를 가지고 타입에 맞는 데이터를 가져올 것
		mav.addObject("workList", newWorkList); // fk_wtno 에 해당하는 데이터 리스트
		
		mav.setViewName("workmanage/sendWorkList.tiles1");
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
	
	
	// == 업무 상세 조회 페이지 == //
	@RequestMapping(value="/showDetailWork.opis")
	public ModelAndView showDetailWork(ModelAndView mav, HttpServletRequest request) {
		
		int wmno = Integer.parseInt(request.getParameter("wmno")); // 업무고유 번호 받아오기
		WorkManageVO wmvo = workList.get(wmno-1); // 추후 DB 에서 wmno 로 정보 가져오기
		
		mav.addObject("wmvo", wmvo);
		mav.addObject("fk_wtno", request.getParameter("fk_wtno"));
		
		mav.setViewName("workmanage/showDetailWork.tiles1");
		return mav;
	}
	
}
