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
		<title>follow音乐-关于我们</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/animate.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		<style type="text/css">
			.about{width:100%;height:1490px;background:#eee;}
			.about .a_content{width:1035px;height:1426px;background:#fff;position:absolute;top:80px;left:50%;margin-left:-518px;border-radius:6px;}
			.about .a_content .top{width:100%;height:525px;}
			.about .a_content .top .t_nav{width:100%;height:95px;}
			.about .a_content .top .t_nav .n_nav{width:960px;margin:auto;padding-top:35px;padding-bottom:35px;}
			.about .a_content .top .t_nav .n_nav a{display:block;float:left;width:159px;height:25px;border-left:1px solid #e1e1e1;text-indent:20px;color:#000;font-size:18px;}
			.about .a_content .top .t_nav .n_nav a i{display:inline-block;float:left;width:25px;height:25px;background:url("../images/aboutme/head/about.png");margin-left:20px;}
			
			/*bottom start*/
			.about .a_content .bottom{width:100%;height:900px;}
			.about .a_content .bottom .b_content{width:850px;height:100%;margin:0 auto;}
			.about .a_content .bottom .b_content p{color:#000;font-size:14px;line-height:22px;margin:60px 0 40px 0;}
			.about .a_content .bottom .b_content .p1 span{font-size:20px;}
			.about .a_content .bottom .b_content .img{width:850px;height:300px;}
			.about .a_content .bottom .b_content .img ul li{padding:0 6px 0 6px;float:left;width:200px;height:300px;box-shadow:0 0 20px rgba(0,0,0,0.2);}
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
			            <a style="border-left:0;" href="javascript:void(0)" class="guanyu"><i style="background-position:0px 0px;"></i>关于我们</a>
			            <a href="a_author.jsp" class="kaifa"><i style="background-position:-32px 0px;"></i>开发团队</a>
			            <a href="a_music.jsp" class="music"><i style="background-position:-64px 0px;"></i>音乐传统</a>
			            <a href="a_develop.jsp" class="fazhan"><i style="background-position:-96px 0px;"></i>发展历程</a>
			            <a href="a_join.jsp" class="jiaru"><i style="background-position:-128px 0px;"></i>加入我们</a>
			            <a href="a_contact.jsp" class="lianxi"><i style="background-position:-160px 0px;"></i>联系我们</a>
					</div>
				</div>
				<img src="../images/aboutme/1.jpg" width="1035" height="430">
			</div>
			<!-- end top -->
			
			<!-- bottom start -->
			<div class="bottom">
				<div class="b_content">
					<p class="p1"><span>F</span>ollow音乐台，由 江西师范大学 - 软件学院 - X3507工作室 - 学生孙肇将，刘欢，刘静三人倾心打造。<br>在这个潮流时代，数据信息瞬息万变。生活的快节奏成为了一种无形的压力，人似乎是被推着行进。几乎是失去了自主。<br><span>H</span>owever，在这里，我们为您提供了一片净土，一片音乐的净土。在这里你可以得到释放，在享受音乐<br>的同时，找回真正的自己。这个音乐平台会给你一种不一样的感觉，来这里，认认真真的享受每一首歌，享受每一天。<br><span>P</span>lease Follow Me！！！</p>
					<div class="img">
						<ul>
							<li><a><img src="../images/aboutme/page/home.png" width="200px" height="300px"/></a></li>
							<li><a><img style="margin-top:30px;" src="../images/aboutme/page/musicbox.png" width="200px" height="200px"/></a></li>
							<li><a><img style="margin-top:30px;" src="../images/aboutme/page/UserInfo.png" width="200px" height="200px"/></a></li>
							<li><a><img src="../images/aboutme/page/author.png" width="200px" height="300px"/></a></li>
						</ul>
					</div>
					<p class="p1">以上是Follow音乐台1.0版本页面的一些截图。我们会秉承‘没有最好，只有更好‘的信念将Follow做的更好。<br>记住：</p>
					<img src="../images/aboutme/about/a_about.png" style="margin-left:148px;"/>
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