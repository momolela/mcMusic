package com.mcmusic.utils;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.mcmusic.dao.SongDao;
import com.mcmusic.model.UserSend;


public class LoadUserSendFilter implements Filter {

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		/**
		 * 这个过滤器是用来用户打开乐单之前拦截请求 往乐单中加载推荐的歌曲
		 */
		HttpServletRequest req = (HttpServletRequest) request;
		req.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		SongDao SongDao = new SongDao();
		UserSend u = SongDao.queryUsersend(id);
		if(u.getSongid() == null||u.getSongid().equals("")){
			req.getSession().setAttribute("usersendarray",null);
		}else{
			
			String[] songid = u.getSongid().split(",");
			Object[] songinfo = new Object[songid.length];
			for(int i = 0;i<songid.length;i++){
				//将用户喜欢的歌曲的songid转换为int类型然后去song表中查询歌曲  将查询到的歌曲封装到map集合中。
				Integer id1 = Integer.parseInt(songid[i]);
				songinfo[i] = SongDao.findSong(id1);
			}
			req.getSession().setAttribute("usersendarray",songinfo);
		}
		chain.doFilter(request, response);
	}
		

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
