package com.spring.groupware.approval.model;

import java.util.List;
import java.util.Map;

import com.spring.groupware.member.model.MemberVO;

public interface InterApprovalDAO {

	// 문서번호 가져오기
	String getFileNo();

	// 모달창에 입력될 전체 사원명 가져오기
	List<MemberVO> getMemberList();

	// 결재요청 정보 저장하기
	int submitApproval(ApprovalVO avo);
	
	// 첨부파일 정보 결재요청
	int submitAttachedApproval(List<Map<String, String>> fileInfoList);

	// 결재대기 문서 가져오기
	List<ApprovalVO> getApprovalNeededList(String managePerson);

	// 결재요청한 문서 가져오기
	List<ApprovalVO> getApprovalSubmitList(String fk_mbr_seq);

}