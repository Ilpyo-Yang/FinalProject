package com.spring.groupware.insa.model;

import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.groupware.insa.model.InsaVO;
@Component
@Repository
public class InsaDAO implements InterInsaDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결
	
	// 인사정보 등록하기
	@Override
	public int insaRegister1End(InsaVO insavo, int seq) {
		int n=0;
		insavo.setMbr_seq(seq);
		try {
			n = sqlsession.insert("insa.insaRegisterEnd", insavo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dao => "+n);
	//	System.out.println("mem=>"+insavo.getMbr_id());
		return n;
	}



	// 멤버정보 불러오기
	@Override
	public List<InsaVO> getInsaList(String category) {
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("category", category);
		List<InsaVO> insaList= sqlsession.selectList("insa.insaList",paraMap);
		return insaList;
	}


	@Override
	public int getSequence() {
		int seq = Integer.parseInt(sqlsession.selectOne("insa.getInsaSequence"));
		return seq;
	}


	// view1할 멤버 정보 가져오기
	@Override
	public InsaVO getInsaView1(String seq) {
		InsaVO insavo = sqlsession.selectOne("insa.getInsaView1", seq);
		return insavo;
	}

	// view2할 멤버 정보 가져오기@Override
	public List<InsaVO> getEduList(String seq) {
		List<InsaVO> eduList = sqlsession.selectList("insa.getEduList", seq);
		return eduList;
	}


}
