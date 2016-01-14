package com.mcmusic.model;

public class User {
	private Integer id;
	private String username;
	private String password;
	private String sex;
	private String email;
	private String userpicurl;
	
	public String getUserpicurl() {
		return userpicurl;
	}
	public void setUserpicurl(String userpicurl) {
		this.userpicurl = userpicurl;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
