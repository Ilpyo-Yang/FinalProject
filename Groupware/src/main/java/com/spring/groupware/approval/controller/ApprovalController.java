package com.spring.groupware.approval.controller;

import java.io.File;
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
		 mav.setViewName("approval/approvalForm2.tiles1");
		 return mav;
	  }
	  
	  
	  // === 휴가계획서 === //
	  @RequestMapping(value="/approvalForm3.opis")
	  public ModelAndView approvalForm3(ModelAndView mav) {   	  
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
	  
	  
	  // === 결재요청 저장하기  === //
	  @RequestMapping(value="/approvalSubmitForm.opis", method= {RequestMethod.POST})
	  public ModelAndView approvalSubmitForm(MultipartHttpServletRequest mrequest, ApprovalVO avo, ModelAndView mav) {
		
		String ap_seq = mrequest.getParameter("ap_seq");
		String fk_apform_no = mrequest.getParameter("fk_apform_no");
		String fk_mbr_seq = mrequest.getParameter("fk_mbr_seq");
		String ap_approver = mrequest.getParameter("ap_approver");
		String ap_manage_approver = mrequest.getParameter("ap_manage_approver");
		String ap_referrer = mrequest.getParameter("ap_referrer");

		avo.setAp_seq(ap_seq);
		avo.setFk_mbr_seq(fk_mbr_seq);
		avo.setFk_apform_no(fk_apform_no);
		avo.setAp_approver(ap_approver);
		avo.setAp_manage_approver(ap_manage_approver);
		avo.setAp_referrer(ap_referrer);
			 
		MultipartFile attach = avo.getAttach();
		
		// 첨부파일이 있는 경우
		if(!attach.isEmpty()) {
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/"); 			
			String path = root+"resources"+File.separator+"files";
			String ap_detail_filename = "";	
			byte[] bytes = null;
			
			long ap_fileSize = 0;
			
			try {
				bytes = attach.getBytes();
				// 첨부파일의 내용물을 읽어오는 것
				
				String ap_filename = attach.getOriginalFilename();
				
				ap_detail_filename = fileManager.doFileUpload(bytes, ap_filename, path);
				
				avo.setAp_detail_filename(ap_detail_filename);
				avo.setAp_filename(ap_filename);
				
				ap_fileSize = attach.getSize();
				avo.setAp_fileSize(String.valueOf(ap_fileSize));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
					
		}
		
		int n = 0;
		
		if(attach.isEmpty()) {	// 첨부파일이 없는 경우라면
			n = service.submitApproval(avo); 
		} 
		else {	// 첨부파일이 있는 경우라면
			n = service.submitAttachedApproval(avo); 
		}
		
		if(n==1) {	// 결재요청 성공시
			mav.setViewName("msg");		    
		}
		else {	// 결재요청 실패시
			mav.setViewName("msg");			
		}
		
		mav.setViewName("msg");
	 	return mav; 
	  }
	  
	  
	  // === 결재진행함 === //
	  @RequestMapping(value="/approvalProcess.opis")
	  public ModelAndView approvalProcess(ModelAndView mav) {   	  
		 mav.setViewName("approval/approvalProcess.tiles1");
		 return mav;
	  }
	  
	  
	  // === 서명관리 === //
	  @RequestMapping(value="/sign.opis")
	  public ModelAndView sign(ModelAndView mav) {   	  
		 mav.setViewName("approval/sign.tiles1");
		 return mav;
	  }
	  

}