package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussListVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.discussionRequestVO;

public interface DiscussService {

	public abstract DiscussListVO getAllDiscussList(String pageNo);

	public abstract int registerDiscussion(DiscussVO divo);

	public abstract DiscussVO findDiscussContent(int no);

	public abstract List<DiscussVO> searchDisscuss(String title);

	public abstract int deleteRequestDiscuss(DiscussVO divo);

	public abstract int registerDiscussComment(CommentVO cvo);

	public abstract int updateDiscussComment(CommentVO cvo);

	public abstract int deleteDiscussComment(String no);

	public abstract List<CommentVO> findDiscussComment(int no);

	public abstract CommentVO findDiscussCommentByNo(String no);

	DiscussVO findDiscussContenHitUp(int no);

	public abstract void commentReplyStepPlus(CommentVO vo);

	public abstract void ajaxWriteCommentReply(CommentVO vo);

	public abstract void delete(String no);

	public abstract void deleteRequest(discussionRequestVO vo);

	public abstract void deleteDiscussRequest(String no);

	public abstract boolean findDeleteRequest(int discussionNo);

	public abstract void insertRequest(discussionRequestVO vo);


}