package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
import org.kosta.dew.model.vo.discussionRequestVO;

public interface MemberDAO {

	public MemberVO login(MemberVO vo);

	int register(MemberVO mvo);



	public List<UserTypeVO> usertype(UserTypeVO uvo);

	public List<MemberVO> findbyid(MemberVO vo);


	public MemberVO findbypassword(MemberVO vo);

	public MemberVO findbypassword2(MemberVO vo);

	int userregister(UserTypeVO uvo, MemberVO mvo);

	public UserTypeVO findName(UserTypeVO uvo);

	public int deletemember(MemberVO vo);

	public int update(MemberVO mvo);

	MemberVO deletelogin(MemberVO vo);


	public int deltemembercheck(String id);

	public List<MemberVO> allMember(String pageNo);

	public int totalMember();

	public abstract List<discussionRequestVO> showDeleteRequest();

	public List<discussionRequestVO> showInsertRequest();

	public MemberVO info(String id);

	void pointup(String id, String point);





	

	



}