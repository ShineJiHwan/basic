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
	
	private String init() {//���� Ű �� ���� �޼ҵ�
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {//���� ��ҹ��� ���� ����
				sb.append((char) num);//String ���ڿ� ����
			} else {
				continue;
			}

		} while (sb.length() < size);//StringBuffer���� ��ŭ�� �ݺ�
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;//��ҹ��� ���� ����
		this.size = size;//����
		return init();
	}
	@Override
	public void InsertUser(UserVO user) {
		String key = getKey(false, 20);//��ҹ��� ���� ���� �� ���� ����
		user.setUser_key(key);
		this.UserDAO.InsertUser(user); // ����Ű���� �߰��� ȸ������ db����
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2> �ȳ��ϼ��� : �ҳ����Դϴ�!</h2><br><br>"
				+"<h3>"+user.getName()+"��</h3><p>�����ϱ� ��ư�� �����ø� �α����� �Ͻ� �� �ֽ��ϴ� : "
				+"<a href=\"http://localhost:1234/user/membership_email_ch?email="+user.getEmail()+"&user_key="+key+"\" target=\"_blank\" >�����ϱ�</a></p>"
				+"(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�.)";//�̸��� ���� ����
		try {
			
			mail.setSubject("[��������] PT : �ҳ��� ���������Դϴ�.","utf-8");//�̸��� ����
			mail.setText(htmlStr,"utf-8","html");//��������׼���
			mail.addRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));//�̸��� Ÿ�԰� �������� ������
			mailSender.send(mail);//�̸��Ϻ�����
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
