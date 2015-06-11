package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussListVO;
import org.kosta.dew.model.vo.DiscussVO;

public interface DiscussService {

	public abstract DiscussListVO getAllDiscussList(String pageNo);

	public abstract int registerDiscussion(DiscussVO divo);

	public abstract List<DiscussVO> findDiscussContent(String no);

	public abstract List<DiscussVO> searchDisscuss(String title);

	public abstract int deleteRequestDiscuss(DiscussVO divo);

	public abstract int registerDiscussComment(CommentVO cvo);

	public abstract int updateDiscussComment(CommentVO cvo);

	public abstract int deleteDiscussComment(CommentVO cvo);

}