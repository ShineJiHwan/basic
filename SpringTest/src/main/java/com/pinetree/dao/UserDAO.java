package com.pinetree.dao;

import com.pinetree.vo.UserVO;

public interface UserDAO {
	UserVO selectLogin(UserVO u);

	String confirmEmail(UserVO uservo);

	void InsertUser(UserVO user);

	void userKey_ch(UserVO user);
}
