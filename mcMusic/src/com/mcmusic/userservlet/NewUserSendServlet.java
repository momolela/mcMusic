package com.mcmusic.userservlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mcmusic.dao.SongDao;
import com.mcmusic.dao.UserDao;
import com.mcmusic.model.User;
import com.mcmusic.model.UserSend;

/**
 * 用户新建乐单，会往usersend表中插入一条新的记录。(推荐的歌曲为空)
 * @author Administrator
 *
 */
public class NewUserSendServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String username = (String) request.getSession().getAttribute("username");
			UserDao UserDao = new UserDao();
			User u = UserDao.getUser(username);
			Integer id = u.getId();
			
			String listname = "";
			String listdesc = "";
			String url = "";
			
			DiskFileItemFactory fi = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fi);
			fi.setSizeThreshold(1024*1024*1024);
			try {
				upload.setHeaderEncoding("utf-8");
				List<FileItem> items = upload.parseRequest(request);
				String path = getServletContext().getRealPath("/images/menu"+"/"+id);
				
				for(FileItem item:items)
				{
					if(item.isFormField()){
						if(item.getFieldName().equals("listname")){
							listname = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("listdesc")){
							listdesc = item.getString("utf-8");
						}
					}
					else{
						String num = UUID.randomUUID().toString().replaceAll("-","");
						String fileName = item.getName();
						InputStream in = item.getInputStream();
						//获取歌曲路径
						url = "images/menu/"+id+"/"+num+fileName;
						OutputStream out = new FileOutputStream(path+"\\"+num+fileName);
						byte[] buffer = new byte[1024];
						while(in.read(buffer)>0)
						{
							out.write(buffer);
						}
						out.close();
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			UserSend UserSend = new UserSend();
			UserSend.setUserid(id);
			UserSend.setTitle(listname);
			UserSend.setContent(listdesc);
			UserSend.setPicurl(url);
			SongDao SongDao = new SongDao();
			SongDao.addUserSend(UserSend);
			UserSend u1= SongDao.queryUsersendByuserid(id);
			Integer id1 = u1.getId();
			
			
			response.sendRedirect("QueryUserSendServlet?id="+id1);
	}

}
