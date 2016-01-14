package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.SongDao;
import com.mcmusic.dao.UserDao;
import com.mcmusic.model.User;
import com.mcmusic.model.UserSend;

public class HasUserSendServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			boolean flag = false;
			Integer ID = null;
			UserDao UserDao = new UserDao();
			User u = UserDao.getUser(request.getSession().getAttribute("username").toString());
			Integer id = u.getId();
			SongDao SongDao = new SongDao();
			UserSend UserSend =  SongDao.queryUsersendByuserid(id);
			if(UserSend==null){
				flag = false;
			}else{
				flag = true;
				ID = UserSend.getId();
			}
			String json = "var result={flag:"+flag+",ID:'"+ID+"'}";
			response.getWriter().write(json);
			response.getWriter().close();
	}

}
