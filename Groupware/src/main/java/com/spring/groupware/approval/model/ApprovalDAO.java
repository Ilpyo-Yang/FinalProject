package com.spring.groupware.approval.model;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.groupware.member.model.MemberVO;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;


@Component
@Repository
public class ApprovalDAO implements InterApprovalDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 원격 DB에 연결

	// 문서번호 가져오기
	@Override
	public String getFileNo() {
		int fileNo = sqlsession.selectOne("approval.getFileNo");
		return String.valueOf(fileNo);		
	}

	// 모달창에 입력될 전체 사원명 가져오기
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = sqlsession.selectList("approval.getMemberList");
		return memberList;
	}
	

	

}
