package org.kosta.dew.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
import org.kosta.dew.model.vo.discussionRequestVO;
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
	public MemberVO deletelogin(MemberVO vo){
		System.out.println("로그인 DAO");
		return sqlSessionTemplate.selectOne("member.deletelogin",vo);
	}
	@Override
	public int register(MemberVO mvo) {
		return sqlSessionTemplate.insert("member.register",mvo);
	}
	@Override
	public int userregister(UserTypeVO uvo,MemberVO mvo) {
		HashMap<String ,String> map = new HashMap<String,String >();
		map.put("mid", mvo.getId());
		map.put("jno", (String.valueOf(uvo.getJobNo())));
		
		return sqlSessionTemplate.insert("member.userregister",map);
	}
	
	@Override
	public List<UserTypeVO> usertype(UserTypeVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("유저타입 DAO");
		return sqlSessionTemplate.selectList("member.usertype");
	}
	@Override
	public MemberVO findbyid(MemberVO vo){
		System.out.println("findbyid DAO");
		return sqlSessionTemplate.selectOne("member.findbyid",vo);
	}
	@Override
	public MemberVO findbypassword(MemberVO vo){
		System.out.println("findbyid DAO");
		return sqlSessionTemplate.selectOne("member.findbypassword",vo);
	}
	@Override
	public MemberVO findbypassword2(MemberVO vo){
		
		return sqlSessionTemplate.selectOne("member.findbypassword2",vo);
	}
	@Override
	public UserTypeVO findName(UserTypeVO uvo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.findname",uvo);
	}
	@Override
	public int deletemember(MemberVO vo){
		System.out.println("deletemember DAO");
		return sqlSessionTemplate.delete("member.deletemember",vo);
	}

	
	public int update(MemberVO vo) {
		System.out.println("update DAO");
		return sqlSessionTemplate.insert("member.update",vo);
	}
	
	public int deletejob(UserTypeVO uvo) {
		System.out.println("deletejob DAO");
		return sqlSessionTemplate.delete("member.deletejob",uvo);
	}
	
	@Override
	public int deltemembercheck(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.membercheck",id);
	}
	@Override
	public List<MemberVO> allMember(String pageNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.allMember",pageNo);
	}
	@Override
	public int totalMember() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.totalMember");
	}
	
	@Override
	public List<discussionRequestVO> showDeleteRequest() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.showDeleteRequest");
	}
	@Override
	public List<discussionRequestVO> showInsertRequest() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.showInsertRequest");
	}
	
}
