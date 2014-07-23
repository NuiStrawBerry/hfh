package com.hfh.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendMail {
	 @Autowired
	 private JavaMailSender mailSender;
	 
	 public void send() {  
	  //获取JavaMailSender bean  
	  SimpleMailMessage mail = new SimpleMailMessage(); //<span style="color: #ff0000;">注意SimpleMailMessage只能用来发送text格式的邮件</span>  
	  
	  
	  try {  
	   mail.setTo("765697052@qq.com");//接受者  
	   mail.setFrom("yyz201000@163.com");//发送者,这里还可以另起Email别名，不用和xml里的username一致  
	   mail.setSubject("spring mail test!");//主题  
	   mail.setText("springMail的简单发送测试");//邮件内容  
	   mailSender.send(mail);  
	  } catch (Exception e) {  
	   e.printStackTrace();  
	  }  
	 }
	 
	 public static void main(String[] args) {
		 SendMail sm = new SendMail();
		 sm.send();
	}
}
