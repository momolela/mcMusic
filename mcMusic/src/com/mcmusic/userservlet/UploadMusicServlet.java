package com.mcmusic.userservlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

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
import com.mcmusic.model.Song;
import com.mcmusic.model.SongType;
import com.mcmusic.model.User;
import com.mcmusic.model.UserLike;

/**
 * 上传歌曲
 * @author Administrator
 *
 */
public class UploadMusicServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = (String) request.getSession().getAttribute("username");
		UserDao UserDao = new UserDao();
		User u = UserDao.getUser(username);
		Integer id = u.getId();
		String songname = "";
		String singer = "";
		String album = "";
		String songtype = "";
		Integer songtypeid = null;
		String url = "";
		//获取日期并转换
		Date date = new Date();
		java.sql.Date d=new java.sql.Date (date.getTime());
		DiskFileItemFactory fi = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fi);
		fi.setSizeThreshold(1024*1024*1024);
		try {
			upload.setHeaderEncoding("utf-8");
			List<FileItem> items = upload.parseRequest(request);
			String path = getServletContext().getRealPath("/music"+"/"+id);
			
			for(FileItem item:items)
			{
				if(item.isFormField()){
					if(item.getFieldName().equals("songname")){
						songname = item.getString("utf-8");
					}
					else if(item.getFieldName().equals("singer")){
						singer = item.getString("utf-8");
					}
					else if(item.getFieldName().equals("album")){
						album = item.getString("utf-8");
					}
					else if(item.getFieldName().equals("radio")){
						songtype = item.getString("utf-8");
						SongType SongType = new SongType();
						SongDao SongDao = new SongDao();
						SongType = SongDao.FindSongType(songtype);
						songtypeid = SongType.getId();
					}
				}
				else{
					String fileName = singer+"-"+songname+".mp3";
					InputStream in = item.getInputStream();
					//获取歌曲路径
					url = "music/"+id+"/"+fileName;
					OutputStream out = new FileOutputStream(path+"\\"+fileName);
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
		Song s = new Song();
		s.setSongname(songname);
		s.setSinger(singer);
		s.setAlbum(album);
		s.setSongtypeid(songtypeid);
		s.setUptime(d);
		s.setUrl(url);
		s.setUploaduserid(id);
		SongDao SongDao = new SongDao();
		//往song表中添加新的歌曲
		SongDao.addSong(s);
		
		//通过歌名找到新插入的歌曲的ID，并将ID转化为字符串，然后读取userlike表中该歌曲的对象记录，然后找到songid，加上新的ID和逗号。
		Song song = SongDao.findSong(songname);
		String songid = song.getId().toString();
		UserLike userLike = SongDao.getUserLike(id);
		
		//更新userlike表中的songid记录。
		SongDao.updateUserLike(id,userLike.getSongid()+songid+",");
		
		response.sendRedirect("page/musicbox.jsp");
	}

}
