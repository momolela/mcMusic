package com.mcmusic.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mcmusic.model.Song;
import com.mcmusic.model.SongType;
import com.mcmusic.model.UserComments;
import com.mcmusic.model.UserLike;
import com.mcmusic.model.UserSend;
import com.mcmusic.utils.JdbcUtils;

public class SongDao {
	
	/*************************以下是针对于song表的操作*****************************/
	/**
	 * 管理员添加歌曲
	 * @param song
	 */
	public void addSong_admin(Song song){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into song(songname,singer,album,uptime,url) value(?,?,?,?,?)";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,song.getSongname());
			ps.setString(2,song.getSinger());
			ps.setString(3,song.getAlbum());
			ps.setDate(4,(Date) song.getUptime());
			ps.setString(5,song.getUrl());
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 管理员通过  歌曲ID 删除歌曲
	 * @param song
	 */
	public void deleteSong(Integer songid) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "delete from song where id=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,songid);
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过表单的数据封装成Song对象，用户上传新的歌曲。
	 * @param song
	 */
	public void addSong(Song song){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into song(songname,singer,album,uptime,url,uploaduserid,songtypeid) value(?,?,?,?,?,?,?)";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,song.getSongname());
			ps.setString(2,song.getSinger());
			ps.setString(3,song.getAlbum());
			ps.setDate(4,(Date) song.getUptime());
			ps.setString(5,song.getUrl());
			ps.setInt(6,song.getUploaduserid());
			ps.setInt(7,song.getSongtypeid());
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过id查询到song表中的歌曲记录。
	 * @param songid
	 * @return
	 */
	public Song findSong(Integer songid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Song song = null;
		String sql = "select * from song where id=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,songid);
			rs = ps.executeQuery();
			while(rs.next()){
				song = mappingSong(rs);
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return song;
	}
	
	/**
	 * 根据  歌曲名  在song表中查找歌曲
	 * @param songname
	 * @return 一个Song对象
	 */
	public Song findSong(String songname) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Song song = null;
		String sql = "select * from song where songname=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,songname);
			rs = ps.executeQuery();
			while(rs.next())
			{
				song = mappingSong(rs);
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return song;
	}
	
	public Object[] querySongList(int page){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Integer length = 0;
		String sql = "select * from song limit "+(page-1)*8+",10";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			//总共有多少条记录
			rs.last();
			length = rs.getRow();
			Object[] songList = new Object[length];
			rs.first();
			rs.previous();
			int i = 0;
			while(rs.next())
			{
				Song Song = new Song();
				Song.setSongname(rs.getString("songname"));
				Song.setId(rs.getInt("id"));
				Song.setSongtypeid(rs.getInt("songtypeid"));
				Song.setUrl(rs.getString("url"));
				Song.setSinger(rs.getString("singer"));
				Song.setAlbum(rs.getString("album"));
				Song.setUploaduserid(rs.getInt("uploaduserid"));
				Song.setUptime(rs.getDate("uptime"));
				songList[i] = Song;
				i++;
			}
			return songList;
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	public Object[] querySongByType(int page,int songtypeid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Integer length = 0;
		String sql = "select * from song where songtypeid=? limit "+(page-1)*8+",10 ";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,songtypeid);
			rs = ps.executeQuery();
			//总共有多少条记录
			rs.last();
			length = rs.getRow();
			Object[] songList = new Object[length];
			rs.first();
			rs.previous();
			int i = 0;
			while(rs.next())
			{
				Song Song = new Song();
				Song.setSongname(rs.getString("songname"));
				Song.setId(rs.getInt("id"));
				Song.setSongtypeid(rs.getInt("songtypeid"));
				Song.setUrl(rs.getString("url"));
				Song.setSinger(rs.getString("singer"));
				Song.setAlbum(rs.getString("album"));
				Song.setUploaduserid(rs.getInt("uploaduserid"));
				Song.setUptime(rs.getDate("uptime"));
				songList[i] = Song;
				i++;
			}
			return songList;
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	public int count_song(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i;
		String sql = "select * from song";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.last();
			i = rs.getRow();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return i;
	}
	
	/*************************以下是针对于userlike表的操作*****************************/
	/**
	 * 注册的时候在userlike表中注册一个。相当于初始化用户喜欢的列表
	 * @param userid
	 */
	public void addUserLike(Integer userid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into userlike(userid,songid) value(?,?)";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,userid);
			ps.setString(2,"");
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 用户添加喜欢的歌曲
	 * @param userid
	 * @param songid
	 */
	public void updateUserLike(int userid,String songid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update userlike set songid=? where userid=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,songid);
			ps.setInt(2,userid);
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 根据  用户ID  在userlike表中查找用户喜欢歌曲的对象记录
	 * @param userid
	 * @return 是一个UserLike对象
	 */
	public UserLike getUserLike(int userid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserLike userLike = null;
		String sql = "select * from userlike where userid=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				userLike = new UserLike();
				userLike.setUserid(rs.getInt("userid"));
				userLike.setSongid(rs.getString("songid"));
				return userLike;
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return userLike;
	}
	
	/*************************以下是针对于usersend表的操作*****************************/
	/**
	 * 分页查询  乐单  传递的参数是当前的页数
	 * @param page
	 * @return 返回的是一个包含UserSend对象的  数组。
	 */
	public Object[] queryUsersendList(int page){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Integer length = 0;
		String sql = "select * from usersend limit "+(page-1)*8+",8";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			//总共有多少条记录
			rs.last();
			length = rs.getRow();
			Object[] usersendList = new Object[length];
			rs.first();
			rs.previous();
			int i = 0;
			while(rs.next())
			{
				UserSend UserSend = new UserSend();
				UserSend.setId(rs.getInt("id"));
				UserSend.setUserid(rs.getInt("userid"));
				String sql1 = "select username,userpicurl from user where id=?";
				PreparedStatement ps1= con.prepareStatement(sql1);
				ps1.setInt(1,rs.getInt("userid"));
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()){
					UserSend.setUsername(rs1.getString("username"));
					UserSend.setUserpicurl(rs1.getString("userpicurl"));
				}
				UserSend.setSongid(rs.getString("songid"));
				UserSend.setTitle(rs.getString("title"));
				UserSend.setContent(rs.getString("content"));
				UserSend.setPicurl(rs.getString("picurl"));
				usersendList[i] = UserSend;
				i++;
			}
			return usersendList;
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过  用户歌曲推荐表的ID  查找用户的推荐歌曲  返回的是一个UserSend对象
	 * @param id
	 * @return 一个UserSend对象
	 */
	public UserSend queryUsersend(Integer id){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from usersend where id=?";
		UserSend UserSend = new UserSend();
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			rs = ps.executeQuery();
			while(rs.next())
			{
				UserSend.setId(rs.getInt("id"));
				UserSend.setUserid(rs.getInt("userid"));
				String sql1 = "select username,userpicurl from user where id=?";
				PreparedStatement ps1= con.prepareStatement(sql1);
				ps1.setInt(1,rs.getInt("userid"));
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()){
					UserSend.setUsername(rs1.getString("username"));
					UserSend.setUserpicurl(rs1.getString("userpicurl"));
				}
				UserSend.setSongid(rs.getString("songid"));
				UserSend.setTitle(rs.getString("title"));
				UserSend.setContent(rs.getString("content"));
				UserSend.setPicurl(rs.getString("picurl"));
			}
			return UserSend;
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过  用户ID  查询推荐表获取一个usersend的对象
	 * @param userid
	 * @returnu sersend的对象
	 */
	public UserSend queryUsersendByuserid(Integer userid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserSend UserSend = null;
		String sql = "select * from usersend where userid=?";
		
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				UserSend = new UserSend();
				UserSend.setId(rs.getInt("id"));
				UserSend.setUserid(rs.getInt("userid"));
				String sql1 = "select username,userpicurl from user where id=?";
				PreparedStatement ps1= con.prepareStatement(sql1);
				ps1.setInt(1,rs.getInt("userid"));
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()){
					UserSend.setUsername(rs1.getString("username"));
					UserSend.setUserpicurl(rs1.getString("userpicurl"));
				}
				UserSend.setSongid(rs.getString("songid"));
				UserSend.setTitle(rs.getString("title"));
				UserSend.setContent(rs.getString("content"));
				UserSend.setPicurl(rs.getString("picurl"));
				return UserSend;
			}
			
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return UserSend;
		
	}
	
	/**
	 * 新建乐单，往乐单中添加记录
	 * @param UserSend
	 */
	public void addUserSend(UserSend UserSend){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into usersend(userid,songid,title,content,picurl) value(?,?,?,?,?)";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,UserSend.getUserid());
			ps.setString(2,UserSend.getSongid());
			ps.setString(3,UserSend.getTitle());
			ps.setString(4,UserSend.getContent());
			ps.setString(5,UserSend.getPicurl());
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * usersend计算该表的记录条数。
	 * @return 返回记录的条数
	 */
	public int count(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i;
		String sql = "select * from usersend";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.last();
			i = rs.getRow();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return i;
	}
	
	/*************************以下是针对songtype表的的操作*****************************/
	/**
	 * 用户上传歌曲时，获取歌曲类型。通过  歌曲类型  查询数据库获取songtype的对象
	 * @param songtype
	 * @return songtype的对象
	 */
	public SongType FindSongType(String songtype){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SongType SongType = null;
		String sql = "select * from songtype where songtype=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,songtype);
			rs = ps.executeQuery();
			while(rs.next())
			{
				SongType = new SongType();
				SongType.setId(rs.getInt("id"));
				SongType.setSongtype(rs.getString("songtype"));
				return SongType;
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return SongType;
	}
	
	/**
	 * 通过  songtypeID 来查询数据库获取songtype的对象
	 * @param songtypeid
	 * @return songtype的对象
	 */
	public SongType FindSongType(Integer songtypeid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SongType SongType = null;
		String sql = "select * from songtype where id=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,songtypeid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				SongType = new SongType();
				SongType.setId(rs.getInt("id"));
				SongType.setSongtype(rs.getString("songtype"));
				return SongType;
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return SongType;
	}
	
	/*************************以下是针对usercomments表的的操作*****************************/
	/**
	 * 通过  歌曲ID  查询评论记录
	 * @param songid
	 * @return  UserComments对象
	 */
	public UserComments findUserComments(Integer songid){
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserComments UserComments = null;
		String sql = "select * from songtype where songid=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,songid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				UserComments = new UserComments();
				UserComments.setId(rs.getInt("id"));
				UserComments.setSongid(rs.getInt("songid"));
				UserComments.setUserid(rs.getInt("userid"));
				UserComments.setContents(rs.getString("cotents"));
				return UserComments;
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return UserComments;
	}
	
	/**
	 * 通过  用户ID  查询评论记录
	 * @param userid
	 * @return  UserComments对象
	 */
	public UserComments findUserCommentsByUserid(Integer userid){
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserComments UserComments = null;
		String sql = "select * from songtype where userid=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				UserComments = new UserComments();
				UserComments.setId(rs.getInt("id"));
				UserComments.setSongid(rs.getInt("songid"));
				UserComments.setUserid(rs.getInt("userid"));
				UserComments.setContents(rs.getString("cotents"));
				return UserComments;
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return UserComments;
	}
	
	/**
	 * 通过  ID  查询评论记录
	 * @param userid
	 * @return  UserComments对象
	 */
	public UserComments findUserCommentsByid(Integer id){
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserComments UserComments = null;
		String sql = "select * from songtype where id=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			rs = ps.executeQuery();
			while(rs.next())
			{
				UserComments = new UserComments();
				UserComments.setId(rs.getInt("id"));
				UserComments.setSongid(rs.getInt("songid"));
				UserComments.setUserid(rs.getInt("userid"));
				UserComments.setContents(rs.getString("cotents"));
				return UserComments;
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return UserComments;
	}
	
	/**
	 * 往UserComments表中添加记录，参数一个UserComments对象。
	 * @param UserComments
	 */
	public void addUserComments(UserComments UserComments){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into usercomments(songid,userid,contents) value(?,?,?)";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,UserComments.getSongid());
			ps.setInt(2,UserComments.getUserid());
			ps.setString(3,UserComments.getContents());
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过songid删除歌曲的评论
	 * @param songid
	 */
	public void deleteUserComments(Integer songid) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "delete from song where songid=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,songid);
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}

	private Song mappingSong(ResultSet rs) throws SQLException {
		Song song;
		song = new Song();
		song.setId(rs.getInt("id"));
		song.setSongname(rs.getString("songname"));
		song.setSinger(rs.getString("singer"));
		song.setAlbum(rs.getString("album"));
		song.setUptime(rs.getDate("uptime"));
		song.setUrl(rs.getString("url"));
		song.setUploaduserid(rs.getInt("uploaduserid"));
		song.setSongtypeid(rs.getInt("songtypeid"));
		return song;
	}

}
