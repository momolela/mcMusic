$.dialog_mp3info = function(){
	var animate = animateIn();
	// 创建一个插件模板
	var $dialog = $("<div class='mp3info "+animate+"'>"+
					"		<h2>歌曲信息完善</h2>"+
					"		<a class='close' href='#'>x</a>"+
					"		<div class='m_form'>"+
					"			<form action='#' method='POST'>"+
					"				<p class='first'>"+
					"					<input type='text' name='songname' placeholder='请输入歌曲名' required>"+
					"				</p>"+
					"				<p>"+
					"					<input type='text' name='singer' placeholder='请输入歌手名' required>"+
					"				</p>"+
					"				<p>"+
					"					<input type='text' name='album' placeholder='请输入专辑名' required>"+
					"				</p>"+
					"				<p>"+
					"					<input class='f_submit' type='submit' name='submit' value='提    交'>"+
					"				</p>"+
					"			</form>"+
					"		</div>"+
					"	</div>");
	// 追加模板
	$("body").append($dialog).append("<div class='mp3info_mask'></div>");// "<div class='register_mask'></div>"  阴影部分
	// 动态居中定位插件
	center($dialog);
	// 浏览器窗口改变的时候居中定位
	initEvent($dialog);
};

// 动态居中定位插件
function center($dialog){
	var width = $dialog.width();
	var height = $dialog.height();
	var ww = $(window).width();
	var wh = $(window).height();
	var _left = (ww - width) / 2;
	var _top = (wh - height) / 2;
	$dialog.css({top:_top,left:_left});
}

// 浏览器窗口改变的时候居中定位
function initEvent($dialog){
	$(window).resize(function(){
		center($dialog);
	});

	//点击注册跳到注册页面
	$dialog.find(".to_login").click(function(){
	});
	// 点击关闭
	$dialog.find(".close").click(function(){
		var animateout = animateOut();
		// 删除原有的动画，添加淡出的动画效果
		$(".mp3info").removeClass("animated").addClass(animateout);
		// 关闭层
		$(".mp3info").fadeOut(500,function(){$(this).remove();});
		// 关闭阴影层
		setTimeout(function () { 
			$(".mp3info_mask").remove();
		}, 1000);
	});
}

// 触发加载dialog插件，动画
function animateIn(){
	return "animated fadeInUp";
}

// 动画消失
function animateOut(){
	return "animated fadeOutUp";
}