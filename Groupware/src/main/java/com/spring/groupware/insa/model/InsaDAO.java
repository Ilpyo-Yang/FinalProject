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
	public int insaRegister1End(InsaVO insavo) {
		int n=0;

		n = sqlsession.insert("insa.insaRegisterEnd", insavo);
			
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
	public List<EduVO> getEduList(String seq) {
		List<EduVO> eduList = sqlsession.selectList("insa.getEduList", seq);
		return eduList;
	}


	// 최종학력 가져오기
	@Override
	public String getMaxEduLevel(String seq) {
		String maxEduLevel = sqlsession.selectOne("insa.getMaxEduLevel", seq);
		return maxEduLevel;
	}


	// 자격증 리스트 가져오기
	@Override
	public List<CertiVO> getCertiList(String seq) {
		List<CertiVO> certiList = sqlsession.selectList("insa.getCertiList", seq);
		return certiList;
	}


	// 학력정보 가져오기
	@Override
	public int getEduNum(String seq) {
		int n = sqlsession.selectOne("insa.getEduNum", seq);
		return n;
	}



	// 자격증정보 가져오기
	@Override
	public int getCertiNum(String seq) {
		int m = sqlsession.selectOne("insa.getCertiNum", seq);
		return m;
	}



	// 학력정보 입력하기
	@Override
	public int insaRegister2EndEdu(EduVO evo) {
		int n = sqlsession.insert("insa.insaRegister2EndEdu", evo);
		return n;
	}


	// 자격증정보 입력하기
	@Override
	public int insaRegister2EndCerti(CertiVO cvo) {
		int m = sqlsession.insert("insa.insaRegister2EndCerti", cvo);
		return m;
	}



	// 개인별 급여 리스트 가져오기
	@Override
	public List<PaymentVO> getPaymentList(String seq) {
		List<PaymentVO> paymentList = sqlsession.selectList("insa.getPaymentList", seq);
		return paymentList;
	}



}
