package com.mcmusic.model;

import java.util.Date;

public class Song {
	private Integer id;
	private String songname;
	private String singer;
	private String album;
	private Date uptime;
	private String url;
	private Integer uploaduserid;
	private Integer songtypeid;
	
	public Integer getSongtypeid() {
		return songtypeid;
	}
	public void setSongtypeid(Integer songtypeid) {
		this.songtypeid = songtypeid;
	}
	public Integer getUploaduserid() {
		return uploaduserid;
	}
	public void setUploaduserid(Integer uploaduserid) {
		this.uploaduserid = uploaduserid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSongname() {
		return songname;
	}
	public void setSongname(String songname) {
		this.songname = songname;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public Date getUptime() {
		return uptime;
	}
	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
