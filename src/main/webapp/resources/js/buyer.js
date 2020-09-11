        
    $(function(){
        // 광고 없애기
        $(".ad__banner--closeBtn").click(function(){
            $(".ad__banner").hide();
		})
        
        // 헤더 고정
        var header = $('.lower_header');
        $(window).scroll(function(){
            if($(this).scrollTop() > 0){
                    header.addClass('sticky');
               }else{
                    header.removeClass('sticky');
               }
        })
        
        // 2020-06-23 pm 03:55 추가
        // 실시간 시간 구하기
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
    });
    
  
  //이메일 변경 모달
    function modal_display_email(n) {
    	  
        var member_update_modal_email = document.getElementsByClassName('modal')[n];
        var close0 = document.getElementsByClassName('close')[n];
        member_update_modal_email.style.display = "block";
        close0.onclick = function(event) {
        	member_update_modal_email.style.display = "none";
        }


    // ↓↓모달창 외부 클릭시 모달창 닫아짐.
    window.onclick = function(event) {
        if (event.target == member_update_modal_email) {
        	member_update_modal_email.style.display = "none";
        }
        /*if (event.target == bid_notify_modal) {
            bid_notify_modal.style.display = "none";
        }*/
    }
    }
 
    function oneCheckbox(a){

        var obj = document.getElementsByName("review_evaluate");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }

    }
