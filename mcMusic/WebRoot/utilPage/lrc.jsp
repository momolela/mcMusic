<%@ page language="java" import="java.util.*,com.mcmusic.utils.*" pageEncoding="utf-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String lrc = MusicUtil.getLrc(request);
	out.print(lrc);
	
%>