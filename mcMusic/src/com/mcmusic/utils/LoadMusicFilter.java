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
import com.mcmusic.dao.UserDao;


public class LoadMusicFilter implements Filter {

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		/**
		 * 这个过滤器是用来用户打开我的音乐盒之前拦截请求 往音乐盒中加载喜欢的歌曲
		 */
		HttpServletRequest req = (HttpServletRequest) request;
		req.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		UserDao UserDao = new UserDao();
		Integer userid = UserDao.getUser(req.getSession().getAttribute("username").toString()).getId();
		SongDao SongDao = new SongDao();
		if(SongDao.getUserLike(userid).getSongid() == null||SongDao.getUserLike(userid).getSongid().equals("")){
			
			req.getSession().setAttribute("songarray",null);
		}else{
			
			String[] songid = SongDao.getUserLike(userid).getSongid().split(",");
			Object[] songinfo = new Object[songid.length];
			for(int i = 0;i<songid.length;i++){
				//将用户喜欢的歌曲的songid转换为int类型然后去song表中查询歌曲  将查询到的歌曲封装到map集合中。
				Integer id = Integer.parseInt(songid[i]);
				songinfo[i] = SongDao.findSong(id);
			}
			req.getSession().setAttribute("songarray",songinfo);
		}
		chain.doFilter(request, response);
	}
		

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
