package com.spring.groupware.insa.model;

import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.groupware.member.model.MemberVO;
@Component
@Repository
public class InsaDAO implements InterInsaDAO {



	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결
	
	// 인사정보 등록하기
	@Override
	public int insaRegister1End(MemberVO membervo) {
		int n = sqlsession.insert("insa.insaRegisterEnd", membervo);
		System.out.println("mem=>"+membervo.getMbr_id());
		return n;
	}


	// 멤버정보 불러오기
	@Override
	public List<MemberVO> getMemberList(String category) {
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("category", category);
		List<MemberVO> memberList= sqlsession.selectList("insa.memberList",paraMap);
		return memberList;
	}

}
