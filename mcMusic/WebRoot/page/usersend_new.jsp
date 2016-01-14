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
		<title>follow音乐</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/animate.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		
		<style type="text/css">
			.usersend{width:100%;height:600px;background:#eee;}
			.usersend .u_title{width:1035px;height:80px;margin:0 auto;}
			.usersend .u_title ul li{width:70px;height:30px;float:right;margin-top:30px;}
			.usersend .u_title ul li a{display:block;width:70px;height:30px;line-height:30px;text-align:center;color:#333;font-size:13px;}
			.usersend .u_title ul li a:hover{color:#27d5bf;}
			.usersend .u_content{width:1035px;height:660px;margin:0 auto;}
			.usersend .u_content .c_left{width:700px;height:430px;float:left;background:#fff;padding:20px;border-radius:4px;}
			.usersend .u_content .c_right{width:260px;height:400px;border:1px solid #eee;float:right;background:#fff;border-radius:4px;}
			.usersend .u_content .c_right .r_title{width:230px;height:40px;border-bottom:1px solid #bbb;font-size:16px;margin-left:16px;color:#333;line-height:40px;}
			.usersend .u_content .c_right .r_list{width:270px;height:350px;margin-top:10px;}
			.usersend .u_content .c_right .r_list ul li{width:260px;height:40px;margin-bottom:10px;}
			.usersend .u_content .c_right .r_list ul li img{display:inline-block;width:50px;height:40px;border-radius:4px;vertical-align:middle;margin:0px 0 0 20px;}
			.usersend .u_content .c_right .r_list ul li .box{float:right;width:150px;height:40px;margin-right:20px;}
			.usersend .u_content .c_right .r_list ul li p{width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;margin-top:3px;color:#000;}
			
			.c_left form{font-size:16px;color:#000;padding-bottom:20px;border-bottom:1px solid #000;}
			.c_left form span{margin:10px 60px 10px 0;display:block;}
			.c_left form .listname{width:250px;height:36px;border-radius:5px;border:1px solid #e1e1e1;background:#fafafa;outline:none;font-size:16px;padding-left:10px;}
			.c_left form .listdesc{width:250px;height:36px;border-radius:5px;border:1px solid #e1e1e1;background:#fafafa;outline:none;font-size:16px;padding-left:10px;}
			.c_left .submit{display:block;background:#6eb88c;border:1px solid #6eb88c;width:130px;height:40px;border-radius:4px;font-size:15px;color:#fff;font-weight:bold;line-height:40px;text-align:center;margin:30px 0 0 0;cursor:pointer;}
		</style>
	</head>
<body>
<jsp:include  page="head.jsp"/>
	<div class="usersend">
		<div class="u_title">
			<ul>
				<li><a href="">全部乐单</a></li>
				<li><a href="">我的乐单</a></li>
				<li><a style="color:#27d5bf;" href="">精品乐单</a></li>
			</ul>
		</div>
		<div class="u_content">
			<div class="c_left">
				<div l_title style="width:100%;height:44px;color:#333;border-bottom:1px solid #000;font-size:18px;line-height:44px;font-weight:bold;">新建乐单</div>
				<form action="<%=path %>/NewUserSendServlet" enctype="multipart/form-data" method="post">
					<span  style="margin-top:20px;">我的乐单名</span>
					<input id="listname" class="listname" type="text" name="listname" required><br>
					<span>乐单描述</span>
					<input id="listdesc" class="listdesc" type="text" name="listdesc" required><br>
					<span>选择乐单封面</span>
					<div class="choose_img">
						<a href="javascript:void(0)" style="background:#fafafa;display:block;width:70px;height:38px;border:1px solid #e1e1e1;border-radius:3px 0 0 3px;background:url('../images/icon2.png');background-position:-27px -459px;">
							<input onchange="uploadFace(this);" id="file" class="file" type="file" name="file" style="width:70px;height:38px;opacity:0;cursor:pointer;">
						</a>
						<div id="filename" style="background:#fafafa;width:178px;height:38px;border:1px solid #e1e1e1;border-radius:0 3px 3px 0;position:absolute;top:404px;left:253px;line-height:38px;padding-left:10px;font-size:12px;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"></div>
					</div>
					<input type="submit" class="submit" value="新建乐单">
				</form>
				<img id="preview" style="width:300px;height:200px;position:absolute;z-index:999;top:240px;left:500px;"/>
			</div>
			
			<div class="c_right" style="display:none;">
			</div>
		</div>
	</div>
<jsp:include page="bottom.jsp"/>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript" src="<%=path %>/js/dialog_login.js"></script>
<script type="text/javascript">
	//点击登录显示登录页面
	$(".l_login").click(function(){
		$.dialog("login","null");
		return false;
	});
	
	//点击注册显示登录页面
	$(".l_register").click(function(){
		$.dialog("register","null");
		return false;
	});
	
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
	
	function uploadFace(sender){
		//判断选择的是不是图片
		if(!sender.value.match(/.jpg|.png/i))
		{
			alert("请选择正确的音乐文件");
		}
		else
		{
			var filenmae=document.getElementById("filename");
			filename.innerHTML=sender.files[0].name;
			
			//将图片加载到div盒子中
			var preview=document.getElementById("preview");
			preview.src=window.URL.createObjectURL(sender.files[0]);
		}
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