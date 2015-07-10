package org.kosta.dew.model.service;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.RankingDAO;
import org.springframework.stereotype.Service;

@Service
public class RankingServiceImpl implements RankingService {
	@Resource
	private RankingDAO aopDAO;

	@Override
	public void memberUpContribution(String id) {
		aopDAO.memberUpContribution(id);
		
	}
}
