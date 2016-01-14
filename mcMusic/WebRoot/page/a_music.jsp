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
		<title>follow音乐-音乐传统</title>
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
			.about .a_content .bottom .b_content p{margin-top:60px;color:#000;font-size:14px;line-height:22px;}
			.about .a_content .bottom .b_content p span{font-size:20px;}
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
			            <a style="border-left:0;" href="a_about" class="guanyu"><i style="background-position:0px 0px;"></i>关于我们</a>
			            <a href="a_author.jsp" class="kaifa"><i style="background-position:-32px 0px;"></i>开发团队</a>
			            <a href="javascript:void(0)" class="music"><i style="background-position:-64px 0px;"></i>音乐传统</a>
			            <a href="a_develop.jsp" class="fazhan"><i style="background-position:-96px 0px;"></i>发展历程</a>
			            <a href="a_join.jsp" class="jiaru"><i style="background-position:-128px 0px;"></i>加入我们</a>
			            <a href="a_contact.jsp" class="lianxi"><i style="background-position:-160px 0px;"></i>联系我们</a>
					</div>
				</div>
				<img src="../images/aboutme/3.jpg" width="1035" height="430">
			</div>
			<!-- end top -->
			
			<!-- bottom start -->
			<div class="bottom">
				<div class="b_content">
					<p><span>音</span>乐是反映人类现实生活情感的一种艺术（英名称：music；法文名称： musique；意大利文：musica）。音乐可以分为声乐和器乐两大类型，又可以分为古典音乐、流行音乐、民族音乐、乡村音乐、原生态音乐等。在艺术类型中，音乐是比较抽象的艺术，音乐从历史发展上可分为东方音乐和西方音乐。东方以中国为首的中国古代理论基础是五声音阶，即宫、商、角、徵、羽，西方是以七声音阶为主。音乐让人赏心悦目，并为您带来听觉的享受。一般一首音乐时长在3分29秒左右，让人更加享受每首音乐的时间，可以陶冶情操。</p>
					<p>音乐是用组织音构成的听觉意象，来表达人们的思想感情与社会现实生活的一种艺术形式。也是最能即时打动人的艺术形式之一。旋律响起人们往往无法抗拒的立即处于音乐的氛围当中。任何一种艺术形式都有自己表情达意、塑造艺术意象的表现形式。比如舞蹈是通过肢体动作、面部表情，绘画是通过线条、色彩、构图，文学是通过字、词、句、篇来体现艺术意象。通常，人们正是以表现手段的不同来区分艺术的不同种类，例如不同的乐器。音乐还能表现出乐手们和音乐创作者的用心。</p>
					<p><span>声</span>音艺术。音乐以声音为表现手段的艺术形式，意象的塑造，以有组织的音为材料来完成的。因此，如同文学是语言的艺术一样，音乐是声音的艺术。这是音乐艺术的基本特征之一。作为音乐艺术表现手段的声音，有与自然界的其他声音不同的一些特点。</p>
					<p><span>听</span>觉艺术。音乐既然是声音的艺术，那么，它只能诉诸于人们的听觉，所以，音乐又是一种听觉艺术。心理学的定向反射和探究反射原理告诉我们，一定距离内的各种外在刺激中，声音最能引起人们的注意，它能够迫使人们的听觉器官去接受声音，这决定了听觉艺术较之视觉艺术更能直接地作用于人们的情感，震撼人们的心灵。</p>
					<p><span>情</span>感艺术。在所有的艺术形式中，音乐是最擅长于抒发情感、最能拨动人心弦的艺术形式，它借助声音这个媒介来真实地传达、表现和感受审美情感。音乐在传达和表现情感上，优于其他艺术形式，是因为它所采用的感性材料和审美形式——声音最合于情感的本性，最适宜表达情感。或庄严肃穆，或热烈兴奋，或悲痛激愤，或缠绵细腻，或如泣如诉。音乐可以更直接、更真实、更深刻地表达人的情感。那么，音乐为什么能够用有组织的声音来表达人的情感呢，一种理论认为，音乐的表情性来自于音乐对人的有表情性因素的语言的模仿。人的语言用语音、声调、语流、节奏、语速等表情手段配合语义来表情达意，而音乐的音色、音调起伏、节奏速度等表现手段能起到与语言的表情手段同样的作用。</p>
					<p><span>时</span>间艺术。雕塑、绘画等艺术形式凝固在空间，使人一目了然。我们欣赏美术作品，首先看到美术作品的整体，然后，才去品味它的细节。而音乐则不同，音乐要在时间里展开、在时间里流动。我们欣赏音乐，首先从细节开始，从局部开始，直到全曲奏（唱）完，才会给我们留下整体印象。只听音乐作品中的个别片断，不可能获得完整的音乐意象。所以，音乐艺术又是一种时间艺术。</p>
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