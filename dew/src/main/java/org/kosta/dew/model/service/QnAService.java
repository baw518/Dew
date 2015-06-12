package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.QnAGroupVO;
import org.kosta.dew.model.vo.QnAVO;

public interface QnAService {

	public List<QnAVO> getAllList(int pageNum);

	public int getAllCount();

	public QnAVO showContent(String qnaNo);

	public QnAVO showContentNoHit(String qnaNo);

	public List<QnAGroupVO> getGroupList();

	public void write(QnAVO vo);

	public void update(QnAVO vo);

	public void pointMinus(QnAVO vo);

	public void deleteContent(QnAVO vo);



}
