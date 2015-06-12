package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;

public interface MemberDAO {

	public MemberVO login(MemberVO vo);

	int register(MemberVO mvo);



	public List<UserTypeVO> usertype(UserTypeVO uvo);

	

	



}