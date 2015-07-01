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
	@Override
	public MemberVO login(MemberVO vo){
		return sqlSessionTemplate.selectOne("member.login",vo);
	}
	@Override
	public MemberVO deletelogin(MemberVO vo){
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
		return sqlSessionTemplate.selectList("member.usertype");
	}
	@Override
	public List<MemberVO> findbyid(MemberVO vo){
		return sqlSessionTemplate.selectList("member.findbyid",vo);
	}
	@Override
	public MemberVO findbypassword(MemberVO vo){
		return sqlSessionTemplate.selectOne("member.findbypassword",vo);
	}
	@Override
	public MemberVO findbypassword2(MemberVO vo){
		
		return sqlSessionTemplate.selectOne("member.findbypassword2",vo);
	}
	@Override
	public UserTypeVO findName(UserTypeVO uvo) {
		return sqlSessionTemplate.selectOne("member.findname",uvo);
	}
	@Override
	public int deletemember(MemberVO vo){
		return sqlSessionTemplate.delete("member.deletemember",vo);
	}

	
	public int update(MemberVO vo) {
		return sqlSessionTemplate.insert("member.update",vo);
	}
	
	public int deletejob(UserTypeVO uvo) {
		return sqlSessionTemplate.delete("member.deletejob",uvo);
	}
	
	@Override
	public int deltemembercheck(String id) {
		return sqlSessionTemplate.selectOne("member.membercheck",id);
	}
	@Override
	public List<MemberVO> allMember(String pageNo) {
		return sqlSessionTemplate.selectList("member.allMember",pageNo);
	}
	@Override
	public int totalMember() {
		return sqlSessionTemplate.selectOne("member.totalMember");
	}
	
	@Override
	public List<discussionRequestVO> showDeleteRequest() {
		return sqlSessionTemplate.selectList("member.showDeleteRequest");
	}
	@Override
	public List<discussionRequestVO> showInsertRequest() {
		return sqlSessionTemplate.selectList("member.showInsertRequest");
	}
	@Override
	public void pointup(String id, String point) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("point", point);
		System.out.println("DAOIMPL");
		System.out.println(map);
		
		sqlSessionTemplate.update("member.pointup",map);
	}
	@Override
	public MemberVO info(String id) {
		return sqlSessionTemplate.selectOne("member.info",id);
	}
	
}
