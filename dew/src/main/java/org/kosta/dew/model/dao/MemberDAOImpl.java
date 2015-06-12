package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
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
	@Override
	public int register(MemberVO mvo) {
		
		return sqlSessionTemplate.insert("member.register",mvo);
	}
	
	@Override
	public List<UserTypeVO> usertype(UserTypeVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("유저타입 DAO");
		return sqlSessionTemplate.selectList("member.usertype");
	}
	
	
	
}
