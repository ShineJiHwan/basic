package com.pinetree.dao;

import com.pinetree.vo.UserVO;

public interface UserDAO {
	UserVO selectLogin(UserVO u);
}
