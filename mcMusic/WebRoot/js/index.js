//m-banner
$(function(){
		var index=0;
		play();
		$(".b_focus").hover(function(){clearInterval(Time);},function(){play();});
		$(".m-banner .b-bottom .point").find("li").hover(function(){
			$(this).addClass("no").siblings().removeClass("no");
			var _index=$(this).index();
			index=_index;
			$(".m-banner .b-img").find("li").eq(_index).fadeIn("400").siblings().hide();
		});

		$(".b-right").click(function(){
			index++;
			var length=$(".m-banner .b-img").find("li").length;
			if(index>=length)
			{index=0;}
			$(".m-banner .b-bottom .point").find("li").eq(index).addClass("no").siblings().removeClass("no");
			$(".m-banner .b-img").find("li").eq(index).fadeIn("400").siblings().hide();
		});

		$(".b-left").click(function(){
			index--;
			var length=$(".m-banner .b-img").find("li").length;
			if(index<0)
			{index=length-1;}
			$(".m-banner .b-bottom .point").find("li").eq(index).addClass("no").siblings().removeClass("no");
			$(".m-banner .b-img").find("li").eq(index).fadeIn("400").siblings().hide();
		});
		//定义自动轮转效果的函数
		function play(){
			Time=setInterval(function(){
				index++;
				var length=$(".m-banner .b-img").find("li").length;
				if(index>=length)
				{index=0;}
				//联动小按钮
				$(".m-banner .b-bottom .point").find("li").eq(index).addClass("no").siblings().removeClass("no");
				//联动图片
				$(".m-banner .b-img").find("li").eq(index).fadeIn("400").siblings().hide();
			},3000);
		}
	});

	
	//music
	var audioface=new AudioFace('canvas',15);
	
	audioface.onplay=function(duration)
	{
		$('#ui-audioface div.ui-content img.ui-disk').addClass('ui-playing');
		duration=parseInt(duration);
		$('#ui-audioface div.ui-content dl.ui-info dd:last').text(parseInt(duration/60)+':'+(parseInt(duration%60)));
		$('#ui-audioface div.ui-content div.ui-opface a.ui-play').removeClass('ui-pause');
	};
	
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
	function sendRequest(url,parameter,callback_audio)
	{
		createXMLHttpRequest();
		//当准备状态发生变化时调用callBack()
		xmlHttp.onreadystatechange=callback_audio;
		xmlHttp.open("POST",url, true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(parameter);
	}
	
	$(function(){
		
		/*// 清空缓存
		localStorage.removeItem("musiclist");
		localStorage.removeItem("musiccount");*/
		
		// 读取本地歌曲列表缓存信息
		var musiclist = localStorage.getItem("musiclist");
		if(musiclist){
			music = musiclist.replace("ui-currm","");
			$(".music-list").html(music);
		}
		
		// 读取本地歌曲数量缓存信息
		var musiccount = localStorage.getItem("musiccount");
		if(musiccount){
			$('#ui-audioface div.ui-content ul.ui-tools li a.ui-list').text(musiccount);
		}
		
		//点击主页的歌曲添加到控件
		$(".b-right .r-mask").click(function(){
			var songname = $(this).attr("songname");
			var singer = $(this).attr("singer");
			var album = $(this).attr("album");
			var url = $(this).attr("url");
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
		
		//初始化页面的展开关闭
		$('#ui-audioface').animate({left:-540},800,function(){$('#ui-audioface button.ui-becket-hide').removeClass('ui-becket');});
		
		//点击列表中的歌曲播放
		$(".music-list").on("click","a",function(){
			var $this=$(this).parent();
			var path=$this.attr('path');
			var name=$this.attr('name');
			var singer=$this.attr('singer');
			$this.addClass('ui-currm').siblings().removeClass('ui-currm');
			$('#ui-audioface div.ui-content dl.ui-info dt').text(name);
			$('#ui-audioface div.ui-content dl.ui-info dd:first').text(singer);
			$('#ui-audioface div.ui-content dl.ui-info dd:last').text('正在加载...');
			audioface.request(path);
			audioface.stop();
		});
		
		//点击音乐控件中的删除
		$(".music-list").on("click",".del",function(){
			$(this).parent().parent().remove();
			$('#ui-audioface div.ui-content ul.ui-tools li a.ui-list').text($('#ui-audioface div.ui-list ul li').size());
			localStorage.setItem("musiclist",$(".music-list").html());
			localStorage.setItem("musiccount",$('#ui-audioface div.ui-list ul li').size());
		});

		//点击谱实现弹出和消失
		var $score=$('#ui-audioface div.ui-score');
		$('#ui-audioface div.ui-content ul.ui-tools li a.ui-score').click(function(){
			if($(this).toggleClass('ui-score').hasClass('ui-score'))
			{
				$score.fadeOut(500);
			}
			else
			{
				$score.fadeIn(500);
			}
		});

		//点击歌曲数实现歌曲列表弹出和消失
		var $list=$('#ui-audioface div.ui-list');
		$('#ui-audioface div.ui-content ul.ui-tools li a.ui-list').click(function(){
			$list.fadeToggle(500);
		});

		//点击箭头实现界面消失和弹出
		var $face=$('#ui-audioface');
		$('#ui-audioface button.ui-becket-hide').click(function(){
			var $this=$(this);
			if($this.hasClass('ui-becket'))
			{
				$face.animate({left:-540},500,function(){$this.removeClass('ui-becket');});
			}
			else
			{
				$('#ui-audioface div.ui-list').hide();
				$face.animate({left:0},500,function(){$this.addClass('ui-becket');});
			}
		});

		//点击播放实现播放
		$('#ui-audioface div.ui-content div.ui-opface a.ui-play').click(function(){
			var status = audioface.status;
			if(status!=0)
			{
				if(status==1)
				{
					audioface.pause();
					$(this).addClass('ui-pause');
				}
				else if(status==2)
				{
					audioface.resume();
					$(this).removeClass('ui-pause');
				}
			}
			return false;
		});
		
		//点击实现下一曲
		$('#ui-audioface div.ui-content div.ui-opface a.ui-next').click(function(){
			var status = audioface.status;
			$('#ui-audioface div.ui-list ul li.ui-currm').next().children().eq(1).trigger("click");
			return false;
		});
		
		//点击实现上一曲
		$('#ui-audioface div.ui-content div.ui-opface a.ui-prev').click(function(){
			var status = audioface.status;
			$('#ui-audioface div.ui-list ul li.ui-currm').prev().children().eq(1).trigger("click");
			return false;
		});

		//点击音量图标，变为静音
		$("#ui-audioface div.ui-content div.ui-opface a.ui-volume-icon").click(function(){
			if($(this).hasClass("ui-novolume-icon")){
				$(this).removeClass("ui-novolume-icon");$(this).addClass("ui-volume-icon");
				audioface.changeVolume(parseInt(($("#ui-audioface div.ui-content div.ui-opface span.ui-rate a").css("left").split("p")[0]))/71);
			}else{
				$(this).removeClass("ui-volume-icon");
				$(this).addClass("ui-novolume-icon");
				audioface.changeVolume(0/71);
			}
		});
		//音量滑块
		$("#ui-audioface div.ui-content div.ui-opface span.ui-rate a").mousedown(starDrag = function(ev) {
			ev.preventDefault();
			var origLeft = $(this).position().left;      /*滑块初始位置 0 */
			var origX = ev.clientX;				/*鼠标初始位置 451 */
			var target = this;
			var progress_bar = $("#ui-audioface div.ui-content div.ui-opface span.ui-rate")[0];
			$(document).mousemove(doDrag = function(ev){
				ev.preventDefault();
				var moveX = ev.clientX - origX;        /*计算鼠标移动的距离*/
				var curLeft = origLeft + moveX;			/*用鼠标移动的距离表示滑块的移动距离 0-71 */
				(curLeft < 0) && (curLeft = 0);
				(curLeft > 71) && (curLeft = 71);
				target.style.left = curLeft + "px";
				audioface.changeVolume((curLeft)/71);
			});
			$(document).mouseup(stopDrag = function(){
				$(document).unbind("mousemove",doDrag);
				$(document).unbind("mouseup",stopDrag);
			});
		});
		
		//点击切换模式
		$("#ui-audioface div.ui-content div.ui-opface a.ui-model").click(function(){
			$("#ui-audioface div.ui-content div.ui-opface .loop").show();
		});
		$("#ui-audioface div.ui-content div.ui-opface .loop .l_oneLoop").click(function(){
			$("#ui-audioface div.ui-content div.ui-opface a.ui-model").attr("class","ui-icon ui-model ui-oneloop");
			$("#ui-audioface div.ui-content div.ui-opface .loop").hide();
			//audioface.chnangemodel("oneLoop");
		});
		$("#ui-audioface div.ui-content div.ui-opface .loop .l_order").click(function(){
			$("#ui-audioface div.ui-content div.ui-opface a.ui-model").attr("class","ui-icon ui-model ui-order");
			$("#ui-audioface div.ui-content div.ui-opface .loop").hide();
			//audioface.chnangemodel("order");
		});
		$("#ui-audioface div.ui-content div.ui-opface .loop .l_random").click(function(){
			$("#ui-audioface div.ui-content div.ui-opface a.ui-model").attr("class","ui-icon ui-model ui-random");
			$("#ui-audioface div.ui-content div.ui-opface .loop").hide();
			//audioface.chnangemodel("random");
		});
		$("#ui-audioface div.ui-content div.ui-opface .loop .l_allLoop").click(function(){
			$("#ui-audioface div.ui-content div.ui-opface a.ui-model").attr("class","ui-icon ui-model ui-cycle");
			$("#ui-audioface div.ui-content div.ui-opface .loop").hide();
			//audioface.chnangemodel("allLoop");
		});
		
	});
	
	/*歌曲播放时间的格式化，将秒数格式化为“分:秒”的形式*/
	function formatTime(time) {
		var minutes = parseInt(time/60);
		var seconds = parseInt(time%60);
		seconds<10 && (seconds = "0" + seconds);
		return minutes + ":" + seconds;
	};
	

	//right
	$(function(){
		// 按钮淡入淡出
		$(window).scroll(function(){
			if($(window).scrollTop() >= 200){
				$("#right").addClass("height");
				$("#right ul .top").fadeIn(500);
			} else {
				$("#right").removeClass("height");
				$("#right ul .top").stop(true,true).fadeOut(500);
			}
		});
		
		// 回到顶部
		$("#right ul .top").click(function(){
			$("html,body").animate({
				scrollTop:0
			},1000);
		});
	});