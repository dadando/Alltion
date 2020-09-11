'use strict';
var check = false;

// ↓↓ 이미지 슬라이드. ↓↓ by.홍섭
// 이미지 수를 1~5개로 제한하여 사용
var slideIndex = 1;
showSlides(slideIndex);
// > 버튼 클릭시 오른쪽위치 이미지로 넘어감.
function plusSlides(n) {
    showSlides(slideIndex += n);
}
// < 버튼 클릭시 왼쪽위치 이미지로 넘어감.
function currentSlide(n) {
    showSlides(slideIndex = n);
}
// 이미지의 번호를 받아와서 슬라이드 기능을 실행한다.
// dot이미지를 사용하여 dot클릭시 순서에 맞는 이미지를 출력한다.
function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");

    if (n > slides.length) {
        slideIndex = 1
    }
    if (n < 1) {
        slideIndex = slides.length
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
// 불러온 이미지와 dot에 클래스 이름을 더해준다.
// dot이미지에는 "active" ,이미지 슬라이드에는 "magSlides" => 돋보기 기능에서 사용
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
        slides[i].className = slides[i].className.replace(" magSlides", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}

// ↑↑이미지 슬라이드.↑↑

// ↓↓돋보기 버튼↓↓ by.홍섭
// 버튼클릭시 mySlides클래스 태그에 " magSlides" 클래스명을 추가한 뒤 돋보기 함수 실행
// 해당 클래스이름(magSlides)을 추가하고 그 클래스이름이 있는 이미지의 배열 번호를 넘겨준다.
$(document).on('click','.mag_btn',function(event){
    var slides = document.getElementsByClassName("mySlides");
    slides[slideIndex - 1].className += " magSlides";
    mag(slideIndex);  //돋보기 함수 실행
});
// 돋보기 기능을 종료하는 버튼 (이벤트 취소기능을 사용함)
$(document).on('click','.mag_close',function(event){
    $('.magSlides').off();
});

// ↓↓이미지 돋보기기능.↓↓ by.홍섭
function mag(i) {
    var target = $('.target' + i);
    var zoom = target.data('zoom');
// 마우스 움직임에 따라 돋보기가 따라간다.
// 확대되는 너비와 높이는 지정한 픽셀의 크기로 설정하였다.
    $(".magSlides")
        .on('mousemove', magnify)
        .prepend("<div class='magnifier'></div>")
        .children('.magnifier').css({
            "background": "url('" + target.attr("src") + "') no-repeat",
            "background-size": target.width() * zoom + "px " + target.height() * zoom + "px"
        });

    var magnifier = $('.magnifier');

    function magnify(e) {
// 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표(X,Y)를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;
// 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
            magnifier.fadeIn(100);
        } else {
            magnifier.fadeOut(100);
        }
// 돋보기가 존재할 때
        if (magnifier.is(":visible")) {
// 마우스 좌표 확대될 이미지 좌표를 일치시킨다.
            var rx = -(mouseX * zoom - magnifier.width() / 2);
            var ry = -(mouseY * zoom - magnifier.height() / 2);
// 돋보기를 마우스 위치에 따라 움직인다.
// 돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
            var px = mouseX - magnifier.width() / 2;
            var py = mouseY - magnifier.height() / 2;
// css적용
            magnifier.css({
                left: px,
                top: py,
                backgroundPosition: rx + "px " + ry + "px"
            });
        }
    }
};
// ↑↑이미지 돋보기기능↑↑

// ↓↓메뉴 클릭시 해당위치로 이동↓↓
function move(n) {
    if (n == 1) {
        var offset = $(".bid_list").offset();
    } else if (n == 2) {
        var offset = $(".product_information").offset();
    } else if (n == 3) {
        var offset = $(".exchange_rule").offset();
    } else if (n == 4) {
        var offset = $(".comment_div").offset();
    }
    $('html, body').animate({
        scrollTop: offset.top - 200}, 400);
}

// ↓↓모달 : 판매자 정보확인 버튼, 응찰 유의사항 버튼 ↓↓
function modal_display(n) {
    // ↓↓판매자 정보확인
    if (n == 1) {
        var seller_info_modal = document.getElementById('seller_info_modal');
        var close0 = document.getElementsByClassName('close')[0];
        seller_info_modal.style.display = "block";
        close0.onclick = function(event) {
            seller_info_modal.style.display = "none";
        }

    // ↓↓응찰유의사항
    } else if (n == 2) { 
        var bid_notify_modal = document.getElementById('bid_notify_modal');
        var close1 = document.getElementsByClassName('close')[1];
        bid_notify_modal.style.display = "block";
        close1.onclick = function(event) {
            bid_notify_modal.style.display = "none";
        }
    // ↓↓판매자 구매후기
    }else if(n==3){
    	var seller_review_modal = document.getElementById('seller_review_modal');
    	var close2 = document.getElementsByClassName('close')[2];
    	seller_review_modal.style.display = "block";
    	close2.onclick = function(){
    		seller_review_modal.style.display = "none";
    	}
    	
    }

    // ↓↓모달창 외부 클릭시 모달창 닫아짐.
    window.onclick = function(event) {
        if (event.target == seller_info_modal) {
            seller_info_modal.style.display = "none";
        }
        if (event.target == bid_notify_modal) {
            bid_notify_modal.style.display = "none";
        }
        if(event.target == seller_review_modal){
        	seller_review_modal.style.display = "none";
        }
    }
}

// ↓↓페이지시작할때 실행되는 함수들
$(document).ready(function(){
	bidList(1); //페이지 로딩시 응찰 목록 출력 
	commentList(1); //페이지 로딩시 댓글 목록 출력
	classcolor(); //페이지로딩시 등급제 색깔주기
	start(); //카운팅 세팅
	reviewList(1);
});

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
//경매 번호
let bno = parametervalue.bno;
//경매 즉시 구매가
let limit_price = parametervalue.limit_price;
//로그인한 아이디(세션아이디)
let sessionid = parametervalue.sessionid;

//중복 클릭 방지용 변수
var click = true;

// ↓↓응찰하기 버튼 클릭시
function bidList(bid_nowpage){
	$.ajax({
		url : '/alltion/bid_list.hs',
		type : 'post',
		data : {'bno':bno,'page':bid_nowpage},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data){
			var a = '';
			$.each(data,function(key,value){
				a += '<div class="bidder1">';
				a += '<div class="bid_list_no">'+value.bid_no+'</div>';
				a += '<div class="bid_price">'+value.bid_price+'</div>';
				a += '<div class="bidder_id">'+value.bid_id.substring(0,3)+'****</div>';
				a += '<div class="bid_time">'+value.bid_date+'</div>';
				a += '</div>';
				if(key==0){
					$("#now_price").html(value.bid_price+ ' 원');
					$("#top_bidder_id").html(value.bid_id.substring(0,3)+'****');
					$(".bid_list_count").html('응찰 현황 ('+value.bid_no+')');
				}
			});
			$(".bidder").html(a);
		},
		error:function(){
			alert("ajax통신 실패(list)!!!");		
		}
	});
}
// ajax 기법을 활용하여 입찰 기능 구현 by.홍섭
// 입찰하기 버튼 클릭시 실행
// 해당 경매의 고유번호와 입찰에 참여한 회원의 아이디 정보를 받아 서버로 넘긴다.
// 버튼의 중복실행을 방지하기위해 클릭과 다음 클릭사이에 시간 딜레이를 추가하였다.
$("#bid_btn").off("click").on('click',function(){
	if(click){
		click = !click;
		$.ajax({
			url: '/alltion/bid_insert.hs',
			type : 'POST',
			data : {'bid_product_number':bno,'bid_id':sessionid},
			success : function(data){
				if(data==1){
					alert('성공적으로 응찰되었습니다.');
					bidList(1); //페이지 로딩시 응찰 목록 갱신
				}else if(data==2){
					alert('성공적으로 응찰되었습니다.');
					bidList(1);
					$(".btns").html('<font style="color: red;">마감 종료된 경매입니다.</font><br>');
					$('.auction_countdown').html("종료되었습니다");
					clearInterval(timer);
				}
			},
			error:function(){
				alert("ajax통신 실패(insert)");
			}
		});
//타이밍 추가 (중복 클릭방지)
  		setTimeout(function(){
  			click=true;
  		},2000);
	}else{
		console.log("중복됨");
	}
});

$("#bid_btn2").off("click").on('click',function(){
	if(click){	
		click = !click;
			$.ajax({
			url: '/alltion/now_purchase.hs',
			type : 'POST',
			data : {'bid_product_number':bno,'bid_id':sessionid},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data){
				if(data==1){
					alert('성공적으로 응찰되었습니다.');
					bidList(1); //페이지 로딩시 응찰 목록 갱신
					$(".btns").html('<font style="color: red;">마감 종료된 경매입니다.</font><br>');
					$('.auction_countdown').html("종료되었습니다");
					clearInterval(timer);
				}
			},
			error:function(){
				alert("ajax통신 실패(nowpurchase)");
			}
		});
			//타이밍 추가
  		setTimeout(function(){
  			click=true;
  		},2000);
	}else{
		console.log("중복됨");
	}
});

//경매등록자 아이디
let writerId = parametervalue.writerId; 
let List_size = 0;
function commentList(comment_nowpage){
	
	$.ajax({
		url : '/alltion/commentlist.hs',
		type : 'post',
		data : {'comment_product_number':bno,'page':comment_nowpage},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data){
			var a = '';
			var i = 0;
			$.each(data,function(key,value){
				a += '<div class="comment_list1';
				if(value.comment_lev==="1"){
					a += ' reply';
				}
				a += '">';
				if(value.comment_lev==="1"){
					a += '<span class="replyre">┕ </span>';
				}
				a += '<span class="comment_id"> 작성자 |&nbsp;'+value.comment_id.substring(0,3)+'****</span>';
				a += '<span class="comment_date">'+value.comment_date.substring(0,16)+'</span>';
			
				if(value.comment_is_deleted==="1"){
					a += '<div class="comment_content">삭제된 글 입니다.</div>';
				}else if(value.comment_secret==="1"){
					if(sessionid===value.comment_id||sessionid===writerId){
						a += '<div class="comment_content">'+value.comment_content+'</div>';
						
					}else{
						a += '<div class="comment_content">비밀글 입니다.</div>';
					}
				}else{
					a += '<div class="comment_content">'+value.comment_content+'</div>';
				}
				
				// ↓↓ 삭제글이 아닐때만 아래 버튼들이 생긴다.
				if(value.comment_is_deleted==="0"){
					if(sessionid===value.comment_id){
						a += '<div class="commentbtn">';
						a += '<a onclick="commentUpdateForm('+i+')">수정</a>';
						a += '<a onclick="commentDelete('+value.comment_number+')">삭제</a>';
						a += '</div>';
					}else if(sessionid===writerId){
						a += '<div class="commentbtn">';
						a += '<a onclick = "commentReplyForm('+i+')">답글</a>';
						a += '<a onclick = "commentReport('+value.comment_number+')" style="color: red;">신고하기</a>';
						a += '</div>';
					}else if(value.comment_secret==="0"){
						a += '<div class="commentbtn">';
						a += '<a onclick = "commentReplyForm('+i+')">답글</a>';
						a += '<a onclick = "commentReport('+value.comment_number+')" style="color: red;">신고하기</a>';
						a += '</div>';
					}
				}
			
				//댓글의 답변
				a += '<div class = "comment_reply" style = "display:none;">';
				a += '<textarea class="comment_content_reply" placeholder="  *댓글을 달아주세요."></textarea><br>';
				a += '<a onclick="commentReply('+value.comment_number+')">확인</a>&nbsp;<a onclick="commentReplyForm(-1)">취소</a>';
				a += '</div>';
				
				a += '</div>';
			
				//댓글의 수정
				a += '<div class="comment_update" style="display:none;">';
				a += '<textarea class="comment_content_update" placeholder="  *수정할 내용을 입력해 주세요."></textarea><br>';					            
			    a += '<a onclick="commentUpdate('+value.comment_number+')">확인</a><a onclick="commentList(1)">취소</a>';
				a += '</div>';
			    i++;
			    
			});
			$(".comment_list").html(a);
			List_size = i;
			$(".comment_list_count").html('댓 글 ('+List_size+')');
		},
		error:function(){
			alert("ajax통신 실패(comment_list)!!!");		
		}
	});
}

// ↓↓ 댓글 달기.
let comment_content_input = document.getElementById('comment_content_input');
let comment_secret = document.getElementById('secret');
let comment_secret_value="";

$("#comment_btn").off("click").on('click',function(){
	if(click){	
		click = !click;
		if(comment_secret.checked==true){
			comment_secret_value = "1";
		}else{
			comment_secret_value = "0";
		}
		if(comment_content_input.value==""){
			alert('내용을 입력해 주세요.');
			return false;
		}
		$.ajax({
			url: '/alltion/commentinsert.hs',
			type : 'POST',
			data : {'comment_product_number':bno,'comment_id':sessionid,'comment_content':comment_content_input.value,'comment_secret':comment_secret_value},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data){
				if(data==1){
					comment_content_input.value='';
					commentList(1); //페이지 로딩시 응찰 목록 갱신
					
				}
			},
			error:function(){
				alert("ajax통신 실패(commentinsert)");
			}
		});
		//타이밍 추가
  		setTimeout(function(){
  			click=true;
  		},2000);
	}else{
		console.log("중복됨");
	}
});

// ↓↓댓글 수정
let number_for_update = 0;

function commentUpdateForm(n){
	number_for_update = n;
	
	for(var i=0;i<List_size;i++){
		let comment_update = document.getElementsByClassName('comment_update')[i];
		let comment_list1 = document.getElementsByClassName('comment_list1')[i];
		
		if(i==n){
			comment_update.style.display = "block";
			comment_list1.style.display = "none";
			continue;
		}
		
		comment_update.style.display = "none";
		comment_list1.style.display = "block";
	}
}

function commentUpdate(n){
	let comment_content_update = document.getElementsByClassName('comment_content_update')[number_for_update];
	if(comment_content_update.value==""){
		alert('내용을 입력해 주세요.');
		return false;
	}
	
	$.ajax({
		url: '/alltion/commentupdate.hs',
		type : 'POST',
		data : {'comment_content':comment_content_update.value,'comment_number':n},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data){
			if(data==1){
				commentList(1); //페이지 로딩시 응찰 목록 갱신
				
			}
		},
		error:function(){
			alert("ajax통신 실패(commentUpdate)");
		}
	});
}

// ↓↓댓글 삭제
function commentDelete(n){
	
	$.ajax({
		url: '/alltion/commentdelete.hs',
		type : 'POST',
		data : {'comment_product_number':bno,'comment_id':sessionid,'comment_number':n},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data){
			if(data==1){
				commentList(1); //페이지 로딩시 응찰 목록 갱신
				
			}
		},
		error:function(){
			alert("ajax통신 실패(commentDelete)");
		}
	});
}

// ↓↓ 댓글 답변달기
let number_for_reply = 0;

function commentReplyForm(n){
	number_for_reply = n;
	
	for(var i=0;i<List_size;i++){
		let comment_reply = document.getElementsByClassName('comment_reply')[i];
		if(i==n){
			comment_reply.style.display = "block";
			
		}else{
			comment_reply.style.display = "none";
		}
	}
}

function commentReply(n){
	let comment_content_reply = document.getElementsByClassName('comment_content_reply')[number_for_reply];
	if(comment_content_reply.value==""){
		alert('내용을 입력해 주세요.');
		return false;
	}
	$.ajax({
		
		url: '/alltion/commentreply.hs',
		type : 'POST',
		data : {'comment_content':comment_content_reply.value,'comment_original_number':n,'comment_id':sessionid,'comment_product_number':bno},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data){
			if(data==1){
				
				commentList(1); //페이지 로딩시 응찰 목록 갱신
				
			}
		},
		error:function(){
			alert("ajax통신 실패(commentReply)");
		}
	});
}

// 등급에 따라 색깔다르게 하기.
function classcolor(){
	let sale_credit = '<%=sale_credit%>';
	if(sale_credit === "다이아몬드"){
		$('#sale_credit').css("color"," #ffd149");
	}else if(sale_credit === "플레티넘"){
		$('#sale_credit').css("color","cornflowerblue");
	}else if(sale_credit === "골드"){
		$('#sale_credit').css("color","gold");
	}else if(sale_credit === "실버"){
		$('#sale_credit').css("color","silver");
	}else if(sale_credit === "브론즈"){
		$('#sale_credit').css("color","#A47c6D");
	}else{
		$('#sale_credit').css("color","black");
	}
}

//로그인이 안된상태에서 댓글 textarea를 클릭시
function togologin(){
	var togologin = confirm("로그인 하시겠습니까?");
	if(togologin==true){
		location.href = "./loginForm.kj";
	}else{
		return false;
	}
}

//로그인이 안된상태에서 응찰하기/즉시구매하기/찜목록 버튼 클릭시 실행
$(".no_login").off("click").on('click',function(){
	if(click){
		click = !click;
		no_login();
		//타이밍 추가
		setTimeout(function(){
			click=true;
		},1000);
	}else{
		console.log("중복됨");
	}
});

function no_login(){
	var no_login = confirm("로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
	if(no_login==true){
		location.href = "./loginForm1.kj?product_number="+bno;
	}else{
		return false;
	}
}


// 남은시간 카운팅 by.홍섭
var _second = 1000; // 1초
var _minute = _second * 60; // 1분
var _hour = _minute * 60; // 1시간
var _day = _hour * 24; // 1일
var timer; // 타이머 변수
function auctionConutDown() {
// 상품의 마감여부 체크
	var complete = $('.auction_countdown').attr("data-complete");
// 0이면 진행중인 경매, 1이면 종료된 경매
	if (complete == 0) {
// 현재 시간을 얻어온다
		var now = new Date();
// "auction_countdown" 클래스의 "data"속성의 값을 가져온다.(마감시간 값을 가져온다)
		var endTime = new Date($('.auction_countdown').attr("data-endTime"));
// 마감시간에서 현재시간을 차감해준다
		var subtractTime = endTime - now;
// 남은시간이 들어갈 변수
		var resultTime = "";
// 남은시간이 마이너스라면 실행 (=시간이 종료되었음을 의미)
		if(subtractTime < 0) {
			$('.auction_countdown').html("종료되었습니다");
			clearInterval(timer);
			window.reload = "true";
// 컴플리트를 '1'로 바꾸는 함수 실행해야됨
			return;
		}
		
// 소수점버림(남은시간 / 1일)
// 예) 1일 1시간 1분 / 1일 = 1일
// 소수점을 버리기에 "1일"이 된다
		var days = Math.floor(subtractTime / _day);
		if (days > 0) {
			resultTime += days + "일 "
		}
// 소수점버림(남은시간 % 1일 / 1시간)
// 예) 1일 1시간 1분 % 1일 = 1시간
// 소수점을 버리기에 "1시간"이 된다
		var hours = Math.floor((subtractTime % _day) / _hour);
		if (hours > 0) {
			resultTime += hours + "시간 "
		}
// '분' 소수점 버림
		var minutes = Math.floor((subtractTime % _hour) / _minute);
		if (minutes > 0) {
			resultTime += minutes + "분 "
		}
// '초' 소수점 버림		
		var seconds = Math.floor((subtractTime % _minute) / _second);
		if (seconds >= 0) {
			resultTime += seconds + "초"
		}
// "auction_countdown" 클래스 안에 태그형식으로 삽입한다
		$('.auction_countdown').html(resultTime);
	}else{
		$('.auction_countdown').html("종료되었습니다");
	}
}
//1초마다 재실행하고 그것에 대한 정보를 timer에 담는다
function start() {
	timer = setInterval(auctionConutDown, 1000);
}

/*
//남은시간이 종료되었을 때 product_progress 를 1로 바꿔준다.
function update_product_progress(){
	$.ajax({
		url: '/alltion/update_product_progress.hs',
		type : 'POST',
		data : {'product_number':bno},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data){
			if(data==1){
				
				alert("ajax통신 성공(update_product_progress)");
				window.reload="true";
			}
		},
		error:function(){
			alert("ajax통신 실패(update_product_progress)");
		}
	});
}
*/
function reviewList(review_nowpage){
	$.ajax({
		url : '/alltion/review_list.hs',
		type : 'post',
		data : {'review_id':writerId,'page':review_nowpage},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data){
			var a = '';
			$.each(data,function(key,value){
				a += '<tr class="review_list1">';
				a += '<td class="review_no">'+value.review_no+'</td>';
				a += '<td class="review_evaluate">'+value.review_evaluate+'</td>';
				a += '<td class="review_image"><img src="'+value.review_image+'"></td>';
				a += '<td class="review_subject">'+value.review_subject+'</td>';
				a += '<td class="review_content">'+value.review_content+'</td>';
				a += '<td class="review_writer">'+value.review_id+'</td>';
				a += '<td class="review_date">'+value.review_date+'</td>';
				a += '</tr>';
				
					
			});
			$("#review_list_content").html(a);
		},
		error:function(){
			alert("ajax통신 실패(list)!!!");		
		}
	});
}

// 찜버튼 클릭시 wish리스트에 해당항목 추가
$("#bid_btn4").off("click").on('click',function(){
	if(click){
		click = !click;
		$.ajax({
			url : '/alltion/wish_list.hs',
			type : 'post',
			data : {'wish_product_number':bno,'wish_id':sessionid},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data){
				if(data==0){
					alert('찜목록에 추가 되었습니다.');
				}else{
					alert('이미 찜목록에 등록되어있는 경매 입니다.');
				}
				
				
			},
			error:function(){
				alert("ajax통신 실패(insertWishList)!!!");		
			}
		});
		//타이밍 추가
  		setTimeout(function(){
  			click=true;
  		},2000);
	}else{
		console.log("중복됨");
	}
});

function commentReport(n){
	var checkreport = confirm("해당 댓글을 신고하시겠습니까?");
	if(checkreport==true){
		if(click){
			click = !click;
			$.ajax({
				url : '/alltion/commentreport.hs',
				type: 'post',
				data : {'comment_number':n,'comment_report_id':sessionid},
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data){
					if(data==1){
						alert("신고 접수 되었습니다.");
					}
				},
				error:function(){
					alert("ajax통신 실패(commentReport)!!!");		
				}
			});
			click=true;
		}else{
			console.log("중복됨");
		}
	
	}else{
		return false;
	}
}