'use strict';

//파라미터값 가져오기
function scriptQuery() {
    var script = document.getElementsByTagName('script');   
    script = script[script.length-1].src  
       .replace(/^[^\?]+\?/, '')           
       .replace(/#.+$/, '')                      
       .split('&');                                   
     var queries = {}                             
       , query;
     while(script.length){                      
          query = script.shift().split('=');    
          queries[query[0]] = query[1];   
     }
     return queries;
}
var parametervalue = scriptQuery();
//남은시간 카운팅
var _second = 1000; // 1초
var _minute = _second * 60; // 1분
var _hour = _minute * 60; // 1시간
var _day = _hour * 24; // 1일
var timer;
let productvolist_size = parametervalue.productvolist_size;

function auctionCountDown() {
	for(var i=0;i<productvolist_size;i++){
	// 상품의 마감여부
	var complete = $('.date'+i).attr("data-complete");
	
	if (complete == 0) {
		// 현재시간을 얻어온다
		var now = new Date();
		// "auction_countdown" 클래스의 "data"속성의 값을 가져온다
		var endTime = new Date($('.date'+i).attr("data-endTime"));
		
		// 마감시간에서 현재시간을 차감해준다
		var subtractTime = endTime - now;
		// 남은시간이 들어갈 변수
		var resultTime = "";
		
		// 남은시간이 마이너스라면 실행
		if(subtractTime < 0) {
			$('.date'+i).html("종료되었습니다");
			clearInterval(timer);
			window.reload = "true";
			// 컴플리트를 0으로 바꾸는 함수 실행해야됨
			return;
		}
		
		// 소수점버림(남은시간 / 1일)
		// 예) 1일 1시간 1분 / 1일 = 1일 1시간 1분
		// 소수점을 버리기에 "1일"이 된다
		var days = Math.floor(subtractTime / _day);
		if (days > 0) {
			resultTime += days + "일 "
		}
		
		// 소수점버림(남은시간 % 1일 / 1시간)
		// 예) 1일 1시간 1분 % 1일 = 1시간 1분
		// 1시간 1분 / 1시간 = 1시간 1분 
		// 소수점을 버리기에 "1시간"이 된다
		var hours = Math.floor((subtractTime % _day) / _hour);
		if (hours > 0) {
			resultTime += hours + "시간 "
		}
		var minutes = Math.floor((subtractTime % _hour) / _minute);
		if (minutes > 0) {
			resultTime += minutes + "분 "
		}
		
		var seconds = Math.floor((subtractTime % _minute) / _second);
		if (seconds >= 0) {
			resultTime += seconds + "초"
		}
		
		// "auction_countdown" 클래스 안에 태그형식으로 삽입한다
		$('.date'+i).html(resultTime);
	}else{
		$('.date'+i).html("종료되었습니다");
	}
	}
}

function start() {
	// 1초마다 재실행하고 그것에 대한 정보를 timer에 담는다
	timer = setInterval(auctionCountDown, 1000);
}

$(document).ready(function(){
	start();
});
