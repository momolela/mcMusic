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
		<title>follow音乐-用户音乐上传</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		<style type="text/css">
			.mid_title{font-size:18px;color:#000;border-bottom:1px solid #bbb;}
			.userInfo{width:100%;height:580px;background:#efefef;}
			.userInfo .u_info{width:1200px;height:500px;margin:0 auto;padding:40px;position:relative;}
			.userInfo .u_info .left_nav{width:260px;height:500px;float:left;}
			.userInfo .u_info .left_nav .n_name{width:260px;height:80px;background:#fff;border-radius:4px;}
			.userInfo .u_info .left_nav .n_name img{border-radius:42px;border:5px solid #fff;margin:-10px 0 0 16px;}
			.userInfo .u_info .left_nav .n_name span{display:block;padding:30px 30px 0 10px;font-size:16px;float:right;width:100px;height:20px;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;}
			.userInfo .u_info .left_nav .n_info{width:260px;height:160px;background:#fff;margin:30px 0 30px 0;border-top:5px solid #bbb;}
			.userInfo .u_info .left_nav .n_info ul li{width:160px;height:40px;margin:14px 0 0 50px;text-align:center;line-height:40px;font-size:14px;}
			.userInfo .u_info .left_nav .n_info ul li a{color:#bbb;display:block;width:160px;height:40px;}
			.userInfo .u_info .left_nav .n_info ul li a:hover{background:#f7f7f7;color:#000;}
			.userInfo .u_info .left_nav .n_info .title{width:260px;height:40px;background:#f7f7f7;}
			.userInfo .u_info .left_nav .n_info .title i{display:inline-block;width:20px;height:20px;vertical-align:middle;background:url("../images/icon2.png") -28px -214px;margin:10px 0 0 40px;}
			.userInfo .u_info .left_nav .n_info .title p{width:174px;height:40px;float:right;line-height:40px;font-size:16px;color:#999;}
			.userInfo .u_info .mid .mid_info{padding:40px;width:740px;height:420px;background:#fff;border-radius:4px;position:absolute;left:318px;}
			.userInfo .u_info .mid .mid_info form{font-size:16px;color:#000;}
			.userInfo .u_info .mid .mid_info form span{margin:10px 60px 10px 0;display:block;}
			.userInfo .u_info .mid .mid_info form .songname{width:250px;height:36px;border-radius:5px;border:1px solid #e1e1e1;background:#fafafa;outline:none;font-size:16px;padding-left:10px;}
			.userInfo .u_info .mid .mid_info form .singer{width:250px;height:36px;border-radius:5px;border:1px solid #e1e1e1;background:#fafafa;outline:none;font-size:16px;padding-left:10px;}
			.userInfo .u_info .mid .mid_info form .album{width:250px;height:36px;border-radius:5px;border:1px solid #e1e1e1;background:#fafafa;outline:none;font-size:16px;padding-left:10px;}
			.userInfo .u_info .mid .mid_info .submit{display:block;background:#6eb88c;border:1px solid #6eb88c;width:130px;height:40px;border-radius:4px;font-size:15px;color:#fff;font-weight:bold;line-height:40px;text-align:center;margin:30px 0 0 0;cursor:pointer;}
			.userInfo .u_info .right_nav{width:60px;height:200px;background:#fff;border-radius:4px 0 0 4px;float:right;margin-top:140px;border-right:5px solid #66cc33;}
			.userInfo .u_info .right_nav i{margin:52px 0 0 20px;display:inline-block;width:19px;height:19px;background:url("../images/icon2.png") -111px -214px;}
			.userInfo .u_info .right_nav p{width:60px;height:100px;text-align:center;line-height:18px;font-size:16px;color:#999;}
			.userInfo .u_info .right_back{display:block;width:50px;height:50px;position:absolute;right:50px;bottom:46px;background:rgba(0,0,0,.1);}
			.userInfo .u_info .right_back i{display:block;width:18px;height:18px;background:url('../images/icon2.png');background-position:-155px -104px;margin:16px 0 0 16px;}
			.userInfo .u_info .right_back .b_back{display:none;width:80px;height:50px;background:#fff;position:absolute;left:50px;bottom:0px;color:#6eb88c;font-size:12px;line-height:50px;text-align:center;}
			
			.songtype .s_xiala ul li label i{vertical-align: middle;background:url('../images/icon2.png');width:20px;height:20px;display:inline-block;background-position:-280px -425px;}
			.songtype .s_xiala ul li label i.check{background-position:-280px -475px;}
		</style>
	</head>
<body>
<jsp:include  page="head.jsp"/>
	<div class="userInfo">
		<div class="u_info">
			<!-- left_nav start -->
			<div class="left_nav">
				<div class="n_name">
					<img src="<%=path %>/${userInfo.userpicurl }" width="75px" height="75px"/>
					<span>${userInfo.username }</span>
				</div>
				<div class="n_info">
					<div class="title">
						<i></i>
						<p>我的音乐我做主</p>
					</div>
					<ul>
						<li class="basicinfo"><a href="<%=path %>/page/UserMusic.jsp">我的歌曲列表</a></li>
						<li class="pic"><a href="javascript:void(0)">上传我的歌曲</a></li>
					</ul>
				</div>
			</div>
			<!-- end left_nav -->
			
			<!-- mid start -->
			<div class="mid">
				<div class="mid_info">
					<div class="mid_title">歌曲上传</div>
					<form action="<%=path %>/UploadMusicServlet" enctype="multipart/form-data" method="post">
						<span  style="margin-top:20px;">歌名( 必填项 )</span>
						<input id="songname" class="songname" type="text" name="songname" required><br>
						<span>歌手名( 必填项 )</span>
						<input id="singer" class="singer" type="text" name="singer" required><br>
						<span>专辑名( 必填项 )</span>
						<input id="album" class="album" type="text" name="album" required><br>
						<div class="songtype" style="cursor:pointer;position:absolute;width:260px;height:274px;top:116px;right:110px;">
							<div class="s_title" style="width:100%;height:40px;background:rgba(0,0,0,.1);">
								<span style="border-right:2px solid #f7f7f7;float:left;padding-left:30px;line-height:40px;width:180px;height:40px;margin:0;color:#333;">选择歌曲类型</span>
								<i class="s_xialaicon" style="margin:12px 17px 0 0;float:right;vertical-align:middle;display:inline-block;width:16px;height:16px;background:url('../images/icon2.png') -213px -53px;"></i>
							</div>
							<div class="s_xiala" style="width:100%;height:160px;background:rgba(0,0,0,.2);">
								<ul>
									<li style="width:100%;height:40px;line-height:40px;text-align:left;"><label style="cursor:pointer;margin-left:30px;"><i></i><input type="radio" name="radio" value="内地" style="opacity:0;" required>内地</label></li>
									<li style="width:100%;height:40px;line-height:40px;text-align:left;"><label style="cursor:pointer;margin-left:30px;"><i></i><input type="radio" name="radio" value="台湾" style="opacity:0;" required>台湾</label></li>
									<li style="width:100%;height:40px;line-height:40px;text-align:left;"><label style="cursor:pointer;margin-left:30px;"><i></i><input type="radio" name="radio" value="日韩" style="opacity:0;" required>日韩</label></li>
									<li style="width:100%;height:40px;line-height:40px;text-align:left;"><label style="cursor:pointer;margin-left:30px;"><i></i><input type="radio" name="radio" value="欧美" style="opacity:0;" required>欧美</label></li>
								</ul>
							</div>
						</div>
						<span>选择歌曲</span>
						<div class="choose_music">
							<a href="javascript:void(0)" style="background:#fafafa;display:block;width:70px;height:38px;border:1px solid #e1e1e1;border-radius:3px 0 0 3px;background:url('../images/icon2.png');background-position:-27px -459px;">
								<input onchange="uploadFace(this);" id="file" class="file" type="file" name="file" style="width:70px;height:38px;opacity:0;cursor:pointer;">
							</a>
							<div id="filename" style="background:#fafafa;width:178px;height:38px;border:1px solid #e1e1e1;border-radius:0 3px 3px 0;position:absolute;bottom:107px;left:111px;line-height:38px;padding-left:10px;font-size:12px;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"></div>
						</div>
						<input type="submit" class="submit" value="上传歌曲">
					</form>
				</div>
			</div>
			<!-- end mid -->
			
			<!-- right_nav start -->
			<div class="right_nav">
				<i></i>
				<p>用<br>户<br>歌<br>曲</p>
			</div>
			<!-- end right_nav -->
			
			<!-- right_back start -->
			<a class="right_back" href="<%=path %>/page/UserInfo.jsp">
				<i></i>
				<div class="b_back">回到我的信息</div>
			</a>
			<!-- end right_back -->
		</div>
	</div>
<jsp:include page="bottom.jsp"/>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript">  
    jQuery.fn.slideLeftHide = function( speed, callback ) {  
        this.animate({  
            width : "hide",  
            paddingLeft : "hide",  
            paddingRight : "hide",  
            marginLeft : "hide",  
            marginRight : "hide"  
        }, speed, callback );  
    };  
    jQuery.fn.slideLeftShow = function( speed, callback ) {  
        this.animate({  
            width : "show",  
            paddingLeft : "show",  
            paddingRight : "show",  
            marginLeft : "show",  
            marginRight : "show"  
        }, speed, callback );  
    };  
</script> 

<script type="text/javascript">
	//悬浮在回到我的信息
	$(".right_back").hover(function(){
			$(this).find("div").slideLeftShow(400);
		},function(){
			$(this).find("div").slideLeftHide(400);
	});
	
	//点击我的音乐盒
	function login(){
		var nologin = "<%=request.getSession().getAttribute("nologin")%>";
		if(nologin=="false"){
			window.open("<%=path%>/page/musicbox.jsp");
		}
	}
	
	function uploadFace(sender){
		//判断选择的是不是图片
		if(!sender.value.match(/.mp3|.MP3/i))
		{
			alert("请选择正确的音乐文件");
		}
		else
		{
			var filenmae=document.getElementById("filename");
			filename.innerHTML=sender.files[0].name;
		}
	}
	
	//
	$(".s_xiala ul li").find("label").click(function(){
		$(this).find("i").addClass("check");
		$(this).parent().siblings().find("label").find("i").removeClass("check");
	});
	
	//
	var state = 1;//0表示没有下来，1表示下来了。
	$(".s_title").click(function(){
		if(state == 0){
			$(".s_xiala").slideDown();
			state = 1;
		}
		else if(state == 1){
			$(".s_xiala").slideUp();
			state = 0;
		}
	});
</script>

<!-- <script type="text/javascript">
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
</script> -->
</body>