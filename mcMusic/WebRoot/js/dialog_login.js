$.dialog = function(opts,page){
	var animate = animateIn();
	var checkcodeservlet = "";
	Page = page;
	if(page!="index"){
		checkcodeservlet = "../CheckCodeServlet";
		loginservlet = "../LoginServlet";
		registerservlet = "../RegisterServlet";
		checknameservlet = "../CheckNameServlet";
	}else{
		checkcodeservlet = "CheckCodeServlet";
		loginservlet = "LoginServlet";
		registerservlet = "RegisterServlet";
		checknameservlet = "CheckNameServlet";
	}
	var dialog_login = "<div class='login "+animate+"'>"+
						"<h2>登录|<a class='to_register' href='#'>注册 </a></h2>"+
						"<a class='close' href='javascript:void(0)'>x</a>"+
						"<div id='error_msg' style='width:70px;height:40px;position:absolute;width:280px;height:24px;position:absolute;top:72px;left:74px;font-size:15px;color:red;'></div>"+
						"<div class='l_form'>"+
								"<p>"+
									"<input id='username' type='text' name='username' placeholder='请输入用户名' required>"+
								"</p>"+
								"<p>"+
									"<input id='password' type='password' name='password' placeholder='请输入密码' required>"+
								"</p>"+
								"<p class='checkcode'>"+
									"<img title='点击更换验证码' onclick='changeCheckCode()' src='"+checkcodeservlet+"'/>"+
									"<input id='checkcode' type='text' name='checkcode' placeholder='请输入验证码' required>"+
								"</p>"+
								"<p>"+
									"<input class='f_login' type='button' name='button' value='登     录'>"+
								"</p>"+
						"</div>"+
						"<div class='bottom'>注：注册登录后，即您同意用户使用条款</div>"+
					"</div>";
						
	var dialog_register = "<div class='register "+animate+"'>"+
							"<h2><a class='to_login' href='#'>登录 </a>| 注册</h2>"+
							"<a class='close' href='#'>x</a>"+
							"<div id='error_msg' style='width:70px;height:40px;position:absolute;width:280px;height:24px;position:absolute;top:66px;left:74px;font-size:15px;color:red;'></div>"+
							"<div class='r_form'>"+
								"<input type='hidden' id='hdata' name='hdata' value='1'>"+
								"<p>"+
									"<input type='text' id='username' name='username' placeholder='请输入用户名' required>"+
								"</p>"+
								"<p>"+
									"<input type='password' class='password' id='password' name='password' placeholder='请输入密码' required>"+
								"</p>"+
								"<p>"+
									"<input type='password' class='againpassword' id='againpassword' name='againpassword' placeholder='请输入确认密码' required>"+
								"</p>"+
								"<p>"+
									"<input type='text' class='email' id='email' name='email' placeholder='请输入邮箱' required>"+
								"</p>"+
								"<p class='sex'>"+
									"<input class='boy' type='radio' name='radio' value='boy'>男生"+
									"<input class='girl' type='radio' name='radio' value='girl'>女生"+
								"</p>"+
								"<p>"+
									"<input class='f_register' type='submit' name='submit' value='注    册'>"+
								"</p>"+
							"</div>"+
							"<div class='bottom'>注：注册登录后，即您同意用户使用条款</div>"+
						"</div>";
							
	var dialog_alert = "<div class='alert "+animate+"'>"+
					"		<div class='a_title'>"+
					"			<h3 class='t_h3'>"+opts.title+"</h3>"+
					"			<a href='#' class='t_close'>X</a>"+
					"		</div>"+
					"		<div class='a_content'>"+
					"			<div class='c_message'>"+
					"				<span class='m_con'>"+opts.content+"</span>"+
					"			</div>"+
					"			<div class='c_btn'>"+
					"				<input type='button' id='sure' value='确定' />"+
					"				<input type='button' id='cancle' value='取消' />"+
					"			</div>"+
					"		</div>"+
					"	</div>";
	if(opts=="login"){
		var dialog = dialog_login;
		var mask = "<div class='login_mask'></div>";
	}else if(opts=="register"){
		var dialog = dialog_register;
		var mask = "<div class='register_mask'></div>";
	}else if(page=="alert"){
		var dialog = dialog_alert;
		var mask = "<div class='alert_mask'></div>";
	}
	// 创建一个插件模板
	var $dialog = $(dialog);
	// 追加模板
	$("body").append($dialog).append(mask);// "<div class='login_mask'></div>"  阴影部分
	// 动态居中定位插件
	center($dialog);
	// 浏览器窗口改变的时候居中定位
	initEvent($dialog,opts);
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


function initEvent($dialog,opts){
	//浏览器窗口改变的时候居中定位
	$(window).resize(function(){
		center($dialog);
	});
	
	//alert中的确定按钮
	$dialog.find("#sure").click(function(){
		var animateout = animateOut();
		$dialog.removeClass("animated").addClass(animateout);
		$dialog.next().remove();
		$dialog.fadeOut(500,function(){
			$(this).remove();
		});
		if(opts.callback){
			opts.callback(true);
		}
	});

	//alert中的取消按钮
	$dialog.find("#cancle").click(function(){
		var animateout = animateOut();
		$dialog.removeClass("animated").addClass(animateout);
		$dialog.next().remove();
		$dialog.fadeOut(500,function(){
			$(this).remove();
		});
		if(opts.callback){
			opts.callback(false);
		}			
	});
	
	// 点击alert中的关闭
	$dialog.find(".t_close").click(function(){
		var animateout = animateOut();
		// 删除原有的动画，添加淡出的动画效果
		$(".alert").removeClass("animated").addClass(animateout);
		// 关闭层
		$(".alert").fadeOut(500,function(){$(this).remove();});
		// 关闭阴影层
		setTimeout(function () {
			$(".alert_mask").remove();
		}, 1000);
	});

	// 点击登录中的关闭
	$dialog.find(".close").click(function(){
		var animateout = animateOut();
		// 删除原有的动画，添加淡出的动画效果
		$(".login").removeClass("animated").addClass(animateout);
		// 关闭层
		$(".login").fadeOut(500,function(){$(this).remove();});
		// 关闭阴影层
		setTimeout(function () {
			$(".login_mask").remove();
		}, 1000);
	});
	
	// 点击注册中的关闭
	$dialog.find(".close").click(function(){
		var animateout = animateOut();
		// 删除原有的动画，添加淡出的动画效果
		$(".register").removeClass("animated").addClass(animateout);
		// 关闭层
		$(".register").fadeOut(500,function(){$(this).remove();});
		// 关闭阴影层
		setTimeout(function () {
			$(".register_mask").remove();
		}, 1000);
	});
	
	// 点击登录中的跳转注册
	$dialog.find(".to_register").click(function(){
		var animateout = animateOut();
		// 删除原有的动画，添加淡出的动画效果
		$(".login").removeClass("animated").addClass(animateout);
		// 关闭层
		$(".login").fadeOut(500,function(){$(this).remove();});
		// 关闭阴影层
		setTimeout(function () {
			$(".login_mask").remove();
		}, 1000);
		//跳转注册
		$.dialog("register",Page);
	});
	
	// 点击注册中的跳转登录
	$dialog.find(".to_login").click(function(){
		var animateout = animateOut();
		// 删除原有的动画，添加淡出的动画效果
		$(".register").removeClass("animated").addClass(animateout);
		// 关闭层
		$(".register").fadeOut(500,function(){$(this).remove();});
		// 关闭阴影层
		setTimeout(function () {
			$(".register_mask").remove();
		}, 1000);
		//跳转登录
		$.dialog("login",Page);
	});
	
	//提交登录事件
	$dialog.find(".f_login").click(function(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var checkcode = document.getElementById("checkcode").value;
		var parameter = "username="+username+"&password="+password+"&checkcode="+checkcode;
		sendRequest(loginservlet,parameter,callback);
	});
	
	//提交注册事件
	$dialog.find(".f_register").click(function(){
		var hdata = document.getElementById("hdata").value;
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var againpassword = document.getElementById("againpassword").value;
		var email = document.getElementById("email").value;
		var temp = document.getElementsByName("radio");
		var sex = "";
		if(temp[0].checked){
			sex = "boy";
		}else if(temp[1].checked){
			sex = "girl";
		}
		var parameter = "hdata="+hdata+"&username="+username+"&password="+password+"&againpassword="+againpassword+"&email="+email+"&sex="+sex;
		sendRequest(registerservlet,parameter,callback);
	});
	
	//当点击密码框的时候验证用户名是否重复
	$dialog.find(".password,.againpassword,.email").focus(function(){
		//alert("ok");
		var username = document.getElementById("username").value;
		var parameter = "username="+username;
		sendRequest(checknameservlet,parameter,callback);
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