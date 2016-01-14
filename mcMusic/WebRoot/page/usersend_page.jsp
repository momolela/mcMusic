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
			.usersend{width:100%;height:790px;background:#eee;}
			.usersend .u_title{width:1035px;height:80px;margin:0 auto;}
			.usersend .u_title ul li{width:70px;height:30px;float:right;margin-top:30px;}
			.usersend .u_title ul li a{display:block;width:70px;height:30px;line-height:30px;text-align:center;color:#333;font-size:13px;}
			.usersend .u_title ul li a:hover{color:#27d5bf;}
			.usersend .u_content{width:1035px;height:660px;margin:0 auto;}
			.usersend .u_content .c_left{width:700px;height:620px;float:left;background:#fff;padding:20px;border-radius:4px;}
			.usersend .u_content .c_left .l_author{width:680px;height:200px;border:1px solid #eee;padding:10px;}
			.usersend .u_content .c_left .l_author .right{width:450px;height:200px;float:right;}
			.usersend .u_content .c_left .l_author .right .p1{width:470px;font-size:15px;font-weight:bold;color:#7a7a7a;line-height:30px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
			.usersend .u_content .c_left .l_author .right span{color:#999;margin-top:20px;display:block;}
			.usersend .u_content .c_left .l_author .right .p2{width:370px;height:40px;line-height:20px;color:#999;margin-top:10px;}
			.usersend .u_content .c_left .l_author .right .userinfo{width:470px;height:60px;margin-top:20px;}
			.usersend .u_content .c_left .l_author .right .userinfo img{display:inline-block;border-radius:24px;vertical-align:middle;margin-right:10px;}
			.usersend .u_content .c_left .l_song{width:100%;height:380px;padding:20px 0 0 0;}
			.usersend .u_content .c_left .l_song ul li{width:100%;height:30px;}
			.usersend .u_content .c_left .l_song ul li:hover{background:#f7f7f7;}
			.usersend .u_content .c_left .l_song ul li a{display:inline-block;height:30px;width:580px;line-height:30px;color:#0c8f44;font-size:14px;margin-left:30px;}
			.usersend .u_content .c_left .l_song ul li span{color:#e2e2e2;}
			.usersend .u_content .c_left .s_title{width:660px;height:40px;border-left:5px solid #26c316;font-size:18px;color:#333;line-height:40px;padding-left:36px;background:#f7f7f7;}
			.usersend .u_content .c_left .s_song{width:100%;height:320px;margin-top:20px;}
			.usersend .u_content .c_left .s_song .s_control i{margin-top:8px;display:inline-block;width:14px;height:16px;background:url('images/usersend_page/music_page.png');vertical-align:middle;margin-left:10px;cursor:pointer;}
			.usersend .u_content .c_left .s_song .s_control .play{background-position:0 -169px;}
			.usersend .u_content .c_left .s_song .s_control .play:hover{background-position:0 -183px;}
			.usersend .u_content .c_left .s_song .s_control .add{background-position:-43px -169px;}
			.usersend .u_content .c_left .s_song .s_control .add:hover{background-position:-43px -183px;}
			.usersend .u_content .c_left .s_song .s_control .comment{background-position:-28px -169px;}
			.usersend .u_content .c_left .s_song .s_control .comment:hover{background-position:-28px -183px;}
			
			
			.usersend .u_content .c_right{width:260px;height:400px;border:1px solid #eee;float:right;background:#fff;border-radius:4px;}
			.usersend .u_content .c_right .r_title{width:230px;height:40px;border-bottom:1px solid #bbb;font-size:16px;margin-left:16px;color:#333;line-height:40px;}
			.usersend .u_content .c_right .r_list{width:270px;height:350px;margin-top:10px;}
			.usersend .u_content .c_right .r_list ul li{width:260px;height:40px;margin-bottom:10px;}
			.usersend .u_content .c_right .r_list ul li img{display:inline-block;width:50px;height:40px;border-radius:4px;vertical-align:middle;margin:0px 0 0 20px;}
			.usersend .u_content .c_right .r_list ul li .box{float:right;width:150px;height:40px;margin-right:20px;}
			.usersend .u_content .c_right .r_list ul li p{width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;margin-top:3px;color:#000;}
		</style>
	</head>
<body>
	<jsp:include  page="head.jsp"/>
	<div class="usersend">
		<div class="u_title">
			<ul>
				<li><a href="<%=path %>/QueryUsersendListServlet?pn=1">全部乐单</a></li>
				<li><a style="color:#27d5bf;" href="javascript:void(0)">精品乐单</a></li>
			</ul>
		</div>
		<div class="u_content">
			<div class="c_left">
				<div class="l_author">
					<img src="${usersendlist[0].picurl}" width="200px" height="200px"/>
					<div class="right">
						<p class="p1">${usersendlist[0].title}</p>
						<span>推荐理由:</span>
						<p class="p2">${usersendlist[0].content}</p>
						<div class="userinfo">
							<img src="${usersendlist[0].userpicurl}" width="40px" height="40px"/>${usersendlist[0].username}
						</div>
					</div>
				</div>
				<div class="l_song">
					<div class="s_title">
						收藏的歌曲
					</div>
					<div class="s_song">
						<ul>
							<c:forEach items="${usersendarray }" var="item" varStatus="idx">
								<li>
									<span>${idx.count}.</span><a href="">${item.singer } - ${item.songname } - 《${item.album }》.mp3</a>
										<div class="s_control" style="float:right;width:72px;height:30px;"><i class="play"></i><i class="add"></i><i class="comment"></i>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="c_right" style="display:none;">
				<div class="r_title">精品推荐的乐单</div>
				<div class="r_list">
					<ul>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">飞机设计古韵的味道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">味道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">飞机设计味道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">飞机设计否定乐古韵的味道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">飞机风古韵的味道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">飞机的味道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
						<li>
							<a href="">
								<img src="images/user/boy.jpg"/>
								<div class="box">
									<p class="p1">飞机道</p>
									<p class="p2">11220 人 赞</p>
								</div>
							</a>
						</li>
					</ul>
				</div>
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