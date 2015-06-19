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
	@Override
	public int register(MemberVO mvo){
		return memberDAO.register(mvo);
	}
	public int userregister(UserTypeVO uvo, MemberVO mvo){
		return memberDAO.userregister(uvo,mvo);
	}
	@Override
	public List<UserTypeVO> usertype(UserTypeVO uvo) {
		// TODO Auto-generated method stub
		return memberDAO.usertype(uvo);
	}
	
	@Override
	public MemberVO findbyid(MemberVO vo){
		System.out.println("로그인 서비스");
		return memberDAO.findbyid(vo);
	}
	public MemberVO findbypassword(MemberVO vo){
		System.out.println("패스워드 서비스");
		return memberDAO.findbypassword(vo);
	}
	public MemberVO findbypassword2(MemberVO vo){
		System.out.println("패스워드2 서비스");
		return memberDAO.findbypassword2(vo);
	}
	@Override
	public UserTypeVO findName(UserTypeVO uvo) {
		
		return memberDAO.findName(uvo);
	}
	@Override
	public int deletemember(MemberVO vo){
		return memberDAO.deletemember(vo);
	}
	@Override
	public int update(MemberVO vo){
		return memberDAO.update(vo);
	}
	@Override
	public int deltemembercheck(String id) {
		
		return memberDAO.deltemembercheck(id);
	}
	
	
	
	
}
