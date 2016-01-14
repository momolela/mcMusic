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

import com.mcmusic.dao.SongDao;
import com.mcmusic.dao.UserDao;
import com.mcmusic.model.MyAuthenticator;
import com.mcmusic.model.User;

/**
 * 用户注册
 * @author Administrator
 *
 */
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String againpassword = request.getParameter("againpassword");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String hdatapage = request.getParameter("hdata");
		String hdatasession = (String)request.getSession().getAttribute("hdata");
		boolean flag = false;
		String message = "";
		UserDao UserDao = new UserDao();
		SongDao SongDao = new SongDao();
			if(hdatasession!=null&hdatapage.equals(hdatasession)){
				request.getSession().removeAttribute("hdata");
				if(password.equals(againpassword)){
					User u = new User();
					u.setUsername(username);
					u.setPassword(password);
					u.setSex(sex);
					u.setEmail(email);
					u.setUserpicurl("images/user/boy.jpg");
					UserDao.addUser(u);
					//注册成功后建立一个用户喜欢歌曲表的记录
					SongDao.addUserLike(UserDao.getUser(username).getId());
					//注册成功后在music文件夹下建立一个名字是用户ID的文件夹用于存放上传的歌曲
					String path = getServletContext().getRealPath("/music");
					if (new java.io.File(path).isDirectory()) //如果文件夹存在
					{
						new java.io.File(path+"/"+UserDao.getUser(username).getId().toString()).mkdir();
					}
					//注册成功后在images/menu文件夹下建立一个名字是用户ID的文件夹用于存放歌单封面
					String path1 = getServletContext().getRealPath("/images/menu");
					if (new java.io.File(path1).isDirectory()) //如果文件夹存在
					{
						new java.io.File(path1+"/"+UserDao.getUser(username).getId().toString()).mkdir();
					}
					request.getSession().setAttribute("userInfo",u);
					request.getSession().setAttribute("username",u.getUsername());
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
			            msg.setSubject("mc音乐网注册邮件"); 
			            msg.setSentDate(new Date()); 
			            msg.setContent("恭喜您已经成功注册成为mc音乐的一员，你的账号是:"+u.getUsername()+"\t你的密码为"+u.getPassword()+"请妥善保管，忘记密码请联系管理员。QQ:1278413504", "text/html;charset=utf-8"); 
			            msg.setRecipient(RecipientType.TO, to);  
			            Transport.send(msg);
	
			        } catch(MessagingException e){ 
			            e.printStackTrace(); 
			        }
			        
					flag = true;
				}
				else{
					flag = false;
					message = "密码不一致请重新注册";
				}
			}else{
				flag = false;
				message = "注册成功！！！！但请不要重复注册。";
			}
			String json = "var result={flag:"+flag+",message:'"+message+"'}";
			response.getWriter().write(json);
			response.getWriter().close();
		}

}
