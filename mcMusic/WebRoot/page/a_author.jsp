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
		<title>follow音乐-开发团队</title>
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
			.about .a_content .bottom .b_content .momolela{width:850px;height:220px;border-bottom:1px solid #eee;padding:40px 0 40px 0;}
			.about .a_content .bottom .b_content .caca{width:850px;height:220px;border-bottom:1px solid #eee;padding:40px 0 40px 0;}
			.about .a_content .bottom .b_content .lj{width:850px;height:220px;padding:40px 0 40px 0;float:left;}
			.about .a_content .bottom .b_content .desc{width:490px;height:220px;float:right;}
			.about .a_content .bottom .b_content .desc h3{color:#000;font-size:16px;margin:20px 0 0px 0;}
			.about .a_content .bottom .b_content .desc span{display:block;color:#000;font-size:14px;margin:0px 0 10px 0;}
			.about .a_content .bottom .b_content .desc p{color:#393939;font-size:14px;line-height:22px;}
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
			            <a href="javascript:void(0)" class="kaifa"><i style="background-position:-32px 0px;"></i>开发团队</a>
			            <a href="a_music.jsp" class="music"><i style="background-position:-64px 0px;"></i>音乐传统</a>
			            <a href="a_develop.jsp" class="fazhan"><i style="background-position:-96px 0px;"></i>发展历程</a>
			            <a href="a_join.jsp" class="jiaru"><i style="background-position:-128px 0px;"></i>加入我们</a>
			            <a href="a_contact.jsp" class="lianxi"><i style="background-position:-160px 0px;"></i>联系我们</a>
					</div>
				</div>
				<img src="../images/aboutme/2.jpg" width="1035" height="430">
			</div>
			<!-- end top -->
			
			<!-- bottom start -->
			<div class="bottom">
				<div class="b_content">
					<div class="momolela">
						<img src="../images/aboutme/tuandui/momolela.jpg" width="340"  height="220" />
						<div class="desc">
							<h3>momolela</h3>
							<span>码农一枚</span>
							<p>中文名：孙肇将，Follow音乐平台项目的开发人员之一，现就读于江西师范大学软件学院。前端效果，后台操作，都略懂略懂。没有工作经验，但是项目经验充足。喜欢写代码。</p>
						</div>
					</div>
					<div class="caca">
						<img src="../images/aboutme/tuandui/caca.jpg" width="340"  height="220" />
						<div class="desc">
							<h3>caca</h3>
							<span>码屌一枚</span>
							<p>中文名：刘欢，Follow音乐平台项目的开发人员之一，现就读于江西师范大学软件学院。作为团队颜值担当的人，同时也是团队的核心主力。主要负责项目分析，设计，为项目开发做足了充分的准备。</p>
						</div>
					</div>
					<div class="lj">
						<img src="../images/aboutme/tuandui/lj.jpg" width="340"  height="220" />
						<div class="desc">
							<h3>LJ</h3>
							<span>美女美工</span>
							<p>中文名：刘静，Follow音乐平台项目的开发人员之一，现就读于江西师范大学软件学院。具有高水准的审美和艺术造诣，精通PS、美图秀秀，团队的唯一女性。同时也负责团队项目需求分析。</p>
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