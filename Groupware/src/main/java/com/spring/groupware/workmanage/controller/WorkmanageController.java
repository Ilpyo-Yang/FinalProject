package com.spring.groupware.workmanage.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.workmanage.model.TodoVO;
import com.spring.groupware.workmanage.model.WorkMemberVO;
import com.spring.groupware.workmanage.model.WorkVO;
import com.spring.groupware.workmanage.service.InterWorkmanageService;

@Component
@Controller
public class WorkmanageController {
	
	@Autowired	 // type에 따라 자동 객체 삽입
	private InterWorkmanageService service; 
	
	// == 업무 등록 페이지 보여주기 (할일, 요청, 보고 등록) == //
	@RequestMapping(value = "/workAdd.opis")
	public ModelAndView requiredLogin_workAdd(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		
		mav.setViewName("workmanage/workAdd.tiles1");
		return mav;
	}
	
	// === #108. 검색어 입력시 자동글 완성하기 3 === //
	@ResponseBody
	@RequestMapping(value = "/memberSearchShow.opis", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String memberSearchShow(HttpServletRequest request) {

//		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");

		
		Map<String, String> paraMap = new HashMap<>();
//		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);

		// 담당자, 참조자 지정하기 위한 우선멤버 가져오기
		List<MemberVO> memberList = service.memberSearchShow(paraMap);
		
		JSONArray jsonArr = new JSONArray(); // []

		if (memberList != null) {
			for (MemberVO member : memberList) {
				JSONObject jsonObj = new JSONObject(); // {}
//				jsonObj.put("seq", member.getMbr_seq());
				jsonObj.put("word", member.getMbr_name());

				jsonArr.put(jsonObj);
			}
		}

		return jsonArr.toString();
		// "[]" 또는
		// "[{"word":"글쓰기 java 연습입니다"},{"word":"글쓰기 두번째 JaVa 연습입니다"}]"
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
	public ModelAndView requiredLogin_todoList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {	
		
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
	public ModelAndView requiredLogin_showDetailTodo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

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
//		System.out.println("getRequester: " + workvo.getRequester()); // getRequester: 김정수
//		System.out.println("getReceivers: " + workvo.getReceivers()); // receiverSeqs: 김고양,김초코,김산타
		
		String wmno = service.getWorkno(); // 채번해오기 
		workvo.setWmno(wmno);

		// 업무관리자 테이블에 넣어줄 것
		List<WorkMemberVO> workmbrList = new ArrayList<>();
		String requesterSeq = request.getParameter("requesterSeq");
		String receiverSeqs = request.getParameter("receiverSeqs");
		String referrerSeqs = request.getParameter("referrerSeqs");
		
		// 요청자 정보 (requester) 
		WorkMemberVO mbr = new WorkMemberVO();
		mbr.setFk_wrno("1");
		mbr.setFk_mbr_seq(requesterSeq);
		workmbrList.add(mbr);
		
		// 수신자 정보 (receivers)
		String[] mbrSeqList = receiverSeqs.split(",");
		for (String mbrSeq: mbrSeqList) {
			mbr = new WorkMemberVO();
			mbr.setFk_wrno("2");
			mbr.setFk_mbr_seq(mbrSeq);
			System.out.println("rev mbrSeq : " + mbrSeq);
			workmbrList.add(mbr);
		}
		
		// 참조자 정보 (referrers)
		if (!"".equals(referrerSeqs)) {
			mbrSeqList = referrerSeqs.split(",");
			for (String mbrSeq: mbrSeqList) {
				mbr = new WorkMemberVO();
				mbr.setFk_wrno("3");
				mbr.setFk_mbr_seq(mbrSeq);
				System.out.println("ref mbrSeq : " + mbrSeq);
				workmbrList.add(mbr);
			}
		}
	

		int n = service.workAddEnd(workvo, workmbrList); // 업무테이블에 삽입
		
		if (n == 1) {
			String fk_wrno = request.getParameter("fk_wrno");
			mav.setViewName("redirect:/workList.opis?workType="+workvo.getFk_wtno()+"&workRole="+fk_wrno);
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
	
	
	// == 업무 리스트 보여주기 == //
	@RequestMapping(value = "/workList.opis")
	public ModelAndView requiredLogin_workList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); 
		
		// 현재 로그인 되어있는 멤버의 seq를 통해 해당 멤버의 할일 리스트 가져온다.
		String userId = String.valueOf(loginuser.getMbr_seq());
		String workType = request.getParameter("workType");  
		String workRole = request.getParameter("workRole");
		
		Map<String,String> paraMap = new HashedMap<>();
		
		paraMap.put("userId", userId);
		paraMap.put("workType", workType); 	// 업무요청:1, 업무보고:2
		paraMap.put("workRole", workRole);	// 내가 발신자일때:1, 수신자일때:2, 참조자일때:3 
		
		/*
		 * // == 페이징 처리해서 글 가져오기 == // int totalCount = 0; // 총 업무 건수 int sizePerPage =
		 * 5; // 한 페이당 보여주는 업무 건수 int currentShowPageNo = 1; // 현재 보여주는 페이지 번호, 디폴트 1
		 * int totalPage = 0; // 총 페이지 수
		 * 
		 * totalCount = service.getTotalCount(paraMap); totalPage = (int)
		 * Math.ceil((double) totalCount/sizePerPage);
		 * 
		 * // System.out.println("totalCount: "+ totalCount);
		 * 
		 * int startRno = 0; // 시작 행 번호 int endRno = 0; // 끝 행 번호
		 * 
		 * startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; endRno = startRno +
		 * sizePerPage - 1;
		 * 
		 * List<WorkVO> workList = null;
		 * 
		 * if (!"3".equals(workRole)) { // 발신자, 수신자 일때 workList =
		 * service.workList(paraMap); } else { // 참조자일 때 - 테이블을 조인해서 값을 가져와야함 workList =
		 * service.workListForRefer(paraMap); }
		 * 
		 * mav.addObject("workType", workType); mav.addObject("workRole", workRole);
		 * mav.addObject("workList", workList);
		 */
		
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
	public ModelAndView requiredLogin_showDetailWork(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); 
		
		// 현재 로그인 되어있는 멤버의 seq를 통해 해당 멤버의 할일 리스트 가져온다.
		String userId = String.valueOf(loginuser.getMbr_seq());
		String workType = request.getParameter("workType");  
		String workRole = request.getParameter("workRole");
		String wmno = request.getParameter("wmno"); // 업무고유 번호 받아오기
		
		Map<String,String> paraMap = new HashedMap<>();
		
		paraMap.put("userId", userId);
		paraMap.put("workType", workType); 	// 업무요청:1, 업무보고:2
		paraMap.put("workRole", workRole);	// 내가 발신자일때:1, 수신자일때:2, 참조자일때:3 
		paraMap.put("wmno", wmno);
		
		WorkVO workvo = service.showDetailWork(paraMap);
		
		mav.addObject("workType", workType);
		mav.addObject("workRole", workRole); 
		mav.addObject("workvo", workvo);
		
		mav.setViewName("workmanage/showDetailWork.tiles1");
		return mav;
	}
	
	
	
}
