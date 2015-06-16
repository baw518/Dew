package org.kosta.dew.model.service;

import java.util.List;
import java.util.Map;

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

	@Override
	public void ajaxUpdateComment(CommentVO vo) {
		qnADAO.ajaxUpdateComment(vo);
		
	}

	@Override
	public String getQuestionId(int ref) {
		// TODO 자동 생성된 메소드 스텁
		return qnADAO.getQuestionId(ref);
	}

	@Override
	public void replyChoose(String questionNO, String answerNO,QnAVO qvo) {
		//answer_status가 0 : 아직 채택이 안된글. 1은 답변 채택된 글의 질문글. 2는 채택된 답변글. 3은 채택안된 답변글들
		//채택할려는 답변의 질문에대한 모든글의 답변상태를 3으로 셋팅
		qnADAO.allAnswerStatusThree(questionNO);
		//질문글을 1로 셋팅
		qnADAO.questionAnswerStatusOne(questionNO);
		//답변글을 2로 셋팅
		qnADAO.replyAnswerStatusTwo(answerNO);
		
		//채택된 답변글에대한 회원의 포인트 증가
		qnADAO.pointPlus(qvo);
	}

	@Override
	public List<QnAVO> getSelectedList(Map<String, String> map) {
		
		return qnADAO.getSelectedList(map);
	}

	@Override
	public int getSelectedCount(String qnAGroupNo) {
		
		return qnADAO.getSelectedCount(qnAGroupNo);
	}

	
}
