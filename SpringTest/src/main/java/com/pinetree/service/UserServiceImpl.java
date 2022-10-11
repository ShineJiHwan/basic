package com.pinetree.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.pinetree.dao.UserDAO;
import com.pinetree.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserDAO UserDAO;
	
	private boolean lowerCheck;
	private int size;
	
	private String init() {//랜덤 키 값 생성 메소드
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {//영문 대소문자 숫자 범위
				sb.append((char) num);//String 문자열 증가
			} else {
				continue;
			}

		} while (sb.length() < size);//StringBuffer길이 만큼만 반복
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;//대소문자 구분 유무
		this.size = size;//길이
		return init();
	}
	@Override
	public void InsertUser(UserVO user) {
		String key = getKey(false, 20);//대소문자 구분 유무 및 길이 설정
		user.setUser_key(key);
		this.UserDAO.InsertUser(user); // 랜덤키값이 추가된 회원정보 db저장
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2> 안녕하세요 : 소나무입니다!</h2><br><br>"
				+"<h3>"+user.getName()+"님</h3><p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
				+"<a href=\"http://localhost:1234/user/membership_email_ch?email="+user.getEmail()+"&user_key="+key+"\" target=\"_blank\" >인증하기</a></p>"
				+"(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";//이메일 본문 내용
		try {
			
			mail.setSubject("[본인인증] PT : 소나무 인증메일입니다.","utf-8");//이메일 제목
			mail.setText(htmlStr,"utf-8","html");//본문내용및설정
			mail.addRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));//이메일 타입과 누구에게 보낼지
			mailSender.send(mail);//이메일보내기
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
	}
	

	@Override
	public UserVO selectLogin(UserVO u) {
		return this.UserDAO.selectLogin(u);
	}

	@Override
	public String confirmEmail(UserVO uservo) {
		return this.UserDAO.confirmEmail(uservo);
	}

	@Override
	public void userKey_ch(UserVO user) {
		this.UserDAO.userKey_ch(user);
	}


}
