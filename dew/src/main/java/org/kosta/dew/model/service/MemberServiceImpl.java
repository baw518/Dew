package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.MemberDAO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDAOImpl")
	private MemberDAO memberDAO;
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.MemberService#login(org.kosta.dew.model.vo.MemberVO)
	 */
	@Override
	public MemberVO login(MemberVO vo){
		System.out.println("로그인 서비스");
		return memberDAO.login(vo);
	}
	public int register(MemberVO mvo){
		return memberDAO.register(mvo);
	}
	@Override
	public List<UserTypeVO> usertype(UserTypeVO uvo) {
		// TODO Auto-generated method stub
		return memberDAO.usertype(uvo);
	}
	
	
	
}
