package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.MemberDAO;
import org.kosta.dew.model.vo.MemberListVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.UserTypeVO;
import org.kosta.dew.model.vo.discussionRequestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Override
	public MemberVO login(MemberVO vo){
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
		return memberDAO.usertype(uvo);
	}
	
	@Override
	public List<MemberVO> findbyid(MemberVO vo){
		return memberDAO.findbyid(vo);
	}
	public MemberVO findbypassword(MemberVO vo){
		return memberDAO.findbypassword(vo);
	}
	public MemberVO findbypassword2(MemberVO vo){
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
	@Override
	public MemberListVO allMember(String pageNo) {
		if(pageNo==null||pageNo=="") {
			pageNo="1";
		}
		List<MemberVO> list= memberDAO.allMember(pageNo);
		int total = memberDAO.totalMember();
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		MemberListVO mlvo = new MemberListVO(list, paging);	
		return mlvo;
	}
	
	@Override
	public List<discussionRequestVO> showDeleteRequest() {
		return  memberDAO.showDeleteRequest();
	}
	@Override
	public List<discussionRequestVO> showInsertRequest() {
		return memberDAO.showInsertRequest();
	}
	@Override
	public MemberVO info(String id) {
		// TODO Auto-generated method stub
		return memberDAO.info(id);
	}
@Override
	public void pointup(String id,String point) {
		// TODO Auto-generated method stub
		memberDAO.pointup(id, point);
		
	}
	
}
