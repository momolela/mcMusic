<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!--m-top start-->
	<div class="m-top">
		<div class="t-head">
			<div class="h-logo">
				<a href="<%=path %>/index.jsp"><img src="<%=path %>/images/logo1.png" alt="follow音乐网" title="follow音乐网"/></a>
			</div>
			<div class="h-nav">
				<ul>
					<li style="margin-left:130px;"><a class="a" href="<%=path %>/index.jsp">首页</a></li>
					<li>
						<a class="a" href="#">音乐/MV</a>
						<div class="n-xiala1">
							<ul>
								<li><a id="allsend" name="" href="<%=path %>/QueryUsersendListServlet?pn=1">精品乐单</a></li>
								<li><a id="allmusic" href="<%=path %>/QueryAllmusicServlet?pn=1">歌曲广场</a></li>
								<li><a id="allmv" href="<%=path %>/page/Allmv.jsp">MV库</a></li>
							</ul>
						</div>
					</li>
					<li><a class="a" href="#">音乐资讯</a></li>
					<li><a id="mymusicbox" class="a" href="javascript:void(0)" onclick="login();">我的音乐盒</a></li>
					<li><a class="a" href="<%=path %>/page/a_about.jsp" target="_blank">关于我们</a></li>
				</ul>
			</div>
			<div class="h-search" style="position:relative;">
				<input type="text" placeholder="搜索歌手，歌曲"><a href="#">搜索</a>
				<div class="s_xiala" style="overflow:auto;position:absolute;top:41px;height:160px;width:300px;background:rgba(255,255,255,.9);z-index:999;display:none;">
					<ul class="s_ul">
						<!-- <li style="width:100%;height:30px;margin:0;"><a href="javascript:void(0)">bigbang-if you.mp3---《M》</a></li>
						<li style="width:100%;height:30px;margin:0;"><a href="javascript:void(0)">bigbang-if you.mp3---《M》</a></li> -->
					</ul>
				</div>
			</div>
			<%-- <%session.setAttribute("userInfo","hello"); %> --%>
			<%-- <%session.removeAttribute("userInfo"); %> --%>
			<%if (session.getAttribute("userInfo") == null){%>
			<div class="h-login">
				<a class="l_login" href="javascript:void(0)">登录</a><span>|</span><a class="l_register" href="javascript:void(0)">注册</a>
			</div>
			<%}else{%>
			<div class="h-user" style="position:relative;">
				<a class="u-name" href="javascript:void(0)">
					<img src="<%=path %>/${userInfo.userpicurl }"/>
					<b>${userInfo.username }</b>
				</a>
				<i class="u-xialaicon"></i>
				<div class="u-xiala">
					<div class="x-href">
						<ul>
							<li><a href="<%=path %>/page/UserInfo.jsp" target="_blank">我的信息</a></li>
							<li><a href="<%=path %>/page/UserMusic.jsp" target="_blank">我的歌曲</a></li>
							<li><a href="<%=path %>/LogoutServlet">退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%}%>
		</div>
	</div>
	<!--end m-top-->
	<script src="<%=path %>/js/jquery.js"></script>
	<script>
	$(".m-top .t-head .h-search input").keyup(function(){
	
	//获取文本框的值
	var value = $(this).val();
	var _this = $(this);
	//alert("1");
	$(".m-top .t-head .h-search .s_xiala").empty();
	$(".m-top .t-head .h-search .s_xiala").show();

	$.ajax({
		type:"post",
		url:"<%=path%>/utilPage/search.jsp",
		//data:"",
		success:function(data){

			//data字符串转换成数组
			//alert(data);
			var arr = eval(data);
			//alert(arr[1]);
			for(var i=0;i<6;i++)
			{
				$(".m-top .t-head .h-search .s_xiala").append("<div class='s_ul'>"+arr[i]+"</div>");
			}

			//关键词的搜索
			$(".m-top .t-head .h-search .s_xiala").prepend($(".m-top .t-head .h-search .s_xiala").find("div:contains("+value+")").each(function(){
				$(this).html($(this).text());
			}).css("color","#bbb"));

			//鼠标点击某个元素给文本框赋值
			$(".m-top .t-head .h-search .s_xiala").find("div").click(function(){
				var text = $(this).text();
				//alert(text);
				_this.val(text);
				$(".m-top .t-head .h-search .s_xiala").hide(function(){
					var songname = _this.val().split("-")[0];
					var singer = _this.val().split("_")[0].split("-")[1];
					var album = _this.val().split("《")[1].split("》")[0];
					var url = _this.val().split("=")[1];
					var html=$("<li path='"+url+"' name='"+songname+"' singer='"+singer+"'album='"+album+"'>"+
							   "	<a href='javascript:void(0)'>"+songname+"</a>"+
							   "	<a href='javascript:void(0)'>"+singer+"</a>"+
							   "	<div class='control'>"+
							   "		<i class='add'></i>"+
							   "		<i class='del'></i>"+
							   "	</div>"+
							   "</li>");
					$(".music-list").append(html);
					html.children().eq(1).click();
					localStorage.setItem("musiclist",$(".music-list").html());
					$('#ui-audioface div.ui-content ul.ui-tools li a.ui-list').text($('#ui-audioface div.ui-list ul li').size());
					localStorage.setItem("musiccount",$('#ui-audioface div.ui-list ul li').size());
					$("#ui-audioface .ui-alert i").css("display","block");
					$("#ui-audioface .ui-alert i").fadeOut(1000);
				});
				//$(".s_show").fadeOut("slow",function(){
					//window.location.href="http://www.baidu.com/s?wd="+text;
				//});
			});
		}
	});
});
	</script>