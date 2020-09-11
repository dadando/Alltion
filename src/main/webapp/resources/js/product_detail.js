'use strict';
$(function() {
    // 스크롤 내릴 때 카테고리 고정하기 by 하나
    let topPosition = parseInt($(".list_sidebar").css('top')); // 기존 위치 값 저장
    let footerHeight = $('.footer').outerHeight(); // 푸터 영역에서 멈추게 하기 위해 높이 구함

    $(window).scroll(function() {
        let scrollTop = $(window).scrollTop(); // 현재 스크롤 위치 가지고 오기
        let newPosition = scrollTop + topPosition + "px";
        let stopArea = $(document).height() - $(window).height() - footerHeight;

        if (scrollTop + 500 > stopArea) { // 120 추가 이유: 카테고리 펼쳐져 있을 때도 푸터 위에서 멈추게 하기 위해
            $('.list_sidebar').css('position', 'normal');
        } else {
            $(".list_sidebar").stop().animate({
                "top" : newPosition
            }, 400);
        }
    }).scroll();

    // 아코디언 by 하나
    $(".mainmenu").click(function() {
        $(this).next().slideDown();
        $(this).next().siblings(".submenu").slideUp();
    });
});
        
// BEST 영역 by 민석
var index = 0; //이미지에 접근하는 인덱스
window.onload = function() {
    slideShow();
}

function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; //처음에 전부 display를 none으로 설정
    }
    index++;
    if (index > x.length) {
        index = 1; //인덱스가 초과되면 1로 변경
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    x[index - 1].style.display = "block"; // 해당 인덱스는 block으로
    dots[index - 1].className += " active";
    setTimeout(slideShow, 4000);
}

$(function() {
	var cateurl = window.location.href;
	var subPage = new Array;
	subPage[0] = "cate01";
	subPage[1] = "cate02";
	subPage[2] = "cate03";
	subPage[3] = "cate04";
	subPage[4] = "cate05";
	subPage[5] = "cate06";
	subPage[6] = "cate07";
	subPage[7] = "cate08";
	subPage[8] = "cate09";
	subPage[9] = "cate10";
	subPage[10] = "cate11";
	subPage[11] = "cate12";

	var getidx1 = cateurl.indexOf(subPage[0]);
	var getidx2 = cateurl.indexOf(subPage[1]);
	var getidx3 = cateurl.indexOf(subPage[2]);
	var getidx4 = cateurl.indexOf(subPage[3]);
	var getidx5 = cateurl.indexOf(subPage[4]);
	var getidx6 = cateurl.indexOf(subPage[5]);
	var getidx7 = cateurl.indexOf(subPage[6]);
	var getidx8 = cateurl.indexOf(subPage[7]);
	var getidx9 = cateurl.indexOf(subPage[8]);
	var getidx10 = cateurl.indexOf(subPage[9]);
	var getidx11 = cateurl.indexOf(subPage[10]);
	var getidx12 = cateurl.indexOf(subPage[11]);

	if(getidx1 != -1){
		$("#mainmenu1").next().slideDown();
	};
	if(getidx2 != -1){
		$("#mainmenu2").next().slideDown();
	};
	if(getidx3 != -1){
		$("#mainmenu3").next().slideDown();
	};
	if(getidx4 != -1){
		$("#mainmenu4").next().slideDown();
	};
	if(getidx5 != -1){
		$("#mainmenu5").next().slideDown();
	};
	if(getidx6 != -1){
		$("#mainmenu6").next().slideDown();
	};
	if(getidx7 != -1){
		$("#mainmenu7").next().slideDown();
	};
	if(getidx8 != -1){
		$("#mainmenu8").next().slideDown();
	};
	if(getidx9 != -1){
		$("#mainmenu9").next().slideDown();
	};
	if(getidx10 != -1){
		$("#mainmenu10").next().slideDown();
	};
	if(getidx11 != -1){
		$("#mainmenu11").next().slideDown();
	};
	if(getidx12 != -1){
		$("#mainmenu12").next().slideDown();
	};
});

$(document).ready(function(){
	var url = window.location.href;
	var categoryidx = url.indexOf("=")
	var category2 = url.substring(categoryidx+1);
	
   	$("."+category2).addClass('on');

});
