package org.kosta.dew.model.dao;

import java.util.List;

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


}
