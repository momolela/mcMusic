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
			.allmusic{width:100%;height:580px;background:#fff;}
			.allmusic .a_content{width:1035px;height:580px;margin:0 auto;}
			.allmusic .a_content .c_title{width:100%;height:0px;}
			.allmusic .a_content .c_left{margin-top:40px;float:left;width:160px;height:400px;border:1px solid #EEE;}
			.allmusic .a_content .c_left ul li{width:160px;height:30px;}
			.allmusic .a_content .c_left ul li a{border-left:5px solid #fff;display:block;width:155px;height:30px;text-indent:17px;line-height:30px;color:#333;font-size:14px;}
			.allmusic .a_content .c_left ul li a:hover{border-left:5px solid #F60;color:#0c8f44;font-weight:bold;background:#eee;}
			.allmusic .a_content .c_left .l_title{width:100%;height:60px;}
			.allmusic .a_content .c_left .l_title span{display:block;width:144px;height:60px;margin:0 auto;border-bottom:1px dotted #D7D7D7;line-height:60px;color:#0c8f44;font-weight:bold;font-size:14px;text-indent:15px;}
			.allmusic .a_content .c_right{margin-top:40px;float:right;width:830px;height:400px;}
			.allmusic .a_content .c_right .r_title{width:100%;height:60px;}
			.allmusic .a_content .c_right .r_title h2{width:100%;height:60px;color:#333;font-size:28px;font-weight:normal;}
			.allmusic .a_content .c_right .r_ul li{background-color: #FFF;height:29px;margin:4px 0 4px 0;border-bottom:1px dotted #FFF;overflow:hidden;line-height:29px;cursor:pointer;}
			.allmusic .a_content .c_right .r_ul li:hover{border-bottom:1px dotted #bbb;}
			.allmusic .a_content .c_right .r_ul li .u_no{width:15px;height:29px;color:#bbb;display:inline-block;vertical-align:top;font-size:14px;}
			.allmusic .a_content .c_right .r_ul li .u_fen{width:15px;height:29px;color:#bbb;display:inline-block;vertical-align:top;font-size:14px;margin:0 5px 0 5px;font-weight:bold;}
			.allmusic .a_content .c_right .r_ul li .u_songname{width:195px;height:29px;color:#0c8f44;display:inline-block;vertical-align:top;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
			.allmusic .a_content .c_right .r_ul li .u_singer{width:100px;height:29px;color:#333;display:inline-block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;margin-left:10px;}
			.allmusic .a_content .c_right .r_ul li .u_album{width:100px;height:29px;color:#333;display:inline-block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
			.allmusic .a_content .c_right .r_ul li .u_upload{width:100px;height:29px;color:#333;display:inline-block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;text-align:center;}
			.allmusic .a_content .c_right .r_ul li .u_uptime{width:100px;height:29px;color:#333;display:inline-block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
			.allmusic .a_content .c_right .r_ul li i{margin-top:8px;display:inline-block;width:14px;height:16px;background:url('<%=path%>/images/usersend_page/music_page.png');vertical-align:top;margin-left:10px;cursor:pointer;}
			.allmusic .a_content .c_right .r_ul li .play{background-position:0 -169px;}
			.allmusic .a_content .c_right .r_ul li .play:hover{background-position:0 -183px;}
			.allmusic .a_content .c_right .r_ul li .add{background-position:-43px -169px;}
			.allmusic .a_content .c_right .r_ul li .add:hover{background-position:-43px -183px;}
			.allmusic .a_content .c_right .r_ul li .comment{background-position:-28px -169px;}
			.allmusic .a_content .c_right .r_ul li .comment:hover{background-position:-28px -183px;}
			
			.s_pagecount{width:824px;font-size:15px;color:#27d5bf;margin:74px auto 0 auto;height:30px;}
			.s_pagecount .p_content{float:right;height:30px;}
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
					<li><a href="page/Allmv.jsp">MV</a></li>
				</ul>
			</div>
			<div class="c_right">
				<div class="r_title">
					<h2>所有歌曲<span style="display:inline-block;color:#333;float:right;font-size:14px;margin-right:14px;line-height:60px;color:#0c8f44;">Follow</span></h2>
				</div>
				<ul class="r_ul">
					<c:forEach items="${song_all }" var="item" varStatus="idx">
						<li>
							<span class="u_no">${idx.count }</span><span class="u_fen">-</span><span class="u_songname">${item.songname }</span><span class="u_singer">${item.singer }</span><span class="u_album">&lt;${item.album }&gt;</span><span class="u_upload">${item.uploaduserid }</span><span class="u_uptime">${item.uptime }</span><i style="margin-left:112px;" class="play"></i><i class="add"></i><i class="comment"></i>
						</li>
					</c:forEach>
				</ul>
				<div class="s_pagecount">
				<div class="p_content">
					<c:if test="${curPage[0]>1 }">
						<a style="background:rgba(255,255,255,0.6);line-height:30px;text-align:center;display:inline-block;width:60px;height:30px;color:#333;" href="<c:url value='/QueryAllmusicServlet?pn=${curPage[0]-1 }'/>">上一页</a>
					</c:if>
					<%--计算begin,end --%>
					<c:choose>
						<%--如果页面不足10页，就全部显示 --%>
						<c:when test="${curPage[1]<=10 }">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="${curPage[1] }"></c:set>
						</c:when>
						<c:otherwise>
							<%--如果页面>10页，就用公式计算 --%>
							<c:set var="begin" value="${curPage[0]-5 }"></c:set>
							<c:set var="end" value="${curPage[0]+4 }"></c:set>
							<%--头溢出 --%>
							<c:if test="${begin < 1 }">
								<c:set var="begin" value="1"/>
								<c:set var="end" value="10"/>
							</c:if>
							<%--尾溢出 --%>
							<c:if test="${end > curPage[1] }">
								<c:set var="begin" value="${curPage[1] - 9 }"/>
								<c:set var="end" value="${curPage[1] }"/>
							</c:if>
						</c:otherwise>
					</c:choose>
					<%--循环遍历页面列表 --%>
					<c:forEach var="i" begin="${begin }" end="${end }">
						<c:choose>
							<c:when test="${i eq curPage[0] }">
								<span style="background:rgba(39,213,191,0.5);line-height:30px;text-align:center;display:inline-block;width:30px;height:30px;color:#fff;">${i }</span>
							</c:when>
							<c:otherwise>
								<a style="background:rgba(255,255,255,0.6);line-height:30px;text-align:center;display:inline-block;width:30px;height:30px;color:#333;" href="<c:url value='/QueryAllmusicServlet?pn=${i }'/>">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${curPage[0]<curPage[1] }">
						<a  style="background:rgba(255,255,255,0.6);line-height:30px;text-align:center;display:inline-block;width:60px;height:30px;color:#333;" href="<c:url value='/QueryAllmusicServlet?pn=${curPage[0]+1 }'/>">下一页</a>
					</c:if>
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