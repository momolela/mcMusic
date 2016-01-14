<%@ page language="java" import="java.util.*" isErrorPage="true" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			*{margin:0;padding:0;}
			body{font-size:12px;font-family:"微软雅黑";color:#bbb;}

			.not-found{width:600px;margin:60px auto;}
			.not-found img{vertical-align:middle;}

			.not-found .baozi{border:2px solid #414141;position:absolute;border-radius:50px 50px 20px 20px;
			box-shadow:-1px 5px 20px #bbb;background:#fff;animation:bounceInDown 1s;cursor:pointer;z-index:999;}

			.not-found .meimao{width:12px;border:2px solid #414141;position:absolute;
			border-radius:10px 10px 10px 10px;background: #414141;}

			.not-found .eye{width:2px;height:2px;border:2px solid #414141;position:absolute;border-radius:24px;
			background: #414141;}

			.not-found .mouth{width:8px;height:0px;border:2px solid #414141;position:absolute;top:20px;right:17px;
			border-radius:12px;background: #414141;}

			.not-found .baozi_tohome{width:50px;height:30px;top:490px;right:520px;}
			.not-found .baozi_tohome .meimao_left{height:2px;top:6px;left:6px;}
			.not-found .baozi_tohome .meimao_right{height:2px;top:6px;right:6px;}
			.not-found .baozi_tohome .eye_left{top:11px;left:14px;}
			.not-found .baozi_tohome .eye_right{top:11px;right:6px;}

			.not-found .baozi_back{width:46px;height:26px;top:480px;right:590px;}
			.not-found .baozi_back .meimao_left{height:1px;top:6px;left:6px;}
			.not-found .baozi_back .meimao_right{height:1px;top:6px;right:6px;}
			.not-found .baozi_back .eye_left{top:10px;left:14px;}
			.not-found .baozi_back .eye_right{top:10px;right:6px;}

			@-webkit-keyframes bounceInDown{
				0%{opacity:0;-webkit-transform:translateY(-200px);}
				60%{opacity:1;-webkit-transform:translateY(30px);}
				80%{-webkit-transform:translateY(-10px);}
				100%{-webkit-transform:translateY(0);}
			}
			@-moz-keyframes bounceInDown{
				0%{opacity:0;-moz-transform:translateY(-200px);}
				60%{opacity:1;-moz-transform:translateY(30px);}
				80%{-moz-transform:translateY(-10px);}
				100%{-moz-transform:translateY(0);}
			}
			@-ms-keyframes bounceInDown{
				0%{opacity:0;-ms-transform:translateY(-200px);}
				60%{opacity:1;-ms-transform:translateY(30px);}
				80%{-ms-transform:translateY(-10px);}
				100%{-ms-transform:translateY(0);}
			}
			@-o-keyframes bounceInDown{
				0%{opacity:0;-o-transform:translateY(-200px);}
				60%{opacity:1;-o-transform:translateY(30px);}
				80%{-o-transform:translateY(-10px);}
				100%{-o-transform:translateY(0);}
			}
			@keyframes bounceInDown{
				0%{opacity:0;transform:translateY(-200px);}
				60%{opacity:1;transform:translateY(30px);}
				80%{transform:translateY(-10px);}
				100%{transform:translateY(0);}
			}
			.bounceInDown{
				-webkit-animation-name:bounceInDown;
				-moz-animation-name:bounceInDown;
				-ms-animation-name:bounceInDown;
				-o-animation-name:bounceInDown;
				animation-name:bounceInDown;
			}
		</style>
	</head>

<body>
	<div class="not-found">
		<img src="<%=path %>/images/404.jpg"/>
		<div class="baozi baozi_tohome" title="返回首页">
			<div class="meimao meimao_left"></div>
			<div class="eye eye_left"></div>
			<div class="meimao meimao_right"></div>
			<div class="eye eye_right"></div>
			<div class="mouth"></div>
		</div>

		<div class="baozi baozi_back" title="返回上一页">
			<div class="meimao meimao_left"></div>
			<div class="eye eye_left"></div>
			<div class="meimao meimao_right"></div>
			<div class="eye eye_right"></div>
			<div class="mouth"></div>
		</div>
	</div>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript">
	$(".baozi_tohome").click(function(){
		window.location.href = "index.jsp";
	});

	$(".baozi_back").click(function(){
		history.go(-1);
	});
</script>
</body>

</html>