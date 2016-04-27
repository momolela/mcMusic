(function($){
	jQuery.fn.extend({
		"initAudio" : function(){
			var myAudio = $("audio",this)[0];
			var $sourceList = $("source",this);
			var currentSrcIndex = 0;
			var currentSr = "";
			var currentTime;
			var totalTime;
			var nowIndex = 0;
			var singer = new Array();
			var album = new Array();
			var songname = new Array();
			
			/*为播放列表添加歌曲信息*/
			for (var i = 0; i < $sourceList.length; i++) {
				album[i] = $sourceList[i].title.split("_")[1].replace(".mp3","");
				$(".music_list").append("<li>" + $sourceList[i].title.replace("_"+album[i],"") + "</li>");
				songname[i] = $sourceList[i].title.split("-")[1].replace("_"+album[i]+".mp3","");
				singer[i] = $sourceList[i].title.split("-")[0];
			};
			
			//调控音量方法
			HTMLAudioElement.prototype.changeVolumeTo = function(volume){
				this.volume = volume;
				$(".r_control .c_volum .v_progress .slide").css("left",volume*100 + "px");
			};
			
			/*为播放器添加事件监听*/
			/*播放、暂停、下一首功能实现*/
			$(".c_play").click(function(){
				if (myAudio.paused) {
					myAudio.play();
					$("#m_lrc").scrollTop(0);
					//动态加载歌词
					loadLrc(singer[nowIndex]+"-"+songname[nowIndex]);
					//联动音乐播放歌词
					myAudio.addEventListener("timeupdate",function(){
						// 获取当前播放的时间
						currentTime = this.currentTime;
						//播放结束
						if(formatTime(currentTime) === totalTime){
							myAudio.pause();
							$(".c_next").click();
						}
						// 解析音乐对应的时间
						/*var m = parseInt(timer / 60);
						console.log("timer ==========="+timer);*/
						var s = parseInt(currentTime);
						for(var i = 0; i < s; i++){
							$("#"+i).addClass("now").siblings().removeClass("now");
							if($(".now").index()>5){
								$("#m_lrc").scrollTop(24*($(".now").index()-5));
							}
						}
					});
					
					/*document.getElementById("r_singer").innerHTML = singer[0];
					document.getElementById("r_songname").innerHTML = songname[0];*/
					$(this).find("i").css("background-position","-125px -11px");
				} else {
					myAudio.pause();
					$(this).find("i").css("background-position","-99px -11px");
				}
				//alert(1);
			});
			//下一首
			$(".c_next").click(function(){
				++currentSrcIndex > $sourceList.length - 1 && (currentSrcIndex = 0);
				currentSrc = $("#myAudio source").eq(currentSrcIndex).prop("src");
				myAudio.src = currentSrc;
				myAudio.play();
				nowIndex = currentSrcIndex;
				$("#m_lrc").scrollTop(0);
				document.getElementById("r_singer").innerHTML = singer[currentSrcIndex];
				document.getElementById("r_songname").innerHTML = songname[currentSrcIndex];
				document.getElementById("r_album").innerHTML = "&lt;"+album[currentSrcIndex]+"&gt;";
				$(".c_play").find("i").css("background-position","-125px -11px");
				loadLrc(singer[currentSrcIndex]+"-"+songname[currentSrcIndex]);
				//联动音乐播放歌词
				myAudio.addEventListener("timeupdate",function(){
					// 获取当前播放的时间
					currentTime = this.currentTime;
					//播放结束
					if(formatTime(currentTime) === totalTime){
						myAudio.pause();
						$(".c_next").click();
					}
					// 解析音乐对应的时间
					/*var m = parseInt(timer / 60);
					console.log("timer ==========="+timer);*/
					var s = parseInt(currentTime);
					for(var i = 0; i < s; i++){
						$("#"+i).addClass("now").siblings().removeClass("now");
						if($(".now").index()>5){
							$("#m_lrc").scrollTop(24*($(".now").index()-5));
						}
					}
				});
			});
			
			//音量滑块控制音量
			$(".r_control .c_volum .v_progress .slide").mousedown(starDrag = function(ev) {
				ev.preventDefault();
				var origLeft = $(this).position().left;      /*滑块初始位置*/
				var origX = ev.clientX;						/*鼠标初始位置*/
				var target = this;
				var progress_bar = $(".volume_control .progress_bar")[0];
				$(document).mousemove(doDrag = function(ev){
					ev.preventDefault();
					var moveX = ev.clientX - origX;        /*计算鼠标移动的距离*/
					var curLeft = origLeft + moveX;			/*用鼠标移动的距离表示滑块的移动距离*/
					(curLeft < 0) && (curLeft = 0);
					(curLeft > 100) && (curLeft = 100);
					target.style.left = curLeft + "px";
					myAudio.changeVolumeTo((curLeft)/100);
				});
				$(document).mouseup(stopDrag = function(){
					$(document).unbind("mousemove",doDrag);
					$(document).unbind("mouseup",stopDrag);
					$(".r_control .c_volum .v_volum").css("background-position","-85px -13px");
					if(target.style.left == "0px"){
						$(".r_control .c_volum .v_volum").css("background-position","-155px -13px");
					}
				});
			});
			
			//点击音量键静音
			$(".r_control .c_volum .v_volum").click(function(){
				$(this).siblings().find("span").css("left","0px");
				$(this).css("background-position","-155px -13px");
				myAudio.changeVolumeTo(0);
			});
			
			//点击歌曲列表播放歌曲
			$(".music_list").click(function(ev){
				var index = $(ev.target).index();
				currentSrcIndex = index;
				currentSrc = $("#myAudio source:eq(" + currentSrcIndex + ")").prop("src");
				myAudio.src = currentSrc;
				myAudio.play();
				nowIndex = index
				$("#m_lrc").scrollTop(0);
				document.getElementById("r_singer").innerHTML = singer[index];
				document.getElementById("r_songname").innerHTML = songname[index];
				document.getElementById("r_album").innerHTML = "&lt;"+album[index]+"&gt;";
				$(".c_play").find("i").css("background-position","-125px -11px");
				loadLrc(singer[index]+"-"+songname[index]);
				//联动音乐播放歌词
				myAudio.addEventListener("timeupdate",function(){
					// 获取当前播放的时间
					currentTime = this.currentTime;
					//播放结束
					if(formatTime(currentTime) === totalTime){
						myAudio.pause();
						$(".c_next").click();
					}
					// 解析音乐对应的时间
					/*var m = parseInt(timer / 60);
					console.log("timer ==========="+timer);*/
					var s = parseInt(currentTime);
					for(var i = 0; i < s; i++){
						$("#"+i).addClass("now").siblings().removeClass("now");
						if($(".now").index()>5){
							$("#m_lrc").scrollTop(24*($(".now").index()-5));
						}
					}
				});
			});
			
			/*audio元素事件绑定*/
			$(myAudio).bind("loadedmetadata",function(){
				totalTime = formatTime(myAudio.duration);
				var title = $("#myAudio source:eq(" + currentSrcIndex + ")").attr("title");
				$(".time_line .total_time").text(totalTime);
				$(".meta_data .title").text(title);
			});
			$(myAudio).bind("timeupdate",function(){
				var duration = this.duration;
				var curTime = this.currentTime;
				var percentage = curTime/duration * 100;
				$(".r_progress .p_bar").css("width",percentage + "%");

				var passedTime = formatTime(curTime);
				$(".time_line .passed_time").text(passedTime);						
			});
			$(myAudio).bind("play",function(){
				$(".btn_play").text("h");
				$(".music_list li").eq(currentSrcIndex).addClass("active onplay")
				.siblings().removeClass("active onplay");
				$(".music_info .cd").addClass("rotate");
				$(".cd_holder .stick").addClass("play");
			});
			$(myAudio).bind("pause",function(){
				$(".btn_play").text("c");
				$(".music_info .cd").removeClass("rotate");
				$(".cd_holder .stick").removeClass("play");
			});
			$(myAudio).bind("ended",function(){
				$(".btn_next").triggerHandler("click");
			});
			$(myAudio).bind("progress",function(){
				if (myAudio.buffered.length == 1) {
				  // only one range
				  if (myAudio.buffered.start(0) == 0) {
				    // The one range starts at the beginning and ends at
				    // the end of the video, so the whole thing is loaded
				    var buffered = myAudio.buffered.end(0);
				    var percentage = buffered/myAudio.duration * 100;
				    $(".r_progress .p_bar").css("background-size",percentage + "% 100%");
				  }
				}
				
			});
			$(myAudio).trigger("loadedmetadata");
			/*歌曲播放时间的格式化，将秒数格式化为“分:秒”的形式*/
			function formatTime(time) {
				var minutes = parseInt(time/60);
				var seconds = parseInt(time%60);
				seconds<10 && (seconds = "0" + seconds);
				return minutes + ":" + seconds;
			};
		}
	});
})(jQuery)
