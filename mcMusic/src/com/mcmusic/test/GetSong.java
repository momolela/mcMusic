package com.mcmusic.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mcmusic.utils.JdbcUtils;

import javax.servlet.http.HttpServletRequest;

public class GetSong{
	public static String getSong(HttpServletRequest request) throws SQLException{
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String result_min = "";
		String result = "";
		String haha = "";
		try {
			con = JdbcUtils.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from song");
			while (rs.next()) {
				result_min = "'"+rs.getString("singer")+"-"+rs.getString("songname")+"_"+"《"+rs.getString("album")+"》"+"="+rs.getString("url")+"',";
				result = result+result_min;
			}
			haha = "["+result+"'欢迎来到Follow音乐网']";
		} finally {
			JdbcUtils.free(con,null,null);
		}
		return haha;
	}
}

