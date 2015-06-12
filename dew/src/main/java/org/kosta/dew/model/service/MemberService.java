package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;

public interface MemberService {

	public abstract MemberVO login(MemberVO vo);
	public int register(MemberVO mvo);
	public List<UserTypeVO> usertype(UserTypeVO uvo);
	
}