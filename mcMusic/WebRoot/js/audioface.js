//给所有的构造器函数的原型之上，添加一个继承功能
Function.prototype.extends = function(obj){
	for(var prop in obj){
		this.prototype[prop] = obj[prop];
	}
};
//构造器 参数：canvas:绘制曲谱的目标 meterNum:绘制曲谱的数目
function AudioFace(canvas,meterNum){
	this.canvas = document.getElementById(canvas);
	this.meterNum = meterNum||1;
	this.status = 0;//0:准备 1:播放中 2.暂停
	this._init();//初始化方法
}
AudioFace.prototype = {
	_init : function(){
		//音频上下文
		window.AudioContext = window.AudioContext || 
			window.webkitAudioContext || 
			window.mozAudioContext || 
			window.msAudioContext;
		//请求动画帧
		window.requestAnimationFrame = window.requestAnimationFrame ||
			window.webkitRequestAnimationFrame ||
			window.mozRequestAnimationFrame ||
			window.msRequestAnimationFrame;
		try {
			this.audioContext = new AudioContext();
		} catch (e) {
			console.log('妳的浏览器不支持');
		}	
	},
	//绘制曲谱的函数
	_drawSpectrum : function() {
		var _this = this;
		var canvas = this.canvas,
		cwidth = canvas.width,
		cheight = canvas.height + 68,
		meterWidth = 20, //频谱条宽度
		gap = 20, //频谱条间距
		capHeight = 2,
		capStyle = '#fff',
		meterNum = this.meterNum, //频谱条数量
		capYPositionArray = []; //将上一画面各帽头的位置保存到这个数组
		var ctx = canvas.getContext('2d'),
		gradient = ctx.createLinearGradient(0, 0, 0, 300);
		gradient.addColorStop(1, '#a2a2a2');
		gradient.addColorStop(0.5, '#e4e4e4');
		gradient.addColorStop(0, '#000');
		var drawMeter = function() {
			var array = new Uint8Array(_this.analyser.frequencyBinCount);
			_this.analyser.getByteFrequencyData(array);
			var step = Math.round(array.length / meterNum); //计算采样步长
			ctx.clearRect(0, 0, cwidth, cheight);
			for (var i = 0; i < meterNum; i++) {
				var value = array[i * step]; //获取当前能量值
				if (capYPositionArray.length < Math.round(meterNum)) {
					capYPositionArray.push(value); //初始化保存帽头位置的数组，将第一个画面的数据压入其中
				};
				ctx.fillStyle = capStyle;
				//开始绘制帽头
				if (value < capYPositionArray[i]) { //如果当前值小于之前值
					ctx.fillRect(i * gap, cheight - (--capYPositionArray[i]), meterWidth, capHeight); //则使用前一次保存的值来绘制帽头
				} else {
					ctx.fillRect(i * gap, cheight - value , meterWidth, capHeight); //否则使用当前值直接绘制
					capYPositionArray[i] = value;
				};
				//开始绘制频谱条
				ctx.fillStyle = gradient;
				ctx.fillRect(i * gap, cheight - value + capHeight, meterWidth, cheight);
			}
			requestAnimationFrame(drawMeter);
		};
		requestAnimationFrame(drawMeter);
	}
};
/*****************var model = "allLoop";
var Ismodel = "true";*/
AudioFace.extends({
	request : function(path){//通过ajax异步请求读取path对应的音乐文件
		var _this = this;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', path, true);
		xhr.responseType = 'arraybuffer';
		xhr.onload = function(e) {
			_this.load(this.response);
		};
		xhr.send();
	},
	load : function(fileResult){//通过load加载，把ajax得到的arrayBuffer数据解码成音频数据
		var _this = this;
		this.audioContext.decodeAudioData(fileResult, function(buffer) { //解码成功则调用此函数，参数buffer为解码后得到的结果
		  _this.prepred(buffer);//把音频数据传入，内存中准备
		  _this.play(); //调用play进行下一步处理，此方法在后面定义并实现
	  }, function(e) { //这个是解码失败会调用的函数
		  console.log("文件解码失败:(");
	  });
	},
	//准备
	prepred : function(buffer){
		this.buffer = buffer;//保存音频数据
		this.startOffset = 0;//计算开始时间
		this.status = 0;//准备完毕的状态
		this.stop();
	},
	//播放
	play : function(){
		this.status = 1;//把状态改成正在播放
		this.startTime = this.audioContext.currentTime;//开始播放的当前时间
		this.startOffset = this.startOffset||0;
		this.audioBufferSouceNode = this.audioContext.createBufferSource();
		//将上一步解码得到的buffer数据赋值给source
		this.audioBufferSouceNode.buffer = this.buffer;
		this.audioBufferSouceNode.loop = false;
		this.analyser = this.audioContext.createAnalyser();
		//将source与分析器连接
		this.audioBufferSouceNode.connect(this.analyser);
		//将分析器与destination连接，这样才能形成到达扬声器的通路
		//this.analyser.connect(this.audioContext.destination);
		//音乐响起后，把analyser传递到另一个方法开始绘制频谱图了，因为绘图需要的信息要从analyser里面获取
		this._drawSpectrum(this.analyser);
		// 创建一个gain node
		this.gainNode = this.audioContext.createGain();
		//将实例与gain node相连
		this.audioBufferSouceNode.connect(this.gainNode);
		//将gain node与播放设备连接
		this.gainNode.connect(this.audioContext.destination);
		//一旦设定完成之后，你就可以通过改变值之后来控制音量了。
		//减少音量
		//播放  this.buffer.duration 整个音频数据播放的秒数
		this.audioBufferSouceNode.start(0,this.startOffset % this.buffer.duration);
		this.onplay&&this.onplay(this.buffer.duration);
		//alert(this.startOffset.toString().split(".")[0]);
		//alert(this.startTime);
		//alert(this.buffer.duration.toString().split(".")[0]);
/*		this.audioBufferSouceNode.addEventListener("timeupdate",function(){
			//alert(this.startTime);
			//播放结束
			if(this.audioBufferSouceNode.stop()){
				//顺序播放
				alert(1);
				//$('#ui-audioface div.ui-list ul li.ui-currm').next().children().eq(1).trigger("click");
			}
		});*/
		/*****************if(Ismodel == "true"||model == "allLoop"){
			//歌曲结束后切换模式
			this.audioBufferSouceNode.onended = function(){
				//alert(model);
				if(model == "order"){
					//顺序模式
					$('#ui-audioface div.ui-list ul li.ui-currm').next().children().eq(1).trigger("click");
				}else if(model == "oneLoop"){
					//单曲循环
					$('#ui-audioface div.ui-list ul li.ui-currm').children().eq(1).trigger("click");
				}else if(model == "allLoop"){
					//整体循环
					if($('#ui-audioface div.ui-list ul li.ui-currm').index()===($('#ui-audioface div.ui-list ul li').length-1)){
						$('#ui-audioface div.ui-list ul li').eq(0).children().eq(1).trigger("click");
					}else{
						$('#ui-audioface div.ui-list ul li.ui-currm').next().children().eq(1).trigger("click");
					}
				}else if(model == "random"){
					//随机播放
					var i = new Array();
					var length = $('#ui-audioface div.ui-list ul li').length;
					for(var j = 0;j<length;j++){
						i[j] = j;
					}
					var k = i[Math.floor((Math.random()*i.length))];
					if(k == $('#ui-audioface div.ui-list ul li.ui-currm').index()){
						k = i[Math.floor((Math.random()*i.length))];
					}
					$('#ui-audioface div.ui-list ul li').eq(k).children().eq(1).trigger("click");
				}
			}
		}*/
		
	},
	//暂停
	pause : function(){
	  this.stop();
	  this.status = 2;
		// 已经播放了多长时间
	  this.startOffset += this.audioContext.currentTime - this.startTime;
	  this.onpause&&this.onpause();
	},
	//停止
	stop : function(){
		this.status = 0;
		//this.startOffset += this.audioContext.currentTime - this.startTime;
		/*****************Ismodel = "false"*/
		if(this.audioBufferSouceNode){
			this.audioBufferSouceNode.stop();
		}
	},
	//恢复播放
	resume : function(){
		this.play();
	},
	//改变音量
	changeVolume : function(volume){
		var volume1 = volume;
		this.gainNode.gain.value = volume1;
	}
	/*****************歌曲模式
	chnangemodel : function(flag){
		if(flag == "order"){
			model = "order";
			Ismodel == "true"
		}else if(flag == "oneLoop"){
			model = "oneLoop";
			Ismodel == "true"
		}else if(flag == "allLoop"){
			model = "allLoop";
			Ismodel == "true"
		}else if(flag == "random"){
			model = "random";
			Ismodel == "true"
		}
	}*/
});