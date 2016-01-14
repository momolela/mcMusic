package com.mcmusic.model;

public class UserComments {
	private Integer id;
	private Integer songid;
	private Integer userid;
	private String contents;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSongid() {
		return songid;
	}
	public void setSongid(Integer songid) {
		this.songid = songid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}
