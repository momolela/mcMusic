package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.SongDao;

/**
 * 查询用户推荐表中的记录，处理记录分页。
 * @author Administrator
 *
 */
public class QueryUsersendListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			Integer[] curPage = new Integer[2];
			Integer page = Integer.parseInt(request.getParameter("pn"));
			SongDao SongDao = new SongDao();
			Object[] o = SongDao.queryUsersendList(page);
			request.setAttribute("usersend_all",o);
			Double i = (double) SongDao.count();
			curPage[1] = (int) Math.ceil(i/8);
			curPage[0] = page;
			request.setAttribute("curPage", curPage);
			request.getRequestDispatcher("page/usersend_all.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			doGet(request, response);
	}

}
