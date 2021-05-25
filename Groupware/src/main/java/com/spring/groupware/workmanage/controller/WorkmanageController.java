package com.spring.groupware.workmanage.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class WorkmanageController {

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

	// == 내가 한 업무 요청 조회 보여주기 == //
	@RequestMapping(value = "/sendWorkRequest.opis")
	public ModelAndView sendWorkRequest(ModelAndView mav) {
		mav.setViewName("workmanage/sendWorkRequest_view.tiles1");
		return mav;
	}

	// == 내가 한 업무 보고 조회 보여주기 == //
	@RequestMapping(value = "/sendWorkReport.opis")
	public ModelAndView sendWorkReport(ModelAndView mav) {
		mav.setViewName("workmanage/sendWorkReport_view.tiles1");
		return mav;
	}
	
	// == 업무상태 모달 페이지 보여주기 == //
	@RequestMapping(value = "/workStatusModal.opis")
	public ModelAndView workStatusModal(ModelAndView mav) {
		mav.setViewName("workmanage/workStatus_modal");
		return mav;
	}
	
}
