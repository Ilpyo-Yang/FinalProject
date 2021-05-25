package com.spring.groupware.schedule.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class ScheduleDAO implements InterScheduleDAO {

	private SqlSessionTemplate sqlsession;
	
}
