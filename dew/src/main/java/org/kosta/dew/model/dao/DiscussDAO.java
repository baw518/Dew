package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.discussionRequestVO;

public interface DiscussDAO {

	public abstract List<DiscussVO> getAllDiscussList(String pageNo);

	public abstract int registerDiscussion(DiscussVO dsvo);

	public abstract DiscussVO findDiscussContent(int no);

	public abstract List<DiscussVO> searchDisscuss(String title);

	public abstract int deleteRequestDiscuss(DiscussVO dsvo);

	public abstract int registerDiscussComment(CommentVO cvo);

	public abstract int updateDiscussComment(CommentVO cvo);

	public abstract int deleteDiscussComment(String no);

	public abstract int totalContent();

	public abstract List<CommentVO> findDiscussComment(int discussionNo);

	public abstract CommentVO findDiscussCommentByNo(String no);

	public abstract void updateCount(int no);

	public abstract void commentReplyStepPlus(CommentVO vo);

	public abstract void ajaxWriteCommentReply(CommentVO vo);

	public abstract void delete(String no);

	public abstract void deleteRequest(discussionRequestVO vo);

	public abstract void deleteDiscussRequest(String no);

	public abstract discussionRequestVO findDeleteRequest(int discussionNo);

	public abstract void insertRequest(discussionRequestVO vo);

	public abstract void insertDiscussRequest(String no);


}