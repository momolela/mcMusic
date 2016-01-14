package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.UserDao;

/**
 * 判断用户名是否存在
 * @author Administrator
 *
 */
public class CheckNameServlet extends HttpServlet {

	private static final long serialVersionUID = 9218084137655728004L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		UserDao UserDao = new UserDao();
		boolean checknameflag = false;
		String message = "";
		if(UserDao.getUser(username)!=null){
			checknameflag = true;
			message = "用户已经存在^-^";
		}
		String json = "var result={checknameflag:"+checknameflag+",message:'"+message+"'}";
		response.getWriter().write(json);
		response.getWriter().close();
	}

}
