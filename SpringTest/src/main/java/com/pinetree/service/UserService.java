package com.pinetree.service;

import com.pinetree.vo.UserVO;

public interface UserService {
	public UserVO selectLogin(UserVO u);

	public String confirmEmail(UserVO uservo);

	public void InsertUser(UserVO user);

	public void userKey_ch(UserVO user);
}
