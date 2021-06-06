package com.spring.groupware.approval.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.approval.model.InterApprovalDAO;
import com.spring.groupware.member.model.MemberVO;



@Component
@Service
public class ApprovalService implements InterApprovalService {
	
	// 의존객체 주입
	@Autowired
	private InterApprovalDAO adao;

	// 문서번호 가져오기
	@Override
	public String getFileNo() {
		String fileNo = adao.getFileNo();
		return fileNo;
	}

	// 모달창에 입력될 전체 사원명 가져오기
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = adao.getMemberList();
		return memberList;
	}


	
	
	
	
	
}
