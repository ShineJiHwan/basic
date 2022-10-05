package com.pinetree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pinetree.dao.UserDAO;
import com.pinetree.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO UserDAO;

	@Override
	public UserVO selectLogin(UserVO u) {
		return this.UserDAO.selectLogin(u);
	}

}
