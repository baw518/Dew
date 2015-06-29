package org.kosta.dew.model.service;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.AopDAO;
import org.springframework.stereotype.Service;

@Service
public class AopServiceImpl implements AopService {
	@Resource
	private AopDAO aopDAO;

	@Override
	public void memberUpContribution(String id) {
		aopDAO.memberUpContribution(id);
		
	}
}
