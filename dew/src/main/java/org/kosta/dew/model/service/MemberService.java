package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;

public interface MemberService {

	public abstract MemberVO login(MemberVO vo);
	public int register(MemberVO mvo);
	public List<UserTypeVO> usertype(UserTypeVO uvo);
	public MemberVO findbyid(MemberVO vo);
	public MemberVO findbypassword(MemberVO vo);
	public MemberVO findbypassword2(MemberVO vo);
	public int userregister(UserTypeVO uvo, MemberVO mvo);
	public abstract UserTypeVO findName(UserTypeVO uvo);
	public int deletemember(MemberVO mvo);
	public int update(MemberVO vo);
	public abstract int deltemembercheck(String id);
	
	
	
}