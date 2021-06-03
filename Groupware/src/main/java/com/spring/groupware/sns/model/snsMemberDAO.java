package com.spring.groupware.sns.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.groupware.member.model.MemberVO;
@Component
@Repository
public class snsMemberDAO implements IntersnsMemberDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 사원목록 가져오기
	@Override
	public List<MemberVO> getmemberList() {
		List<MemberVO> memberList = sqlsession.selectList("sns.getmemberList");
		return memberList;
	}

	// 검색어가 있는 유저목록 가져오기
	@Override
	public List<MemberVO> memberListSearch(Map<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("sns.memberListSearch",paraMap);
		return memberList;
	}

	// 정보수정하기
	@Override
	public int infochange(MemberVO membervo) {
		int n = sqlsession.update("sns.infochange", membervo);
		return n;
	}




	

}
