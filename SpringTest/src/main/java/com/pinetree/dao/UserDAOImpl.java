package com.pinetree.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pinetree.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO selectLogin(UserVO user) {
		return sqlSession.selectOne("user_login",user);
	}

	@Override
	public String confirmEmail(UserVO uservo) {
		return sqlSession.selectOne("confirm_email",uservo);
	}

	@Override
	public void InsertUser(UserVO user) {
		sqlSession.insert("userInsert",user);
	}

	@Override
	public void userKey_ch(UserVO user) {	
		sqlSession.update("userKey_ch",user);
	}

}
