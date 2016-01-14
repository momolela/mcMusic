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
		<title>follow音乐盒</title>
		<link type="text/css" rel="stylesheet" href="<%=path %>/css/index.css"></link>
		<link rel="shortcut icon" href="<%=path %>/images/fw.ico" />
		<style type="text/css">
			*{padding:0;margin:0;}
			a{text-decoration:none;}
			li{list-style:none;}
			.music_box{width:100%;height:600px;}
			.music_box .box_bg{background:#e1e8e5;width:100%;height:300px;position:absolute;top:200px;z-index: -2;}
			.music_box .box_face{position:absolute;left:50%;width:1000px;height:600px;z-index:100;margin-left:-500px;}
			.music_box .box_face .left{float:left;width:300px;height:450px;}
			.music_box .box_face .left img{margin:60px 0 0 46px;}
			.music_box .box_face .left .l_nav{width:300px;height:280px;margin-top:14px;}
			.music_box .box_face .left .l_nav ul li{width:182px;margin-top:6px;padding-right:38px;margin-left:44px;}
			.music_box .box_face .left .l_nav ul li a{display:block;width:182px;height:38px;color:#000;font-size:14px;text-align:center;line-height:38px;background:#9dd6c5;padding-right:38px;}
			.music_box .box_face .left .l_nav ul li a:hover{background:rgba(150,171,165,0.5);}
			.music_box .box_face .left .l_nav ul li span{position:absolute;top:12px;right:16px;display:inline-block;width:11px;height:11px;background:url('<%=path%>/images/music_box/music.gif');visibility:visible;}
			.music_box .box_face .left .l_nav ul li .second_nav{display:none;width:220px;height:176px;background:rgba(197,220,191,.8);}
			.music_box .box_face .left .l_nav ul li .second_nav .music_list li{width:190px;height:25px;margin:0 0 0 10px;padding:0px;line-height:25px;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;cursor:pointer;color:#11F;}
			.music_box .box_face .left .l_nav ul li .second_nav .music_list li.onplay{color:#000;}
			.music_box .box_face .left .l_nav ul li .second_nav .music_list li:hover{background:#bbb;color:#000;}
			.music_box .box_face .right{float:right;width:690px;height:520px;}
			.music_box .box_face .right .r_box{width:640px;height:460px;float:right;margin-top:60px;}
			.music_box .box_face .right .r_box .b_top{width:100%;height:310px;background:#fff;box-shadow:0 0 20px rgba(0,0,0,0.2);}
			.music_box .box_face .right .r_box .b_top .t_left{float:left;width:280px;height:310px;}
			.music_box .box_face .right .r_box .b_top .t_left .l_mask{position:absolute;width:250px;height:280px;background:rgba(0,0,0,.3);border-radius:4px;box-shadow:0px 0px 10px #fff;padding:15px;display:none;}
			.music_box .box_face .right .r_box .b_top .t_left .l_mask:hover .m_close{display:block;}
			.music_box .box_face .right .r_box .b_top .t_left .l_mask .m_close{display:block;width:20px;height:20px;border:1px solid #bbb;color:#fff;font-size:16px;text-align:center;line-height:16px;font-family:'楷体';position:absolute;top:10px;right:10px;display:none;}
			.music_box .box_face .right .r_box .b_top .t_left .l_mask #m_lrc ul li{width:100%;height:20px;line-height:20px;text-align:center;font-size:14px;color:#bbb;padding:2px;text-overflow: ellipsis;overflow:hidden;white-space:nowrap;}
			.music_box .box_face .right .r_box .b_top .t_left .l_mask #m_lrc ul .now{font-size:18px;color:#fff;text-overflow: ellipsis;overflow:hidden;white-space:nowrap;}
			.music_box .box_face .right .r_box .b_top .t_right{float:right;width:320px;height:270px;padding:20px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_singer{padding-left:10px;line-height:70px;font-size:22px;color:#000;width:290px;height:60px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_album{margin-left:10px;color:#000;}
			.music_box .box_face .right .r_box .b_top .t_right .r_songname{margin-left:10px;color:#000;width:320px;height:60px;font-size:14px;line-height:70px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_progress{margin-left:10px;background:#bbb;width:300px;height:2px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_progress .p_bar{background:#000;height:100%;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control{margin-left:10px;width:300px;height:128px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_volum{width:140px;height:20px;float:right;margin-right:10px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_volum .v_volum{margin-left:28px;width:12px;height:12px;display:inline-block;background:url("<%=path%>/images/music_box/music_box.png");background-position:-85px -13px;vertical-align:middle;cursor:pointer;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_volum .v_progress{width:100px;height:2px;background:#bbb;float:right;margin-top:9px;position:relative;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_volum .v_progress .slide{cursor:pointer;width:6px;height:6px;background:#808080;border-radius:24px;position:absolute;top:-2px;left:100px;display:inline-block;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_play{margin-top:76px;float:left;width:40px;height:40px;margin-left:30px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_play i{width:22px;height:23px;background:url("<%=path%>/images/music_box/music_box.png");background-position:-99px -11px;display:inline-block;vertical-align:middle;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_play i:hover{background-position:-99px -36px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_del{margin-top:70px;float:left;width:40px;height:40px;margin-left:30px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_del i{width:22px;height:31px;background:url("<%=path%>/images/music_box/music_box.png");background-position:-10px -78px;display:inline-block;vertical-align:middle;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_del i:hover{background-position:-11px -42px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_next{margin-top:58px;float:left;width:40px;height:40px;margin-left:30px;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_next i{width:33px;height:18px;background:url("<%=path%>/images/music_box/music_box.png");background-position:-45px -12px;display:inline-block;vertical-align:middle;}
			.music_box .box_face .right .r_box .b_top .t_right .r_control .c_next i:hover{background-position:-45px -38px;}
			.music_box .box_face .right .r_box .b_mid{width:100%;height:76px;}
			.music_box .box_face .right .r_box .b_mid span{font-size:12px;text-align:center;line-height:30px;float:right;display:block;height:30px;margin-top:20px;color:#999;cursor:pointer;}
			.music_box .box_face .right .r_box .b_mid span i{display:inline-block;width:16px;margin-right:6px;vertical-align:sub;}
			.music_box .box_face .right .r_box .b_mid .lrc{width:70px;}
			.music_box .box_face .right .r_box .b_mid .lrc i{height:16px;background:url('<%=path %>/images/icon2.png') -265px -87px;}
			.music_box .box_face .right .r_box .b_mid .share{width:100px;}
			.music_box .box_face .right .r_box .b_mid .share i{height:18px;background:url('<%=path %>/images/icon2.png') -209px -113px;}
			.music_box .box_face .right .r_box .b_mid .comment{width:100px;}
			.music_box .box_face .right .r_box .b_mid .comment i{height:18px;background:url('<%=path %>/images/icon2.png') -84px -214px;}
			.music_box .box_face .right .r_box .b_bottom a{float:right;margin:20px 10px 0 0;display:inline-block;width:140px;height:36px;background:RGB(0,195,90);border-radius:3px;text-align:center;line-height:36px;color:#fff;}
			.music_box .font{width:360px;height:40px;position:absolute;left:160px;top:560px;}
		</style>
	</head>
<body>
<jsp:include  page="head.jsp"/>
	<div class="music_box">
		<!-- myAudio start -->
		<div id="myAudio">
			<audio>
				<c:forEach items="${songarray }" var="item" varStatus="idx">
					<source title="${item.singer }-${item.songname }_${item.album }.mp3" src="<%=path %>/${item.url }" />
				</c:forEach>
			</audio>
		</div>
		<!-- end myAudio -->
		
		<div class="box_bg"></div>
		
		<div class="box_face">
			<!-- left start -->
			<div class="left">
				<div class="l_logo" style="width:100%;height:150px;"><img src="<%=path %>/images/music_box/music_box_logo.png"/></div>
				<div class="l_nav">
					<ul>
						<li style="position:relative;">
							<a class="n_love" href="javascript:void(0)">我最喜欢的歌曲<span class="music_icon"></span></a>
							<div class="second_nav"  style="overflow:auto;padding-top:6px;padding-bottom:6px;">
								<ul class="music_list"></ul>
							</div>
						</li>
						<li>
							<a class="n_upload" style="background:rgba(198,211,205,0.5);" href="<%=path%>/page/UserMusic.jsp" target="_blank">上传喜欢的歌曲</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- left start -->
			
			<!-- right start -->
			<div class="right">
				<div class="r_box">
					<div class="b_top">
						<div class="t_left" style="position:relative;">
							<div id="l_mask" class="l_mask">
								<a class="m_close" href="javascript:void(0)">x</a>
								<div id="m_lrc" style="width:100%;height:280px;overflow:hidden;">
									<ul id="l_lrc" class="l_lrc" style="width:230px;padding:10px;">
										
									</ul>
								</div>
							</div>
							<img src="<%=path %>/images/menu/4.jpg" alt="album's pic" width="280px" height="310px"/>
						</div>
						<div class="t_right">
							<c:if test="${songarray[0]==null }">
								<p class="r_singer" id="r_singer">Follow 音乐</p>
								<span class="r_album" id="r_album">&lt;music&gt;</span>
								<p class="r_songname" id="r_songname">极致体验</p>
							</c:if>
							<c:if test="${songarray[0]!=null }">
								<p class="r_singer" id="r_singer">${songarray[0].singer }</p>
								<span class="r_album" id="r_album">&lt;${songarray[0].album }&gt;</span>
								<p class="r_songname" id="r_songname">${songarray[0].songname }</p>
							</c:if>
							<div class="r_progress">
								<div class="p_bar"></div>
							</div>
							<div class="r_control">
								<div class="c_volum">
									<i class="v_volum"></i>
									<div class="v_progress">
										<span class="slide"></span>
									</div>
								</div>
								<div style="cursor:pointer;" class="c_play"><i></i></div>
								<div style="cursor:pointer;" class="c_del"><i></i></div>
								<div style="cursor:pointer;" class="c_next"><i></i></div>
							</div>
						</div>
					</div>
					<div class="b_mid">
						<span class="lrc"><i></i>看歌词</span>
						<span class="comment"><i></i>评论歌曲</span>
						<span class="share"><i></i>分享这首歌</span>
					</div>
					<div class="b_bottom">
						<a href="<%=path %>/QueryAllmusicServlet?pn=1" target="_blank">去添加喜欢的歌曲</a>
					</div>
				</div>
			</div>
			<!-- end right -->
		</div>
		
		<div class="font"><img src="<%=path %>/images/music_box/font.png" width="300px" height="30px"/></div>
	</div>
<jsp:include page="bottom.jsp"/>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/musicbox.js"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>
<script type="text/javascript">
	$(function(){
		//音乐盒的初始化
		$("#myAudio").initAudio();
	});
	
	var staut1 = 1;//1代表没有，0代表有
	var staut2 = 1;//1代表没有，0代表有
	
	//点击展开喜欢的音乐列表
	$(".l_nav ul li .n_love").click(function(){
		if(staut1 == 1){
			$(this).siblings().slideDown();
			staut1 = 0;
		}
		else if(staut1 == 0){
			$(this).siblings().slideUp();
			staut1 = 1;
		}
	});
	
	//
	$(".n_upload").hover(function(){
		$(this).css("background","rgba(150,171,165,0.5)");
	},function(){
		$(this).css("background","rgba(198,211,205,0.5)");
	});
	
	/**
	 * 异步请求的方法
	 */
	//上传音乐文件和音乐信息
	function UploadMusic() {

	    var fileObj = document.getElementById("file").files[0]; // 获取文件对象
	    var FileController = "../UploadMusicServlet";                   // 接收上传文件的后台地址 
	
	    // FormData 对象、
	    var form = new FormData();
	    form.append("file", fileObj);                       // 文件对象
	    
	    $.ajax({
		  url: FileController,
		  type: "POST",
		  data: form,
		  processData: false,  // 告诉jQuery不要去处理发送的数据
		  contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
		  success:function(){
		  	ajaxsonginfo();
		  }
		});
 	}
 	
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
	
	//回调的方法
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
				if(result.checknameflag){
					document.getElementById("error_msg").innerHTML=result.message;
				}
			}
		}
	}
	
	//提交登录事件
	function ajaxsonginfo(){
		var n_songname = document.getElementById("n_songname").value;
		var n_singer = document.getElementById("n_singer").value;
		var n_album = document.getElementById("n_album").value;
		var parameter = "n_songname="+n_songname+"&n_singer="+n_singer+"&n_album="+n_album;
		sendRequest("../UploadMusicInfoServlet",parameter,callback);
	}
	
	//从服务器动态加载歌词
	function loadLrc(name){
		$.ajax({
			type:"post",
			url:"../utilPage/lrc.jsp",
			data:{"name":name},
			success:function(data){
				var lrc = data;
				// 把时间和歌词分离出来
				if(lrc.trim() === "null"){
					$("#l_lrc").html("<li style='color:#fff;'>暂时没有歌词哦</li>");
				}else{
					var lrcArr = lrc.split("[");
					var htmlLrc = "";
					for(var i = 0; i < lrcArr.length; i++){
						// 第二次分割“]”
						var arr = lrcArr[i].split("]");
						//console.log("=============="+arr);
						// 取到时间
						var timer = arr[0].split(".");
						// 取到歌词
						var message = arr[1];
						// console.log("时间："+timer+"  歌词："+message);
						// 取到分钟和秒
						var stime = timer[0].split(":");
						// console.log("-------"+stime); // 00,18
						// 转换成秒数 00:18
						var ms = stime[0]*60 + stime[1]*1;
						if(message){
							htmlLrc += "<li id='"+ms+"'>"+message+"</li>";
						}
					}
					// 把解析好的歌词放入div中
					$("#l_lrc").html(htmlLrc);
				}
			}
		});
	}
	
	//点击关闭歌词
	$(".m_close").click(function(){
		$(this).parent().hide();
	});
	
	//点击打开歌词
	$(".music_box .box_face .right .r_box .b_mid .lrc").click(function(){
		$(".music_box .box_face .right .r_box .b_top .t_left .l_mask").show();
	});
</script>
</body>