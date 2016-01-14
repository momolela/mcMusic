<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.getSession().setAttribute("hdata","1"); %>
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
		<link type="text/css" rel="stylesheet" href="css/index.css"></link>
		<link type="text/css" rel="stylesheet" href="css/animate.css"></link>
		<link type="text/css" rel="stylesheet" href="css/tz.css"></link>
		<link rel="shortcut icon" href="images/fw.ico" />
		<%--
		<script type="text/javascript" src="js/jquery.js"></script>
		<script>
			function change_height(){
				//取得框架元素
				var iframe=document.getElementById("content");
				//取得框架内容的高度
				var i_height=iframe.contentWindow.document.documentElement.scrollHeight;
				//改变
				$("#content").attr("height",i_height+"px");
			}		
		</script>
		--%>
	</head>

<body>
	<!--m-top start-->
	<jsp:include  page="page/head.jsp"/>
	<!--end m-top-->
	<%--
	
	<div id="iframe">
		<iframe width="100%"name="content" 
		id="content" src="about:blank" onload="change_height()"
		border="0" scrolling="no"
		frameborder="0" style="display:none;"></iframe>
	</div>
	
	--%>
	<div id="mc">
		
		<!--m-banner start-->
		<div class="m-banner">
			<div class="b_focus">
				<ul class="b-img">
					<li>
						<a href="#"><img src="<%=path %>/images/banner/1.jpg"/></a>
						<div class="i-desc1">
							<h2>BigBang强势回归</h2>
							<p style="font-size:22px;">2015年6月，时隔三年后的BigBang携带新作《made》。强势回归。</p>
						</div>
					</li>
					<li>
						<a href="#"><img src="<%=path %>/images/banner/2.jpg"/></a>
						<div class="i-desc2">
							<h2>邓紫棋全国巡演</h2>
							<p style="font-size:22px;">G.E.M</p>
							<p style="font-size:36px;">X.X.X.</p>
							<p style="font-size:22px;">LIVE</p>
						</div>
					</li>
					<li>
						<a href="#"><img src="<%=path %>/images/banner/3.jpg"/></a>
					</li>
				</ul>
				<div class="b-bottom">
					<div class="point">
						<ul>
							<li class="no"></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
				<div class="b-left">
					<span>&lt;</span>
				</div>
				<div class="b-right">
					<span>&gt;</span>
				</div>
			</div>
		</div>
		<!--end m-banner-->

		<!--m-content start-->
		<div class="m-content">
			
			<!--c-music start-->
			<div class="c-music">
				<div class="c-music-top">
					<div class="left">
						流行音乐
					</div>
					<div class="right">
						<a style="border-left:0;" href="#">内地</a>
						<a href="#">台湾</a>
						<a href="#">日韩</a>
						<a href="#">欧美</a>
						<span>&gt;&gt;</span>
					</div>
				</div>
				<div class="c-music-bottom">
					<div class="b-left">
						<img src="<%=path %>/images/music/left.jpg" width="465" height="274"/>
						<div class="title">
							<h2>bigbang《made》回归</h2>
							<p><a href="#">bigbang</a><span>&amp;</span><a href="#">made</a></p>
							<p>在2012年发布《ALIVE》专辑并获得空前的成功后，BIGBANG时隔3年发表新专辑——《MADE》。命名《MADE》的原因一方面是因为此次专辑倾注相当多的心血、精力，花费很长时间精心完成的作品。另一方面，‘“made”这个词也有完成一件了不起的事情的含义，BIGBANG成员及YG Entertainment内部都对此次的新专辑非常有信心，所以取名《MADE》</p>
						</div>
					</div>
					<div class="b-right">
						<ul>
							<li>
								<a href="#"><img src="<%=path %>/images/music/1.jpg" width="240px" height="124px"/></a>
								<div url="music/BigBang-if you.mp3" songname="if you" singer="BigBang" album="M" class="r-mask">
									<i></i><a href="javascript:void(0)" class="m-add" songid="1">+</a>
								</div>
							</li>
							<li style="float:right;">
								<a href="#"><img src="<%=path %>/images/music/2.jpg" width="240px" height="124px"/></a>
								<div url="music/BIGBANG-WE LIKE 2 PARTY.mp3" songname="WE LIKE 2 PARTY" singer="BIGBANG" album="D" class="r-mask">
									<i></i><a href="javascript:void(0)" class="m-add" songid="21">+</a>
								</div>
							</li>
							<li style="margin-top:20px;">
								<a href="#"><img src="<%=path %>/images/music/3.jpg" width="240px" height="124px"/></a>
								<div url="music/任贤齐-我是一只鱼.mp3" songname="我是一只鱼" singer="任贤齐" album="海洋" class="r-mask">
									<i></i><a href="javascript:void(0)" class="m-add" songid="5">+</a>
								</div>
							</li>
							<li style="float:right;margin-top:20px;">
								<a href="#"><img src="<%=path %>/images/music/4.jpg" width="240px" height="124px"/></a>
								<div url="music/bigbang-Let us not fall in love.mp3" songname="Let us not fall in love" singer="bigbang" album="D" class="r-mask">
									<i></i><a href="javascript:void(0)" class="m-add" songid="20">+</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--end c-music-->

			<!--c-mv start-->
			<div class="c-mv">
				<div class="c-mv-top">
					<div class="left">
						乐享MV
					</div>
					<div class="right">
						<a href="#">更多</a>
						<span>&gt;&gt;</span>
					</div>
				</div>
				<div class="c-mv-bottom">
					<div class="b-left">
						<img src="<%=path %>/images/mv/left.jpg" width="465" height="274"/>
						<div class="title">
							<h2>daddy （鸟叔(PSY)新曲）</h2>
							<p><a href="#">鸟叔PSY </a><span>&amp;</span><a href="#">dady</a></p>
							<p>众所周知，该曲经过长时间的编曲工作，最终推出了完成度极高的优质音乐。以富有强烈兼独特的电子音为主轴，属于快节奏的EDM歌曲。可以感受到愉快强烈的能量，突出PSY富有男子汉气概的具有其独特风格的歌词和RAP，令人印象深刻。</p>
						</div>
					</div>
					<div class="b-right">
						<ul>
							<li>
								<a href="#"><img src="<%=path %>/images/mv/1.jpg" width="240px" height="124px"/></a>
								<div class="r-mask"><i></i></div>
							</li>
							<li style="float:right;">
								<a href="#"><img src="<%=path %>/images/mv/2.jpg" width="240px" height="124px"/></a>
								<div class="r-mask"><i></i></div>
							</li>
							<li style="margin-top:20px;">
								<a href="#"><img src="<%=path %>/images/mv/3.jpg" width="240px" height="124px"/></a>
								<div class="r-mask"><i></i></div>
							</li>
							<li style="float:right;margin-top:20px;">
								<a href="#"><img src="<%=path %>/images/mv/4.jpg" width="240px" height="124px"/></a>
								<div class="r-mask"><i></i></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--end c-mv-->

			<!--c-news start-->
			<div class="c-news">
				<div class="c-news-top">
					<div class="left">
						资讯快递
					</div>
					<div class="right">
						<a style="border-left:0;" href="#">更多</a>
						<span>&gt;&gt;</span>
					</div>
				</div>
				<div class="c-news-bottom">
					<div class="b-left"><img src="<%=path %>/images/news/left.jpg"/></div>
					<div class="b-right">
						<ul>
							<li class="r-content">
								<a href=""><img src="<%=path %>/images/news/1.jpg" width="220" height="124"/></a>
								<ul>
									<li><a href="#">【柳演锡、金智媛】所属社就两人“恋爱2年”一事作出回应</a></li>
									<li><a href="#">【Teddy、KUSH】设立YG独立商标厂牌</a></li>
									<li><a href="#">【CNBLUE】与比利时艺术家合作，特别版专辑封面公开</a></li>
									<li><a href="#">【Super Junior 东海、银赫、晟敏】旧照公开，青葱少年</a></li>
									<li><a href="#">【少女时代 Sunny、SHINee KEY、EXO SUHO】将出演《Hidden Singer4</a></li>
								</ul>
							</li>
							<li class="r-content"><a href=""><img src="<%=path %>/images/news/2.jpg"/></a>
								<ul>
									<li><a href="#">【柳演锡、金智媛】所属社就两人“恋爱2年”一事作出回应</a></li>
									<li><a href="#">【Teddy、KUSH】设立YG独立商标厂牌</a></li>
									<li><a href="#">【CNBLUE】与比利时艺术家合作，特别版专辑封面公开</a></li>
									<li><a href="#">【Super Junior 东海、银赫、晟敏】旧照公开，青葱少年</a></li>
									<li><a href="#">【少女时代 Sunny、SHINee KEY、EXO SUHO】将出演《Hidden Singer4</a></li>
								</ul>
							</li>
							<li class="r-content" style="margin-right:0px;"><a href=""><img src="<%=path %>/images/news/3.jpg"/></a>
								<ul>
									<li><a href="#">【柳演锡、金智媛】所属社就两人“恋爱2年”一事作出回应</a></li>
									<li><a href="#">【Teddy、KUSH】设立YG独立商标厂牌</a></li>
									<li><a href="#">【CNBLUE】与比利时艺术家合作，特别版专辑封面公开</a></li>
									<li><a href="#">【Super Junior 东海、银赫、晟敏】旧照公开，青葱少年</a></li>
									<li><a href="#">【少女时代 Sunny、SHINee KEY、EXO SUHO】将出演《Hidden Singer4</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--end c-news-->

			<!--c-menu start-->
			<div class="c-menu">
				<div class="c-menu-top">
					<div class="left">
						精品乐单
					</div>
					<div class="right">
						<a style="border-left:0;" href="<%=path %>/QueryUsersendListServlet?pn=1">更多</a>
						<span>&gt;&gt;</span>
					</div>
				</div>
				<div class="c-menu-bottom" style="position:relative;">
					<ul>
						<li>
							<a href="<%=path %>/QueryUserSendServlet?id=1"><img src="<%=path %>/images/menu/1.jpg"/></a>
							<div class="user">
								<img src="<%=path %>/images/user/boy.jpg" width="40" height="40"/>
								<p class="username">sun</p>
							</div>
							<p>古风古韵的味道</p>
						</li>
						<li>
							<a href="<%=path %>/QueryUserSendServlet?id=8"><img src="<%=path %>/images/menu/2.jpg"/></a>
							<div class="user">
								<img src="<%=path %>/images/user/userpic/c22e6086015f4b0dbb08a66a0fbc0fd8点击查看源网页(13).jpeg" width="40" height="40"/>
								<p class="username">momolela</p>
							</div>
							<p>经典的华语金曲 (一)</p>
						</li>
						<li>
							<a href="<%=path %>/QueryUserSendServlet?id=23"><img src="<%=path %>/images/menu/20/901e544f67634caf8111c6995daca6f0QQ截图20140824154145.jpg" width="220" height="220"/></a>
							<div class="user">
								<img src="<%=path %>/images/user/userpic/8c514929a4714ed2b7bb5249cb9e7f10alien.jpg" width="40" height="40"/>
								<p class="username">jiangh</p>
							</div>
							<p>时尚韩流风</p>
						</li>
						<li>
							<a href="<%=path %>/QueryUserSendServlet?id=6"><img src="<%=path %>/images/menu/4.jpg"/></a>
							<div class="user">
								<img src="<%=path %>/images/user/boy.jpg" width="40" height="40"/>
								<p class="username">cai</p>
							</div>
							<p>做些有意思的事情吧?</p>
						</li>
						<li style="margin-right:0;">
							<a href="QueryUserSendServlet?id=4"><img src="<%=path %>/images/menu/3.jpg"/></a>
							<div class="user">
								<img src="<%=path %>/images/user/boy.jpg" width="40" height="40"/>
								<p class="username">liu</p>
							</div>
							<p>华语音乐势力</p>
						</li>
					</ul> 
				</div>
			</div>
			<!--end c-news-->
		</div>
		<!--end m-content-->

		<jsp:include page="page/bottom.jsp"/>

	</div>

	<!--ui-audioface start-->
	<div id="ui-audioface">
		<div class="ui-content">
			<img src="images/music_control/disk.png" class="ui-disk"/>
			<dl class="ui-info">
				<dt>请选择歌曲</dt>
				<dd></dd>
				<dd>未选择</dd>
			</dl>
			<ul class="ui-tools">
				<li>
					<a href="javascript:void(0)" class="ui-icon ui-list">0</a>
				</li>
				<li>
					<a href="javascript:void(0)" class="ui-score ui-show">谱</a>
				</li>
			</ul>
			<div class="ui-opface">
				<a href="javascript:void(0)" class="ui-icon ui-prev"></a>
				<a href="javascript:void(0)" class="ui-icon ui-play"></a>
				<a href="javascript:void(0)" class="ui-icon ui-next"></a>
				<a href="javascript:void(0)" class="ui-icon ui-model ui-cycle"></a>
				<div class="loop" style="position:absolute;top:-49px;left:131px;width:28px;height:80px;background:#000;display:none;">
					<i class="l_oneLoop" style=""></i>
					<i class="l_order" style=""></i>
					<i class="l_random" style=""></i>
					<i class="l_allLoop" style=""></i>
				</div>
				<a href="javascript:void(0)" class="ui-icon ui-volume-icon"></a>
				<span class="ui-icon ui-rate">
					<a href="javascript:void(0)" class="ui-icon"></a>
				</span>
			</div>
		</div>
		<div class="ui-list">
			<ul class="music-list" style="overflow:auto;">
			</ul>
		</div>
		<button class="ui-icon ui-becket-hide"></button>
		<div class="ui-score">
			<canvas id="canvas"></canvas>
		</div>
		<div class="ui-alert" style="width:20px;height:20px;position:absolute;top:-22px;right:0;">
			<i style="display:block;width:20px;height:20px;background:url('images/music_control/icons.png') -375px -89px;display:none;"></i>
		</div>
	</div>
	<!-- end ui-audioface-->
	
	<!-- right start -->
	<div id="right">
		<ul class="r-ul">
			<li class="qq">
				<a href="http://wpa.qq.com/msgrd?v=3&uin=1278413504&site=qq&menu=yes"><i></i></a>
			</li>
			<li class="weixin" onclick="return false">
				<a href="#"><i></i></a>
				<div class="w-hover">
					<div class="h-span"></div>
					<div class="h-erweima">
						<img src="images/weixin/weixin.jpg" width="120" height="120"/>
					</div>
				</div>
			</li>
			<li class="top" onclick="return false">
				<a href="#"><i></i></a>
			</li>
		</ul>
	</div>
	<!-- end right -->
	
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/audioface.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/dialog_login.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript">
	//点击登录显示登录页面
	$(".l_login").click(function(){
		$.dialog("login","index");
	});
	
	//点击注册显示登录页面
	$(".l_register").click(function(){
		$.dialog("register","index");
	});
	
	//验证码换图片的函数
	function changeCheckCode(){
		var src = "<%=path %>/CheckCodeServlet?haha="+Math.random();
		$(".checkcode").find("img").attr("src",src);
	}
	
	//点击我的音乐盒
	function login(){
		var nologin = "<%=request.getSession().getAttribute("nologin")%>";
		var url = "<%=path%>/page/musicbox.jsp";
		if(nologin=="true"){
			$.dialog("login","index");
		}else if(nologin=="false"){
			window.open(url);
		}
	};
	
	//点击主页上的添加到我的音乐
	$("#mc .m-content .c-music .c-music-bottom .b-right ul li .r-mask .m-add").click(function(e){
		if(e&&e.stopPropagation){e.stopPropagation();}else{window.event.cancelBubble = true;}
		var songid = $(this).attr("songid");
		var nologin = "<%=request.getSession().getAttribute("nologin")%>";
		var url = "<%=path%>/AddUserlikeServlet?songid="+songid;
		if(nologin=="true"){
			$.dialog("login","index");
		}else if(nologin=="false"){
			//ajax提交添加自己喜欢的歌曲
			var parameter = "songid="+songid;
			sendRequest(url,parameter,callback_addMusic);
		}
		//回调的方法
		function callback_addMusic()
		{
			if(xmlHttp.readyState==4)
			{
				if(xmlHttp.status==200)
				{
					eval(xmlHttp.responseText);
					if(result.flag)
					{
						alert("恭喜你，添加自己喜欢的歌曲成功");
					}
				}
			}
		}
	});
<%--	
	//框架内部刷新
	var iframeHref = window.frames['content'].location.href;

	$("#allmusic").click(function(){
		iframeHref=$(this).attr("href");
		hideIndex();
		parent.window.location.hash = "#type="+iframeHref.split(".")[0]+"."+iframeHref.split(".")[1];
	});
	
	$("#allmv").click(function(){
		iframeHref=$(this).attr("href");
		hideIndex();
		parent.window.location.hash = "#type="+iframeHref.split(".")[0]+"."+iframeHref.split(".")[1];
	});
	
	$("#allsend").click(function(){
		iframeHref=$(this).attr("href");
		hideIndex();
		parent.window.location.hash = "#type="+iframeHref;
	});
	
	$(function(){
		var type = parent.window.location.hash.split("=")[1];
		if(parent.window.location.hash==""){type="index";}
		if (type!='index'){
			if(!(type.indexOf(".")!=-1)){type=type+"=1";}
			document.getElementById('mc').style.display='none';
			document.getElementById('content').style.display='block';
			window.frames['content'].location.href = type;
		}
	});
	
	window.hideIndex = function(){
		document.getElementById('content').style.display='block';
		document.getElementById('mc').style.display='none';
	};

	window.showIndex = function (){
		document.getElementById('mc').style.display='block';
		document.getElementById('content').style.display='none';
		parent.window.location.hash = "#type=index";
	};
--%>
</script>
</body>

</html>