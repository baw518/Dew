package org.kosta.dew.model.dao;

import org.kosta.dew.model.vo.MemberVO;

public interface MemberDAO {

	public abstract MemberVO login(MemberVO vo);

}