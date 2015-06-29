package org.kosta.dew.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AopDAOImpl implements AopDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void memberUpContribution(String id) {
		sqlSessionTemplate.update("aop.memberUpContribution", id);
		
	}
	
	
}
