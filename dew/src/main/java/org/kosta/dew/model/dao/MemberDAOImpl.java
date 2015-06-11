package org.kosta.dew.model.dao;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.MemberDAO#login(org.kosta.dew.model.vo.MemberVO)
	 */
	@Override
	public MemberVO login(MemberVO vo){
		System.out.println("로그인 DAO");
		return sqlSessionTemplate.selectOne("member.login",vo);
	}
}
