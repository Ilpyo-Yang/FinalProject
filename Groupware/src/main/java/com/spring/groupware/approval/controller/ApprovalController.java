package com.spring.groupware.approval.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.approval.model.ApprovalVO;
import com.spring.groupware.approval.model.FileVO;
import com.spring.groupware.approval.service.InterApprovalService;
import com.spring.groupware.common.FileManager;
import com.spring.groupware.common.MyUtil;
import com.spring.groupware.member.model.MemberVO;

@Controller
public class ApprovalController {

	   @Autowired 
	   private InterApprovalService service;
	   
	   @Autowired     
	   private FileManager fileManager;   
        
   
	  // === 기안문작성 메인 === //
	  @RequestMapping(value="/approvalMain.opis")
	  public ModelAndView approvalMain(ModelAndView mav) {   	  
		 mav.setViewName("approval/approvalMain.tiles1");
		 return mav;
	  }
	  
	  
	  // === 일반결의서 === //
	  @RequestMapping(value="/approvalForm1.opis")
	  public ModelAndView approvalForm1(ModelAndView mav) {
		 String today = MyUtil.getToday();
		 String fileNo = service.getFileNo(); 
		 List<MemberVO> memberList = service.getMemberList(); 
		 
		 mav.addObject("today",today);
		 mav.addObject("fileNo",fileNo);
		 mav.addObject("memberList",memberList);
		 mav.setViewName("approval/approvalForm1.tiles1");
		 return mav;
	  }
	  
	  
	  // === 지출결의서 === //
	  @RequestMapping(value="/approvalForm2.opis")
	  public ModelAndView approvalForm2(ModelAndView mav) { 
		 String today = MyUtil.getToday();
		 String fileNo = service.getFileNo(); 
		 List<MemberVO> memberList = service.getMemberList(); 
		 
		 mav.addObject("today",today);
		 mav.addObject("fileNo",fileNo);
		 mav.addObject("memberList",memberList); 
		 mav.setViewName("approval/approvalForm2.tiles1");
		 return mav;
	  }
	  
	  
	  // === 휴가계획서 === //
	  @RequestMapping(value="/approvalForm3.opis")
	  public ModelAndView approvalForm3(ModelAndView mav) {   	  
		 String today = MyUtil.getToday();
		 String fileNo = service.getFileNo(); 
		 List<MemberVO> memberList = service.getMemberList(); 
		 
		 mav.addObject("today",today);
		 mav.addObject("fileNo",fileNo);
		 mav.addObject("memberList",memberList); 
		 mav.setViewName("approval/approvalForm3.tiles1");
		 return mav;
	  }
	    
	  
	  // === 모달창에 입력될 전체 사원명 가져오기  === //
	  @RequestMapping(value="/getMemberList.opis")
	  public String getMemberList(HttpServletRequest request, ModelAndView mav) {
		 List<MemberVO> memberList = service.getMemberList(); 
		 JSONObject jsonObj = new JSONObject();
		 jsonObj.put("memberList", memberList); 		
		 return jsonObj.toString();    		 
	  }
	  
	  
	  // 결재요청 정보 저장하기 
	  @RequestMapping(value="/approvalSubmitForm.opis", method= {RequestMethod.POST})
	  public ModelAndView approvalSubmitForm(MultipartHttpServletRequest mrequest, ApprovalVO avo, FileVO fvo, ModelAndView mav) {
		
		String ap_seq = mrequest.getParameter("ap_seq");
		String fk_apform_no = mrequest.getParameter("fk_apform_no");
		String fk_mbr_seq = mrequest.getParameter("fk_mbr_seq");
		String ap_approver = mrequest.getParameter("ap_approver");
		String ap_manage_approver = mrequest.getParameter("ap_manage_approver");
		String ap_referrer = mrequest.getParameter("ap_referrer");
		String ap_title = mrequest.getParameter("ap_title");
		String ap_contents = mrequest.getParameter("ap_contents");

		avo.setAp_seq(ap_seq);
		avo.setFk_mbr_seq(fk_mbr_seq);
		avo.setFk_apform_no(fk_apform_no);
		avo.setAp_approver(ap_approver);
		avo.setAp_manage_approver(ap_manage_approver);
		avo.setAp_referrer(ap_referrer);
		avo.setAp_title(ap_title);
		avo.setAp_contents(ap_contents);
		
		/* MultipartFile attach = fvo.getAttach(); */
		
		List<MultipartFile> fileList = mrequest.getFiles("attach");
		
		int n1=0, n2=0;
		List<FileVO> fvoList = new ArrayList<>();
		
		// 첨부파일이 있는 경우
		if(fileList.size()>0) {
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/"); 			
			String path = root+"resources"+File.separator+"files";
			String ap_detail_filename = "";	
			byte[] bytes = null;
			
			long ap_fileSize = 0;
			
			for (MultipartFile mf : fileList) {
				
				try {
					bytes = mf.getBytes(); // 첨부파일의 내용물을 읽어오는 것
					
					String ap_filename = mf.getOriginalFilename();
					
					ap_detail_filename = fileManager.doFileUpload(bytes, ap_filename, path);
					
					fvo.setFk_ap_seq(ap_seq);
					fvo.setAp_detail_filename(ap_detail_filename);
					fvo.setAp_filename(ap_filename);
					
					ap_fileSize = mf.getSize();
					fvo.setAp_fileSize(String.valueOf(ap_fileSize));
					
					fvoList.add(fvo);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
					
		}
		
		String message="", loc="";
		
		if(fileList.size()==0) {	// 첨부파일이 없는 경우라면
			n1 = service.submitApproval(avo); 
			
			if(n1==1) {	// 결재요청 성공시
				message = "결재요청에 성공!";
				loc = mrequest.getContextPath()+"/approvalProgress.opis";   
			}
			else {	// 결재요청 실패시
				message = "결재요청에 실패!";
				loc = mrequest.getContextPath()+"/approvalMain.opis";
			}

		} 
		else {	// 첨부파일이 있는 경우라면
			n1 = service.submitApproval(avo); 
			n2 = service.submitAttachedApproval(fvoList); 
			
			if(n1==1 && n2==1) {	// 결재요청 성공시
				message = "결재요청에 성공!";
				loc = mrequest.getContextPath()+"/approvalProgress.opis";	    
			}
			else {	// 결재요청 실패시
				message = "결재요청에 실패!";
				loc = mrequest.getContextPath()+"/approvalMain.opis";
			}

		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
	 	return mav; 
		
	  }
	  
	  
	  // === 결재대기문서 === //
	  @RequestMapping(value="/approvalNeeded.opis")
	  public ModelAndView approvalNeeded(ModelAndView mav) {   	  
		 mav.setViewName("approval/approvalNeeded.tiles1");
		 return mav;
	  }
	  
	  
	  // === 서명관리 === //
	  @RequestMapping(value="/sign.opis")
	  public ModelAndView sign(ModelAndView mav) {   	  
		 mav.setViewName("approval/sign.tiles1");
		 return mav;
	  }
	  

}