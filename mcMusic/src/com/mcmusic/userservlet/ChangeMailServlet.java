package com.mcmusic.userservlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.UserDao;
import com.mcmusic.model.MyAuthenticator;
import com.mcmusic.model.User;

/**
 * 用户修改自己的信息（邮箱）
 * @author Administrator
 *
 */
public class ChangeMailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getSession().getAttribute("result").toString();
		String email = request.getParameter("newemail");
		String checkcode = request.getParameter("checkcode");
		String username_session = request.getSession().getAttribute("username").toString();
		UserDao UserDao = new UserDao();
		UserDao.updateemail(username_session,email);
		User u= UserDao.getUser(username_session);
		boolean flag = false;
		String message = "";
		if(checkcode!=null&!checkcode.equals("")&checkcode.equals(code)){
			if(u!=null){
				//发送邮件
		        Properties props = new Properties();
		        props.setProperty("mail.smtp.host", "smtp.qq.com"); 
		        props.setProperty("mail.smtp.auth", "true"); 

		        String userName = "1278413504@qq.com"; 
		        String emailpassword = "Liuhuan19941020";
		        Authenticator authenticator = new MyAuthenticator(userName, emailpassword); 
		         
		        javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,authenticator); 
		        session.setDebug(true); 
		         
		        try{
		            Address from = new InternetAddress(userName); 
		            Address to = new InternetAddress(email); 
		             
		            MimeMessage msg = new MimeMessage(session); 
		            msg.setFrom(from); 
		            msg.setSubject("mc音乐网修改邮箱的邮件"); 
		            msg.setSentDate(new Date()); 
		            msg.setContent(u.getUsername()+"恭喜您修改邮箱成功,您的新邮箱是:"+u.getEmail()+"\n记得忘记密码请联系管理员。QQ:1278413504", "text/html;charset=utf-8"); 
		            msg.setRecipient(RecipientType.TO, to);  
		            Transport.send(msg);

		        } catch(MessagingException e){ 
		            e.printStackTrace(); 
		        }
				flag = true;
			}
		}
		else{
			flag = false;
			message = "验证码输入错误";
		}
		String json = "var result={flag:"+flag+",message:'"+message+"'}";
		response.getWriter().write(json);
		response.getWriter().close();
	}

}
