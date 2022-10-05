package com.pinetree.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserVO {
	private String email;
	private String pw;
	private String name;
	private String phone;
	private String user_key;
	private String reg_date;
	private String membertype;
	private int point;
	private String login_way;
}
