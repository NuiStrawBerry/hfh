package com.hfh.common;

import com.hfh.bean.EmailedHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendMail {
	 @Autowired
	 private JavaMailSender mailSender;

	@Autowired
	private Environment env;
	//TODO 有待验证该种形式的value 如何使用
//	 private @Value("${mail.username}") String userName;

	private @Value("#{configProperties['mail.username']}") String userName;
	
	@Value("#{configProperties['mail.mailto']}")
	private String mailTo;
	 
	 public void send() {  
	  //获取JavaMailSender bean  
	  SimpleMailMessage mail = new SimpleMailMessage(); //<span style="color: #ff0000;">注意SimpleMailMessage只能用来发送text格式的邮件</span>  
	  
	  
	  try {  
	   mail.setTo("765697052@qq.com");//接受者  
//	   mail.setFrom(env.getProperty("mail.username"));//发送者,这里还可以另起Email别名，不用和xml里的username一致
	   mail.setFrom("kyle.tan@homefromhomerealestate.com");//发送者,这里还可以另起Email别名，不用和xml里的username一致

	   System.out.println("===="+env.getProperty("mail.username"));
		  System.out.println(userName);
	   mail.setSubject("spring mail test!");//主题  
	   mail.setText("springMail的简单发送测试");//邮件内容  
	   mailSender.send(mail);  
	  } catch (Exception e) {  
	   e.printStackTrace();  
	  }  
	 }
	 

	public boolean send(EmailedHouse eh){
		boolean flag = true;
		SimpleMailMessage mail = new SimpleMailMessage();
		try {
			mail.setTo(mailTo);//接受者
			mail.setFrom(userName);
			mail.setSubject(eh.getHouseTitle());//主题
			mail.setText(message(eh));//邮件内容
			mailSender.send(mail);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			return flag;
		}
		return flag;
	}

	// 处理邮件内容
	private String message(EmailedHouse eh ){
		StringBuffer sb = new StringBuffer();
		sb.append("房子：").append(eh.getHouseTitle()).append("\n");
		sb.append("姓名：").append(eh.getFullname()).append("\n");
		sb.append("电话：").append(eh.getPhone()).append("\n");
		sb.append("email：").append(eh.getEmail()).append("\n");

		return sb.toString();
	}
}
