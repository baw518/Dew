package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.QnADAO;
import org.kosta.dew.model.vo.CommentVO;
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

	@Override
	public void update(QnAVO vo) {
		qnADAO.update(vo);
		
	}

	@Override
	public void pointMinus(QnAVO vo) {
		qnADAO.pointMinus(vo);
	}



	@Override
	public void deleteContent(QnAVO vo) {
		qnADAO.deleteContent(vo);
		
	}

	@Override
	public void replyRestepPlus(QnAVO vo) {
		qnADAO.replyRestepPlus(vo);
		
	}

	@Override
	public void writeReply(QnAVO vo) {
		qnADAO.writeReply(vo);
		
	}

	@Override
	public List<CommentVO> showCommentList(int qnaNo) {
		
		return qnADAO.showCommentList(qnaNo);
	}

	@Override
	public void ajaxWriteComment(CommentVO vo) {
		qnADAO.ajaxWriteComment(vo);
		
	}

	@Override
	public void ajaxDeleteComment(CommentVO vo) {
		qnADAO.ajaxDeleteComment(vo);
		
	}

	
}
