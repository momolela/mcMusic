package com.mcmusic.userservlet;

import java.io.File;
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

import com.mcmusic.dao.UserDao;
import com.mcmusic.model.User;

/**
 * 用户修改自己的信息（头像）
 * @author Administrator
 *
 */
public class ChangePicServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		DiskFileItemFactory fi = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fi);
		fi.setSizeThreshold(1024*1024);
		fi.setRepository(new File("e:\\cache"));
		try {
			upload.setHeaderEncoding("utf-8");
			List<FileItem> items = upload.parseRequest(request);
			String path = getServletContext().getRealPath("/images/user/userpic");
			
			for(FileItem item:items)
			{
				if(item.isFormField())
				{
					System.out.println("这是提交按钮");
				}
				else{
					String num = UUID.randomUUID().toString().replaceAll("-","");
					String fileName = item.getName();
					InputStream in = item.getInputStream();
					OutputStream out = new FileOutputStream(path+"\\"+num+fileName);
					String userpicurl = "images/user/userpic/"+num+fileName;
					String username = request.getSession().getAttribute("username").toString();
					UserDao UserDao = new UserDao();
					UserDao.updateuserpicurl(username,userpicurl);
					User u = UserDao.getUser(username);
					request.getSession().setAttribute("userInfo",u);
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
	}

}
