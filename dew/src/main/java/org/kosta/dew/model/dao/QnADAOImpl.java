package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.QnAGroupVO;
import org.kosta.dew.model.vo.QnAVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnADAOImpl implements QnADAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<QnAVO> getAllList(int pageNum) {
		return sqlSessionTemplate.selectList("QnA.getAllList",pageNum);
	}

	@Override
	public int getAllCount() {
		
		return sqlSessionTemplate.selectOne("QnA.getAllCount");
	}

	@Override
	public QnAVO showContent(String qnaNo) {
		
		return sqlSessionTemplate.selectOne("QnA.showContent",qnaNo);
	}

	@Override
	public void hitUpContent(String qnaNo) {
	
		sqlSessionTemplate.update("QnA.hitUpContent", qnaNo);
	}

	@Override
	public List<QnAGroupVO> getGroupList() {
		
		return sqlSessionTemplate.selectList("QnA.getGroupList");
	}

	@Override
	public void write(QnAVO vo) {
		sqlSessionTemplate.insert("QnA.write", vo);
	}




}
