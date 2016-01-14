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
		<title>follow音乐-用户信息</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/animate.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		<style type="text/css">
			.allmusic{width:100%;height:640px;background:#fff;}
			.allmusic .a_content{width:1035px;height:640px;margin:0 auto;}
			.allmusic .a_content .c_title{width:100%;height:0px;}
			.allmusic .a_content .c_left{margin-top:40px;float:left;width:160px;height:400px;border:1px solid #EEE;}
			.allmusic .a_content .c_left ul li{width:160px;height:30px;}
			.allmusic .a_content .c_left ul li a{border-left:5px solid #fff;display:block;width:155px;height:30px;text-indent:17px;line-height:30px;color:#333;font-size:14px;}
			.allmusic .a_content .c_left ul li a:hover{border-left:5px solid #F60;color:#0c8f44;font-weight:bold;background:#eee;}
			.allmusic .a_content .c_left .l_title{width:100%;height:60px;}
			.allmusic .a_content .c_left .l_title span{display:block;width:144px;height:60px;margin:0 auto;border-bottom:1px dotted #D7D7D7;line-height:60px;color:#0c8f44;font-weight:bold;font-size:14px;text-indent:15px;}
			.allmusic .a_content .c_right{margin-top:40px;float:right;width:830px;height:484px;}
			.allmusic .a_content .c_right .r_title{width:100%;height:60px;}
			.allmusic .a_content .c_right .r_title h2{width:100%;height:40px;color:#333;font-size:28px;font-weight:normal;}
			.allmusic .a_content .c_right .r_title .title{width:100%;height:40px;color:#333;font-size:14px;border-bottom:1px solid #eee;}
			.allmusic .a_content .c_right .r_title .title ul li{width:60px;height:40px;float:left;line-height:40px;}
			.allmusic .a_content .c_right .r_title .content{width:100%;height:384px;margin-top:20px;}
			.allmusic .a_content .c_right .r_title .content ul li{margin-top:10px;margin-left:24px;margin-right:23px;float:left;width:160px;height:181px;background:#eee;}
		</style>
	</head>
<body>
	<jsp:include  page="head.jsp"/>
	<div class="allmusic">
		<div class="a_content">
			<div class="c_title"></div>
			<div class="c_left">
				<div class="l_title"><span><a style="color:#0c8f44;" href="<%=path %>/QueryAllmusicServlet?pn=1">所有歌曲</a></span></div>
				<ul>
					<li style="color:#000;text-indent:22px;font-size:20px;font-weight:500;margin-top:20px;">歌曲分类</li>
					<li><a href="<%=path %>/QueryAllmusicByType?pn=1&songtypeid=1">内地</a></li>
					<li><a href="<%=path %>/QueryAllmusicByType?pn=1&songtypeid=2">台湾</a></li>
					<li><a href="<%=path %>/QueryAllmusicByType?pn=1&songtypeid=3">日韩</a></li>
					<li><a href="<%=path %>/QueryAllmusicByType?pn=1&songtypeid=4">欧美</a></li>
					<li style="border-top:1px dotted #D7D7D7;margin:0 auto;padding-top:16px;width:144px;color:#000;text-indent:14px;font-size:20px;font-weight:500;margin-top:20px;">MV库</li>
					<li><a href="">MV</a></li>
				</ul>
			</div>
			<div class="c_right">
				<div class="r_title">
					<h2>所有MV<span style="display:inline-block;color:#333;float:right;font-size:14px;margin-right:14px;line-height:60px;color:#0c8f44;">Follow</span></h2>
					<div class="title">
						<ul>
							<li style="color:#0c8f44;font-weight:bold;"><i style="display:inline-block;position:absolute;width:11px;height:7px;background:url('//imgcache.gtimg.cn/mediastyle/musicprotal/img/tab_bg.png');top:164px;left:376px;"></i>主页</li>
							<li><i style="display:inline-block;position:absolute;width:11px;height:7px;background:url('//imgcache.gtimg.cn/mediastyle/musicprotal/img/tab_bg.png');top:164px;left:436px;display:none;"></i>外网</li>
						</ul>
					</div>
					<div class="content">
						<ul>
							<li><img src="http://vpic.video.qq.com/54684625/x0019kkefw7_160_90_3.jpg"/></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</div>
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
	 //点击保存修改
	$(".submit").click(function(){
		var username = document.getElementById("username").value;
		var sex = document.getElementById("sex").value;
		var parameter = "username="+username+"&sex="+sex;
		sendRequest("../ChangeInfoServlet",parameter,callback);
	});
	 
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
	
	//3.回调方法
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
				eval(xmlHttp.responseText);
				if(result.flag)
				{
					window.location.reload(location);
				}
				else{
					document.getElementById("error_msg").innerHTML=result.message;
				}
			}
		}
	}
</script>
</body>