<%@ page language="java" import="java.util.*,com.mcmusic.utils.*,com.mcmusic.test.*" pageEncoding="utf-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String result = GetSong.getSong(request);
	out.print(result);
	
%>