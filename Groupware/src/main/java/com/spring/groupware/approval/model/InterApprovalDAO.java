package com.spring.groupware.approval.model;

import java.util.List;
import java.util.Map;

import com.spring.groupware.member.model.MemberVO;

public interface InterApprovalDAO {

	// 문서번호 가져오기
	String getFileNo();

	// 모달창에 입력될 전체 사원명 가져오기
	List<MemberVO> getMemberList();

	// 첨부파일 없는 결재요청
	int submitApproval(ApprovalVO avo);
	
	// 첨부파일 있는 결재요청
	int submitAttachedApproval(ApprovalVO avo);

}
