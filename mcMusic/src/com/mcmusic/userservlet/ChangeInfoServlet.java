package com.mcmusic.userservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcmusic.dao.UserDao;
import com.mcmusic.model.User;

/**
 * 用户修改自己的信息（用户名和性别）
 * @author Administrator
 *
 */
public class ChangeInfoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		UserDao UserDao = new UserDao();
		boolean flag = false;
		String message = "";
		String username = request.getParameter("username");
		if(UserDao.getUser(username)!=null){
			flag = false;
			message = "这个名字别人已经用了^-^";
		}else{
			String sex = request.getParameter("sex");
			String username_session = request.getSession().getAttribute("username").toString();
			if(!sex.equals("男")&!sex.equals("女")){
				flag = false;
				message = "性别只允许填写男或者女。";
			}else{
				if(sex.equals("男")){
					sex = "boy";
				}if(sex.equals("女")){
					sex = "girl";
				}
				UserDao.updateInfo(username_session,username,sex);
				User u = UserDao.getUser(username);
				request.getSession().setAttribute("userInfo",u);
				request.getSession().setAttribute("username",username);
				flag = true;
				message = "信息修改成功";
			}
		}
		String json = "var result={flag:"+flag+",message:'"+message+"'}";
		response.getWriter().write(json);
		response.getWriter().close();
	}

}
