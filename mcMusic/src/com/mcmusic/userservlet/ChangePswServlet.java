package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mcmusic.dao.UserDao;
import com.mcmusic.model.User;

/**
 * 用户修改自己的信息（密码）
 * @author Administrator
 *
 */
public class ChangePswServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		UserDao UserDao = new UserDao();
		boolean flag = false;
		String message = "";
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String againpassword = request.getParameter("againpassword");
		String username_session = request.getSession().getAttribute("username").toString();
		User u = UserDao.getUser(username_session);
		String password = u.getPassword();
		if(oldpassword.equals(password)){
			if(!newpassword.equals("")&!againpassword.equals("")){
				if(newpassword.equals(againpassword)){
					UserDao.updatepassword(username_session, newpassword);
					session.invalidate();
					flag = true;
				}else{
					flag = false;
					message = "两次密码输入不一致";
				}
			}
			else{
				flag = false;
				message = "密码输入不能为空";
			}
		}
		else{
			flag = false;
			message = "原始密码输入有误";
		}
		String json = "var result={flag:"+flag+",message:'"+message+"'}";
		response.getWriter().write(json);
		response.getWriter().close();
	}

}
