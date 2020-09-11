'use strict';
$(document).ready(function() {
    // TOP 키
    let sc = $(window).scrollTop(); // scroll이 제일 위에 있을 때 위치값
    if(sc == 0){
        $("#topKey").fadeOut();
    }

    $("#topKey").click(function(){
        $("html,body").animate({
            "scrollTop" : "0px"
        });
    })

    // scroll이 제일 위에 왔을 때 숨기기
    $(window).scroll(function(){
        sc = $(this).scrollTop();

        if(sc == 0){
            $("#topKey").fadeOut();
        }
        else {
            $("#topKey").fadeIn();
        }
//                console.log(sc);
    })

//            // 광고 없애기 - 메인에만 넣기로 함
//            $(".ad__banner--closeBtn").click(function() {
//                $(".ad__banner").hide();
//            })

    // 헤더 고정
    let header = $('.lower_header');
    $(window).scroll(function() {
        if ($(this).scrollTop() > 0) {
            header.addClass('sticky');
        } else {
            header.removeClass('sticky');
        }
    })
});
        
// 2020-06-23 pm 03:55 추가
// 실시간 시간 구하기 by. 하나
setInterval(function(){
    let nowDate = new Date();
    let day = ['(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)'];
    let dayNum = nowDate.getDay();
    let year = nowDate.getFullYear();
    let month= nowDate.getMonth() + 1;
    let date = nowDate.getDate();
    let hour = nowDate.getHours();
    let min = nowDate.getMinutes();
    let sec = nowDate.getSeconds();

    /*
    // 오전 오후로 나누고 싶을 때
    let amPm = '오전';

    if(hour >= 12) {
        amPm = '오후';
        hour = hour - 12;
    }

    document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + amPm + '&nbsp;' + addZero(hour) + ":" + addZero(min) + ":" + addZero(sec);
    */

    document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + hour + ":" + addZero(min) + ":" + addZero(sec);
},1000);

// 일의 자리 숫자일 때 0 붙여 주기
function addZero(i) {
    if (i < 10) {
        i = '0' + i
    };
    return i;
} // 2020-06-23 pm 03:55 추가



//비밀번호 체크
function checkpassword() {
	
	var pwd1 = $("#member_password").val();
    var pwd2 = $("#member_password2").val();
    
	if (pwd1 == pwd2) {
	    $("#alert-success1").css('display', 'inline-block');
	    $("#alert-danger1").css('display', 'none');
	} else {
	    
	    $("#alert-success1").css('display', 'none');
	    $("#alert-danger1").css('display', 'inline-block');
	    $("#member_password").val('');
	    $("#member_password2").val('');
	    $("#member_password").focus();
	}

}
//주소 js
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
         

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
//이메일 변경 모달
function modal_display_email() {
	  
    var member_update_modal_email = document.getElementById('member_update_modal_email');
    var close0 = document.getElementsByClassName('close')[0];
    member_update_modal_email.style.display = "block";
    close0.onclick = function(event) {
    	member_update_modal_email.style.display = "none";
    }


// ↓↓모달창 외부 클릭시 모달창 닫아짐.
window.onclick = function(event) {
    if (event.target == member_update_modal_email) {
    	member_update_modal_email.style.display = "none";
    }
    if (event.target == bid_notify_modal) {
        bid_notify_modal.style.display = "none";
    }
}
}

//휴대전화 변경 모달
function modal_display_phone() {
	  
    var member_update_modal_phone = document.getElementById('member_update_modal_phone');
    var close1 = document.getElementsByClassName('close')[1];
    member_update_modal_phone.style.display = "block";
    close1.onclick = function(event) {
    	member_update_modal_phone.style.display = "none";
    }


// ↓↓모달창 외부 클릭시 모달창 닫아짐.
window.onclick = function(event) {
    if (event.target == member_update_modal_phone) {
    	member_update_modal_phone.style.display = "none";
    }
    if (event.target == bid_notify_modal) {
        bid_notify_modal.style.display = "none";
    }
}
}
//주소 병경 모달
function modal_display_address() {
	  
    var member_update_modal_address = document.getElementById('member_update_modal_address');
    var close2 = document.getElementsByClassName('close')[2];
    member_update_modal_address.style.display = "block";
    close2.onclick = function(event) {
    	member_update_modal_address.style.display = "none";
    }


// ↓↓모달창 외부 클릭시 모달창 닫아짐.
window.onclick = function(event) {
    if (event.target == member_update_modal_address) {
    	member_update_modal_address.style.display = "none";
    }
    if (event.target == bid_notify_modal) {
        bid_notify_modal.style.display = "none";
    }
}
}
//회원 탈퇴 모달
function modal_display_delete_member() {
	  
    var member_update_modal_delete_member = document.getElementById('member_update_modal_delete_member');
    var close3 = document.getElementsByClassName('close')[3];
    member_update_modal_delete_member.style.display = "block";
    close3.onclick = function(event) {
    	member_update_modal_delete_member.style.display = "none";
    }


// ↓↓모달창 외부 클릭시 모달창 닫아짐.
window.onclick = function(event) {
    if (event.target == member_update_modal_delete_member) {
    	member_update_modal_delete_member.style.display = "none";
    }
    if (event.target == bid_notify_modal) {
        bid_notify_modal.style.display = "none";
    }
}
}
