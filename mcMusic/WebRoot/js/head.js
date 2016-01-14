//head.js
var staut1 = 1;//1代表没有，0代表有
var staut2 = 1;//1代表没有，0代表有

//点击展开喜欢的音乐列表
$(".u-name").click(function(e){
	if(e&&e.stopPropagation){e.stopPropagation();}else{window.event.cancelBubble = true;}
	if(staut1 == 1){
		$(this).parent().find("i").css("background-position","-194px -55px");
		$(".h-user .u-xiala").slideDown();
		staut1 = 0;
	}
	else if(staut1 == 0){
		$(this).parent().find("i").css("background-position","-194px -67px");
		$(".h-user .u-xiala").slideUp();
		staut1 = 1;
	}
});
/*//点击随意的地方都滚上去
$(":not(.u-name)").click(function(){
	$(".u-name").parent().find("i").css("background-position","-194px -67px");
	$(".h-user .u-xiala").slideUp();
	staut1 = 1;
});*/

/*$(".m-top .t-head .h-search input").focus(function(){
	$(".h-search .s_xiala").show();
	
});

$(".m-top .t-head .h-search input").blur(function(){
	$(".h-search .s_xiala").hide();
	
});*/

/*************/
//点击百度一下跳转
$(".m-top .t-head .h-search a").click(function(){
	var _texts = document.getElementsByTagName('input');
	var len = _texts.length;
	var _total = '';
	for(var i=0;i<len;i++){
		if(_texts[i].type == 'text'){
    		_total += _texts[i].value;
    	}
	}
	//alert(_total);
	if(_total=="")
	{
		$(".s_text").focus();
		return;
	}
	else
	{
		window.location.href="http://www.baidu.com/s?wd="+_total;
	}
});


