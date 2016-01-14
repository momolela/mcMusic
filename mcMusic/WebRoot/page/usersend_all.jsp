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
			.sendall{width:100%;height:1000px;background:#eee;}
			.sendall .s_nav{width:1035px;height:70px;margin:0 auto;}
			.sendall .s_nav a{font-size:13px;color:#7a7a7a;float:right;padding:0 10px;display:block;margin-top:50px;}
			.sendall .s_nav a:hover{color:#27d5bf;}
			.sendall .s_content{width:995px;height:724px;margin:20px auto 0 auto;background:#fff;padding:20px;border-radius:4px;}
			.sendall .s_content .c_main{width:996px;height:724px;}
			.sendall .s_content .c_main ul li{border:1px solid #e9e9e9;width:477px;height:160px;float:left;padding:10px;margin:-1px 0 0 -1px;}
			.sendall .s_content .c_main ul li img{width:155px;height:155px;float:left;}
			.sendall .s_content .c_main ul li .info{width:300px;height:94px;float:left;margin-left:5px;}
			.sendall .s_content .c_main ul li h3{color:#7a7a7a;cursor:pointer;margin-left:10px;margin-bottom:10px;overflow:hidden;text-overflow: ellipsis;white-space:nowrap;}
			.sendall .s_content .c_main ul li h3:hover{color:#27d5bf;}
			.sendall .s_content .c_main ul li .description{font-size:13px;margin-left:10px;color:#999999;line-height:20px;}
			.sendall .s_content .c_main ul li .mes{font-size:12px;color:black;line-height:25px;margin-left:10px;}
		
			.sendall .s_content .c_main ul li .userinfo{width:300px;height:40px;float:left;margin-left:10px;margin-top:14px;}
			.sendall .s_content .c_main ul li .userinfo img{display:inline-block;width:40px;height:40px;border-radius:24px;vertical-align:middle;}
			.sendall .s_content .c_main ul li .userinfo span{width:200px;font-size:15px;display:inline-block;color:#27d5bf;margin:10px 0 0 5px;}
			
			.sendall .s_pagecount{width:1035px;font-size:15px;color:#27d5bf;margin:30px auto 0 auto;height:30px;}
			.sendall .s_pagecount .p_content{float:right;height:30px;}
			
		</style>
	</head>
<body>
	<jsp:include  page="head.jsp"/>
	<div class="sendall">
		<div class="s_nav">
			<a class="myusersend" href="javascript:void(0)">我的乐单</a>
			<a class="allusersend" href="javascript:void(0)" style="color:#27d5bf;">全部乐单</a>
		</div>
	
		<div class="s_content">
			<div class="c_main">
				<ul>
					<c:forEach items="${usersend_all }" var="item" varStatus="idx">
						<li>
							<a href="<%=path%>/QueryUserSendServlet?id=${item.id }"><img src="${item.picurl }" width="155px" height="155px"></a>
							<div class="info">
								<h3>${item.title }</h3>
								<span class="description">悦单描述：</span>
								<p class="mes">${item.content }</p>
							</div>
							<div class="userinfo">
								<img src="${item.userpicurl }" width="50px" height="50px"/>
								<span>${item.username }</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="s_pagecount">
			<div class="p_content">
				<c:if test="${curPage[0]>1 }">
					<a style="background:rgba(255,255,255,0.6);line-height:30px;text-align:center;display:inline-block;width:60px;height:30px;color:#333;" href="<c:url value='/QueryUsersendListServlet?pn=${curPage[0]-1 }'/>">上一页</a>
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
							<a style="background:rgba(255,255,255,0.6);line-height:30px;text-align:center;display:inline-block;width:30px;height:30px;color:#333;" href="<c:url value='/QueryUsersendListServlet?pn=${i }'/>">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${curPage[0]<curPage[1] }">
					<a  style="background:rgba(255,255,255,0.6);line-height:30px;text-align:center;display:inline-block;width:60px;height:30px;color:#333;" href="<c:url value='/QueryUsersendListServlet?pn=${curPage[0]+1 }'/>">下一页</a>
				</c:if>
			</div>
		</div>
	</div>
<jsp:include page="bottom.jsp"/>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript" src="<%=path %>/js/dialog_login.js"></script>
<script type="text/javascript">
	var nologin = "<%=request.getSession().getAttribute("nologin")%>";
	//点击我的音乐盒
	function login(){
		if(nologin=="true"){
			$.dialog("login","index");
		}else if(nologin=="false"){
			window.open("<%=path%>/page/musicbox.jsp");
		}
	}
	
	//验证码换图片的函数
	function changeCheckCode(){
		var src = "CheckCodeServlet?haha="+Math.random();
		$(".checkcode").find("img").attr("src",src);
	}
</script>

<script type="text/javascript">
	$(".myusersend").click(function(){
		if(nologin=="true"){
			$.dialog("login","index");
		}else if(nologin=="false"){
			sendRequest("<%=path%>/HasUserSendServlet",null,callback_hasusersend);
		}
	});

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
	
	//3.回调函数
	//回调的方法
	function callback_hasusersend()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
				eval(xmlHttp.responseText);
				//查到了
				if(result.flag)
				{
					window.location.href="QueryUserSendServlet?id="+result.ID;
				}
				else{
					//检测用户是否已经拥有了自己的乐单没有就跳转新建
					$.dialog({title:"提示框",content:"你还没有自己的乐单，新建乐单？",callback:function(ok){
						if(ok){
							// 操作后台，等等 ... 你想做的事情
							window.location.href="<%=path%>/page/usersend_new.jsp";
						} else{
							window.location.reload(location);
						}
					}},"alert");
				}
			}
		}
	}
</script>
</body>