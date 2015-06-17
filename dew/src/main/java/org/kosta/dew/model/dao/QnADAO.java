package org.kosta.dew.model.dao;


import java.util.List;
import java.util.Map;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.QnAGroupVO;
import org.kosta.dew.model.vo.QnAVO;

public interface QnADAO {

	public List<QnAVO> getAllList(int pageNum);

	public int getAllCount();

	public QnAVO showContent(String qnaNo);

	public void hitUpContent(String qnaNo);

	public List<QnAGroupVO> getGroupList();

	public void write(QnAVO vo);

	public void update(QnAVO vo);

	public void pointMinus(QnAVO vo);

	public void deleteContent(QnAVO vo);

	public void replyRestepPlus(QnAVO vo);

	public void writeReply(QnAVO vo);

	public List<CommentVO> showCommentList(int qnaNo);

	public void ajaxWriteComment(CommentVO vo);

	public void ajaxDeleteComment(CommentVO vo);

	public void ajaxUpdateComment(CommentVO vo);

	public String getQuestionId(int ref);

	public void allAnswerStatusThree(String questionNO);

	public void questionAnswerStatusOne(String questionNO);

	public void replyAnswerStatusTwo(String answerNO);

	public void pointPlus(QnAVO qvo);

	public List<QnAVO> getSelectedList(Map<String, String> map);

	public int getSelectedCount(String qnAGroupNo);

	public void commentReplyStepPlus(CommentVO vo);

	public void ajaxWriteCommentReply(CommentVO vo);


}
