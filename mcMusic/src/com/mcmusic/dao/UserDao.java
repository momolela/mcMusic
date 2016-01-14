package com.mcmusic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mcmusic.model.User;
import com.mcmusic.utils.JdbcUtils;


public class UserDao{

	/**
	 * 将得到的用户对象加入数据库中，也就是相应的注册用户
	 * @param user
	 */
	public void addUser(User user){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into user(username,password,sex,email,userpicurl) value(?,?,?,?,?)";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,user.getUsername());
			ps.setString(2,user.getPassword());
			ps.setString(3,user.getSex());
			ps.setString(4,user.getEmail());
			ps.setString(5,"images/user/boy.jpg");
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}

	/**
	 * 通过用户名获取相应的用户对象。
	 * @param username
	 * @return User
	 */
	public User getUser(String username) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		String sql = "select * from user where username=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			while(rs.next())
			{
				user = mappingUser(rs);
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return user;
	}

	/**
	 * 通过用户名获取获取相应的用户对象，主要用于登录验证
	 * @param logName
	 * @param password
	 * @return
	 */
	public User findUser(String logName, String password) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		String sql = "select * from user where username=? and password=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,logName);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next())
			{
				user = mappingUser(rs);
			}
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
		return user;
	}

	/**
	 * 通过session中的用户名得到用户信息后，再通过传来的username和sex修改数据库中的信息
	 * @param username_session
	 * @param username
	 * @param sex
	 */
	public void updateInfo(String username_session, String username, String sex) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update user set username=?,sex=? where username=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2,sex);
			ps.setString(3,username_session);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过用户名找到用户，然后通过表单传过来的email改变数据库中的值
	 * @param username
	 * @param email
	 */
	public void updateemail(String username,String email) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update user set email=? where username=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,username);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过session中的username找到用户，然后通过表单的password改变密码
	 * @param username
	 * @param password
	 */
	public void updatepassword(String username,String password) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update user set password=? where username=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,password);
			ps.setString(2,username);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}
	
	/**
	 * 通过用户名和用户头像的url地址改变数据库中的用户头像url信息
	 * @param username
	 * @param userpicurl
	 */
	public void updateuserpicurl(String username,String userpicurl) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update user set userpicurl=? where username=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,userpicurl);
			ps.setString(2, username);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}

	/**
	 * 通过用户名删除数据库中的用户信息
	 * @param username
	 */
	public void delete(String username) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "delete from user where usrname=?";
		try {
			con = JdbcUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,username);
			ps.executeUpdate();
		}catch(SQLException e){
			throw new DaoException(e.getMessage(),e);
		} finally{
			JdbcUtils.free(con, ps, rs);
		}
	}

	/**
	 * 将查询到的结果集封装成一个User对象
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private User mappingUser(ResultSet rs) throws SQLException {
		User user;
		user = new User();
		user.setId(rs.getInt("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setSex(rs.getString("sex"));
		user.setEmail(rs.getString("email"));
		user.setUserpicurl(rs.getString("userpicurl"));
		return user;
	}

}