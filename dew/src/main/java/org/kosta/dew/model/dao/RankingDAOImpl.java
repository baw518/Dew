package org.kosta.dew.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RankingDAOImpl implements RankingDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void memberUpContribution(String id) {
		sqlSessionTemplate.update("aop.memberUpContribution", id);
		
	}
	
	
}
