package com.spring.groupware.commute.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.commute.model.CommuteVO;
import com.spring.groupware.commute.model.InterCommuteDAO;

@Component
@Service
public class CommuteService implements InterCommuteService {

	@Autowired
	private InterCommuteDAO cdao;

	// 출근 등록
	@Override
	public int startWork(CommuteVO cmtvo) {
		int n = cdao.startWork(cmtvo);
		return n;
	}

	// 퇴근 등록
	@Override
	public int endWork(CommuteVO cmtvo) {
		int n = cdao.endWork(cmtvo);
		return n;
	}

	// 출근 상태 조회
	@Override
	public CommuteVO getCmtStatus(String fk_mbr_seq) {
		CommuteVO cmtvo = cdao.getCmtStatus(fk_mbr_seq);
		return cmtvo;
	}

	@Override
	public List<CommuteVO> cmtList(Map<String, String> paraMap) {
		List<CommuteVO> cmtList = cdao.cmtList(paraMap);
		return cmtList;
	}

	
}
