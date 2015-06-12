package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.QnADAO;
import org.kosta.dew.model.vo.QnAGroupVO;
import org.kosta.dew.model.vo.QnAVO;
import org.springframework.stereotype.Service;
@Service
public class QnAServiceImpl implements QnAService{
	@Resource
	private QnADAO qnADAO;

	public List<QnAVO> getAllList(int pageNum) {

		return qnADAO.getAllList(pageNum);
	}

	@Override
	public int getAllCount() {
		
		return qnADAO.getAllCount();
	}

	@Override
	public QnAVO showContent(String qnaNo) {
		qnADAO.hitUpContent(qnaNo);
		return qnADAO.showContent(qnaNo);
	}

	@Override
	public QnAVO showContentNoHit(String qnaNo) {
		
		return qnADAO.showContent(qnaNo);
	}

	@Override
	public List<QnAGroupVO> getGroupList() {
		
		return qnADAO.getGroupList();
	}

	@Override
	public void write(QnAVO vo) {
		qnADAO.write(vo);
	}

	
}
