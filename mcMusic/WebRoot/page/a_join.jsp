<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="Author" content="mc&lj">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta name="Keywords" content="follow音乐,mv,音乐资讯">
		<meta name="Description" content="follow音乐网,最全面最华丽的音乐网,好听,好看,尽在follow音乐网.音乐,MV,音乐资讯一手掌握.就来follow音乐网.">
		<title>follow音乐-加入我们</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/animate.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		<style type="text/css">
			.about{width:100%;height:1140px;background:#eee;}
			.about .a_content{width:1035px;height:1066px;background:#fff;position:absolute;top:80px;left:50%;margin-left:-518px;border-radius:6px;}
			.about .a_content .top{width:100%;height:525px;}
			.about .a_content .top .t_nav{width:100%;height:95px;}
			.about .a_content .top .t_nav .n_nav{width:960px;margin:auto;padding-top:35px;padding-bottom:35px;}
			.about .a_content .top .t_nav .n_nav a{display:block;float:left;width:159px;height:25px;border-left:1px solid #e1e1e1;text-indent:20px;color:#000;font-size:18px;}
			.about .a_content .top .t_nav .n_nav a i{display:inline-block;float:left;width:25px;height:25px;background:url("../images/aboutme/head/about.png");margin-left:20px;}
			
			/*bottom start*/
			.about .a_content .bottom{width:100%;height:540px;}
			.about .a_content .bottom .b_content{width:850px;height:100%;margin:0 auto;}
		</style>
	</head>
<body>
<jsp:include  page="head.jsp"/>
	<div class="about">
		<div class="a_content">
			<!-- top start -->
			<div class="top">
				<div class="t_nav">
					<div class="n_nav">
			            <a style="border-left:0;" href="a_about.jsp" class="guanyu"><i style="background-position:0px 0px;"></i>关于我们</a>
			            <a href="a_author.jsp" class="kaifa"><i style="background-position:-32px 0px;"></i>开发团队</a>
			            <a href="a_music.jsp" class="music"><i style="background-position:-64px 0px;"></i>音乐传统</a>
			            <a href="a_develop.jsp" class="fazhan"><i style="background-position:-96px 0px;"></i>发展历程</a>
			            <a href="javascript:void(0)" class="jiaru"><i style="background-position:-128px 0px;"></i>加入我们</a>
			            <a href="a_contact.jsp" class="lianxi"><i style="background-position:-160px 0px;"></i>联系我们</a>
					</div>
				</div>
				<img src="../images/aboutme/5.jpg" width="1035" height="430">
			</div>
			<!-- end top -->
			
			<!-- bottom start -->
			<div class="bottom">
				<div class="b_content">
					<div class="weibo" style="margin:60px 0 60px 0;float:left;width:425px;height:420px;">
						<p style="height:40px;font-size:20px;color:#000;text-align:center;line-height:40px;">扫描微博二维码加入我们</p>
						<img src="../images/aboutme/join/weibo.png" style="margin:25px 0 0px 72px;"/>
					</div>
					<div class="weixin" style="margin:60px 0 60px 0;float:right;width:425px;height:420px;">
						<p style="height:40px;font-size:20px;color:#000;text-align:center;line-height:40px;">扫描微信二维码加入我们</p>
						<img src="../images/aboutme/join/weixin.png" style="margin:25px 0 0px 72px;"/>
					</div>
				</div>
			</div>
			<!-- end bottom -->
		</div>
	</div>
<jsp:include page="bottom.jsp"/>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript" src="<%=path %>/js/dialog_login.js"></script>
<script type="text/javascript">
	//点击我的音乐盒
	function login(){
		var nologin = "<%=request.getSession().getAttribute("nologin")%>";
		if(nologin=="true"){
			$.dialog("login","null");
		}else if(nologin=="false"){
			window.open("<%=path%>/page/musicbox.jsp");
		}
	}
	
	//验证码换图片的函数
	function changeCheckCode(){
		var src = "../CheckCodeServlet?haha="+Math.random();
		$(".checkcode").find("img").attr("src",src);
	}
</script>

<script type="text/javascript">
	/**
	 * 异步请求的方法
	 */
	//1.创建XMLHttpRequest
	var xmlHttp;
	function createXMLHttpRequest()
	{
		if(window.XMLHttpRequest)
		{
			xmlHttp = new XMLHttpRequest();
		}
		else if(window.ActiveXObject)
		{
			try {
			xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
		} catch (e) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		}
	}

	//2.异步请求的方法
	function sendRequest(url,parameter,callback)
	{
		createXMLHttpRequest();
		//当准备状态发生变化时调用callBack()
		xmlHttp.onreadystatechange=callback;
		xmlHttp.open("POST",url, true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(parameter);
	}
</script>
</body>