package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.UserTypeVO;
import org.kosta.dew.model.vo.discussionRequestVO;
import org.springframework.web.multipart.MultipartFile;


public interface MemberService {

	int deltemembercheck(String id);

	MemberVO login(MemberVO vo);

	UserTypeVO findName(UserTypeVO uvo);

	int register(MemberVO vo);

	int userregister(UserTypeVO uvo, MemberVO vo);

	List<UserTypeVO> usertype(UserTypeVO uvo);

	List<MemberVO> findbyid(MemberVO vo);

	MemberVO findbypassword2(MemberVO vo);

	int deletemember(MemberVO vo);

	int update(MemberVO vo);

	Object allMember(String pageNo);

	List<discussionRequestVO> showDeleteRequest();

	List<discussionRequestVO> showInsertRequest();

	MemberVO info(String id);



	void pointup(String id, String point);

	MemberVO checkMemberIdPassword(String id, String memberPassword);

	
}