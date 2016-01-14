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
		<title>follow音乐网-头像</title>
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
			.userInfo .u_info .left_nav .n_info .title p{width:160px;height:40px;float:right;line-height:40px;font-size:16px;color:#999;}
			.userInfo .u_info .left_nav .n_safe{width:260px;height:190px;background:#fff;border-top:5px solid #bbb;}
			.userInfo .u_info .left_nav .n_safe ul li{width:160px;height:40px;margin:22px 0 0 50px;text-align:center;line-height:40px;font-size:14px;}
			.userInfo .u_info .left_nav .n_safe ul li a{color:#bbb;display:block;width:160px;height:40px;}
			.userInfo .u_info .left_nav .n_safe ul li a:hover{background:#f7f7f7;color:#000;}
			.userInfo .u_info .left_nav .n_safe .title{width:260px;height:40px;background:#f7f7f7;}
			.userInfo .u_info .left_nav .n_safe .title i{display:inline-block;width:20px;height:20px;vertical-align:middle;background:url("../images/icon2.png") -55px -214px;margin:10px 0 0 40px;}
			.userInfo .u_info .left_nav .n_safe .title p{width:160px;height:40px;float:right;line-height:40px;font-size:16px;color:#999;}
			.userInfo .u_info .mid .mid_pic{padding:40px;width:740px;height:420px;background:#fff;border-radius:4px;position:absolute;left:318px;}
			.userInfo .u_info .mid .mid_pic form .img_box{width:200px;height:200px;border:1px solid #ccc;border-radius:6px;margin-top:20px;}
			.userInfo .u_info .mid .mid_pic form .file{width:200px;height:200px;opacity:0;cursor:pointer;}
			.userInfo .u_info .mid .mid_pic .submit{display:block;background:#6eb88c;border:1px solid #6eb88c;width:130px;height:40px;border-radius:4px;font-size:15px;color:#fff;font-weight:bold;line-height:36px;text-align:center;margin-top:60px;}
			.userInfo .u_info .right_nav{width:60px;height:200px;background:#fff;border-radius:4px 0 0 4px;float:right;margin-top:140px;border-right:5px solid #66cc33;}
			.userInfo .u_info .right_nav i{margin:52px 0 0 20px;display:inline-block;width:19px;height:19px;background:url("../images/icon2.png") -111px -214px;}
			.userInfo .u_info .right_nav p{width:60px;height:100px;text-align:center;line-height:18px;font-size:16px;color:#999;}
			.userInfo .u_info .right_back{display:block;width:50px;height:50px;position:absolute;right:50px;bottom:46px;background:rgba(0,0,0,.1);}
			.userInfo .u_info .right_back i{display:block;width:18px;height:18px;background:url('../images/icon2.png');background-position:-138px -104px;margin:16px 0 0 16px;}
			.userInfo .u_info .right_back .b_back{display:none;width:80px;height:50px;background:#fff;position:absolute;left:50px;bottom:0px;color:#6eb88c;font-size:12px;line-height:50px;text-align:center;}
			
		</style>
	</head>
<body>
<jsp:include page="head.jsp"/>
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
						<p>个人资料</p>
					</div>
					<ul>
						<li class="basicinfo"><a href="<%=path %>/page/UserInfo.jsp">基本信息</a></li>
						<li class="pic"><a href="javascript:void(0)">头像设置</a></li>
					</ul>
				</div>
				<div class="n_safe">
					<div class="title">
						<i></i>
						<p>账号安全</p>
					</div>
					<ul>
						<li class="modipassword"><a href="<%=path %>/page/UserPsw.jsp">修改密码</a></li>
						<li class="modiemail"><a href="<%=path %>/page/UserMail.jsp">邮箱设置</a></li>
					</ul>
				</div>
			</div>
			<!-- end left_nav -->
			
			<!-- mid start -->
			<div class="mid">
				<div class="mid_pic">
					<div class="mid_title">更改头像</div>
					<form action="ChangePicServlet" enctype="multipart/form-data" method="post">
						<div class="img_box">
							<input id="file" class="file"  type="file" name="file" title="点击上传头像"  onchange="uploadFace(this);">
							<img src="../images/user/img.png" style="position:absolute;top:170px;left:126px;"/>
							<a href="javascript:void(0)" class="submit" onclick="UploadFile()">确认上传</a>
						</div>
					</form>
					<div class="right_img" style="position:absolute;top:65px;right:220px;width:240px;height:310px;padding:20px;">
						<div style="margin-bottom:20px;"><img id="preview" src="<%=path %>/${userInfo.userpicurl }" width="100px" height="100px"/><p>100*100</p></div>
					</div>
					
				</div>
			</div>
			<!-- end mid -->
			
			<!-- right_nav start -->
			<div class="right_nav">
				<i></i>
				<p>账<br>户<br>设<br>置</p>
			</div>
			<!-- end right_nav -->
			
			<!-- right_back start -->
			<a class="right_back" href="<%=path %>/page/UserMusic.jsp">
				<i></i>
				<div class="b_back">
					回到我的歌曲
				</div>
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
	//悬浮在回到我的歌曲
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
</script>

<script type="text/javascript">
	$(".n_info ul .basicinfo a").click(function(){
		$(".mid_info").show().siblings().hide();
	});
	$(".n_info ul .pic a").click(function(){
		$(".mid_pic").show().siblings().hide();
	});
	$(".n_safe ul .modipassword a").click(function(){
		$(".mid_psw").show().siblings().hide();
	});
	$(".n_safe ul .modiemail a").click(function(){
		$(".mid_emial").show().siblings().hide();
	});
	
	function uploadFace(sender){
		//判断选择的是不是图片
		if(!sender.value.match(/.jpg|.gif|.png|.bmp|.jpeg/i))
		{
			alert("请选择正确的图片文件");
		}
		else
		{
			//将图片加载到div盒子中
			var preview=document.getElementById("preview");
			preview.src=window.URL.createObjectURL(sender.files[0]);

		}
	}
	
	/**
	 * 异步请求的方法
	 */
	function UploadFile() {

            var fileObj = document.getElementById("file").files[0]; // 获取文件对象
            var FileController = "../ChangePicServlet";                   // 接收上传文件的后台地址 

            // FormData 对象

            var form = new FormData();
            form.append("author", "hooyes");                        // 可以增加表单数据
            form.append("file", fileObj);                           // 文件对象

            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("post", FileController, true);
            xhr.onload = function () {
                window.location.reload(location);
            };
            xhr.send(form);
        }
</script>
</body>