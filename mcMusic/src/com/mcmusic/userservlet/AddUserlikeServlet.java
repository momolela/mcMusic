package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.SongDao;
import com.mcmusic.model.User;
import com.mcmusic.model.UserLike;

public class AddUserlikeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		boolean flag = false;
		User u = new User();
		u = (User) request.getSession().getAttribute("userInfo");
		Integer userid = u.getId();
		String songid = request.getParameter("songid");
		SongDao SongDao = new SongDao();
		UserLike userLike = SongDao.getUserLike(userid);
		SongDao.updateUserLike(userid,userLike.getSongid()+songid+",");
		flag = true;
		
		String json = "var result={flag:"+flag+"}";
		response.getWriter().write(json);
		response.getWriter().close();
	}

}
