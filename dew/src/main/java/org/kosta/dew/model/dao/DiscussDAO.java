package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;

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

}