package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.SongDao;

public class QueryAllmusicByType extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer songtypeid = Integer.parseInt(request.getParameter("songtypeid"));
		Integer[] curPage = new Integer[2];
		Integer page = Integer.parseInt(request.getParameter("pn"));
		SongDao SongDao = new SongDao();
		Object[] o = SongDao.querySongByType(page,songtypeid);
		request.setAttribute("song_all",o);
		Double i = (double) SongDao.count_song();
		curPage[1] = (int) Math.ceil(i/8);
		curPage[0] = page;
		request.setAttribute("curPage", curPage);
		request.getRequestDispatcher("page/Allmusic.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
