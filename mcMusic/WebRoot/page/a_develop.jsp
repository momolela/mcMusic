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
		<title>follow音乐-发展历程</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/animate.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		<style type="text/css">
			.about{width:100%;height:1300px;background:#eee;}
			.about .a_content{width:1035px;height:1226px;background:#fff;position:absolute;top:80px;left:50%;margin-left:-518px;border-radius:6px;}
			.about .a_content .top{width:100%;height:525px;}
			.about .a_content .top .t_nav{width:100%;height:95px;}
			.about .a_content .top .t_nav .n_nav{width:960px;margin:auto;padding-top:35px;padding-bottom:35px;}
			.about .a_content .top .t_nav .n_nav a{display:block;float:left;width:159px;height:25px;border-left:1px solid #e1e1e1;text-indent:20px;color:#000;font-size:18px;}
			.about .a_content .top .t_nav .n_nav a i{display:inline-block;float:left;width:25px;height:25px;background:url("../images/aboutme/head/about.png");margin-left:20px;}
			
			/*bottom start*/
			.about .a_content .bottom{width:100%;height:700px;}
			.about .a_content .bottom .b_content{width:850px;height:580px;margin:0 auto;padding:60px 0 60px 0;}
			.about .a_content .bottom .b_content .span{width:48px;display:block;float:left;}
			.about .a_content .bottom .b_content .eleven{width:800px;height:200px;border-left:1px solid #ffdfca;float:right;}
			.about .a_content .bottom .b_content .ten{width:800px;height:220px;border-left:1px solid #ffdfca;float:right;}
			.about .a_content .bottom .b_content .nine{width:800px;height:154px;border-left:1px solid #ffdfca;float:right;}
			.about .a_content .bottom .b_content i{display:block;width:5px;height:5px;border:4px solid #ffdfca;background:#ff9966;border-radius:24px;position:absolute;}
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
			            <a href="javascript:void(0)" class="fazhan"><i style="background-position:-96px 0px;"></i>发展历程</a>
			            <a href="a_join.jsp" class="jiaru"><i style="background-position:-128px 0px;"></i>加入我们</a>
			            <a href="" class="lianxi"><i style="background-position:-160px 0px;"></i>联系我们</a>
					</div>
				</div>
				<img src="../images/aboutme/4.jpg" width="1035" height="430">
			</div>
			<!-- end top -->
			
			<!-- bottom start -->
			<div class="bottom">
				<div class="b_content">
					<div style="height:200px;position:relative;">
						<span class="span" style="margin-top:184px;">11月份</span>
						<div class="eleven"><i style="top:186px;left:43px;"></i>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">现在终于完成了这个项目。</div></div>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">11月份，我们还在努力写。努力写。。。。</div></div>
						</div>
					</div>
					<div style="height:220px;position:relative;">
						<span class="span" style="margin-top:204px;">10月份</span>
						<div class="ten"><i style="top:207px;left:43px;"></i>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">10月份末，我们有了第一个页面，Follow的首页。高端、大气、上档次。</div></div>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">10月8日，国庆节后，我们开始做一个音乐平台，它叫做Follow音乐台。</div></div>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">十月份初，我们还在学习着技术。各种语言，各种绕。。。</div></div>
						</div>
					</div>
					<div style="height:154px;position:relative;">
						<span class="span" style="margin-top:140px;">9月份</span>
						<div class="nine"><i style="top:142px;left:43px;"></i>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">9月22日，孙肇将，刘欢，刘静。三个人组成了一个团队。</div></div>
							<div style="margin-top:20px;height:50px;"><span style="margin:14px 0 0 8px;float:left;display:block;width:0px;height:0px;border-right:10px solid #ffdfca;border-top:6px solid transparent;border-bottom:6px solid transparent;"></span><div style="padding-left:10px;float:right;border-radius:4px;width:770px;height:40px;border:1px solid #ffdfca;line-height:36px;color:#000;font-size:16px;">9月12日，开学了。我们步入了大三，我们团队在X3507相识了。</div></div>
						</div>
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