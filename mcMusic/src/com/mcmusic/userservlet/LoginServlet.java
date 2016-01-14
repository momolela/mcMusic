package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.UserDao;
import com.mcmusic.model.User;

/**
 * 用户登录
 * @author Administrator
 *
 */
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String checkcode = request.getParameter("checkcode");
		String code = request.getSession().getAttribute("result").toString();
		UserDao UserDao = new UserDao();
		User u = UserDao.findUser(username, password);
		boolean flag = false;
		String message = "";
		if(code!=null&checkcode.equals(code))
		{
			if(u!=null)
			{
				request.getSession().setAttribute("userInfo",u);
				request.getSession().setAttribute("username",u.getUsername());
				flag = true;
			}
			else
			{
				flag = false;
				message="用户名或者密码错误";
			}
		}else{
			flag = false;
			message="验证码填写错误";
		}
		String json = "var result={flag:"+flag+",message:'"+message+"'}";
		response.getWriter().write(json);
		response.getWriter().close();
	}

}
