package com.mcmusic.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public final class JdbcUtils {
	private static DataSource myDataSource = null;
	private JdbcUtils(){}

	//处理驱动注册只做一次
	static
	{
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Properties prop = new Properties();
		InputStream is = JdbcUtils.class.getClassLoader().getResourceAsStream("dbcpconfig.properties");
		prop.load(is);
		myDataSource = BasicDataSourceFactory.createDataSource(prop);
		}catch(Exception e){
			throw new ExceptionInInitializerError(e);
		}
	}

	//处理连接的优化
	public static Connection getConnection ()throws SQLException
	{
		return myDataSource.getConnection();
	}

	//处理释放资源的优化
	public static void free(Connection con,Statement st,ResultSet rs)
	{
		try{
			if(rs!=null)
			rs.close();
		}catch(SQLException e){e.printStackTrace();}
		finally{
		try{
			if(st!=null)
			st.close();
		}catch(SQLException e){e.printStackTrace();}
		finally{
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		}
	}
}
