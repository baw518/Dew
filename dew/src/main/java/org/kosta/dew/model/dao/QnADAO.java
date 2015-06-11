package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.QnAGroupVO;
import org.kosta.dew.model.vo.QnAVO;

public interface QnADAO {

	public List<QnAVO> getAllList(int pageNum);

	public int getAllCount();

	public QnAVO showContent(String qnaNo);

	public void hitUpContent(String qnaNo);

	public List<QnAGroupVO> getGroupList();



}