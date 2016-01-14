package com.mcmusic.userservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mcmusic.dao.SongDao;
import com.mcmusic.model.UserSend;

/**
 * 展现精品乐单
 * @author Administrator
 *
 */
public class QueryUserSendServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			List<UserSend> list =new ArrayList<UserSend>();
			
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			SongDao SongDao = new SongDao();
			UserSend u = new UserSend();
			u = SongDao.queryUsersend(id);
			list.add(u);
			request.setAttribute("usersendlist",list);
			request.getRequestDispatcher("page/usersend_page.jsp").forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doGet(request, response);
	}

}
