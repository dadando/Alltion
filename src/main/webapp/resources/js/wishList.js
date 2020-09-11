/* 찜목록 시작 by.유빈 */

let page; // 현재 페이지번호(URL에도 쓰인다)
let endDateFormat; // 현재 마감시간형식(URL에도 쓰인다)
let clickCheck = false; // 중복클릭 방지

// 찜목록을 가져온다
function getWishList(page) {
	scrollDisable(); // 스크롤 고정
	LoadingWithMask(); // 로딩화면 실행
	
	// DB에서 찜목록 가져오기
    $.ajax({
        url : "getWishList.yb",
        data : {
        	"page" : page
        },
        dataType :"json",
        success : (contentsData) => {
        	wishListOutput(contentsData.wishList); // 찜목록 내용 출력
        	wishListCountOutput(contentsData.listcount); // 찜몰록 갯수 출력
        	pageInfoOutput(contentsData.pagination); // 페이지 정보 출력
        	closeLoadingWithMask(); // 로딩화면 종료
        	scrollAble(); // 스크롤 고정해제
        },
        error : () => {
        	notFoundWishList(); // 찜목록이 없을시 함수실행
        	closeLoadingWithMask(); // 로딩화면 종료
        	scrollAble(); // 스크롤 고정해제
        }
    });
}

// 찜목록이 1개 이상일시에 실행
function wishListOutput(wishList) {
	let wishListContents = ""; // 찜목록 데이터 내역
	
	// 찜목록 객체(list) 만큼 반복실행
	$.each(wishList, (idx, vo) => {
		// 찜목록에 저장된 데이터를 대입하여 태그를 작성
		wishListContents += `
		<div class="wishList--contents">
		    <div class="wishList--deleteCheck">
		        <input class="wishList--deleteCheck__deleteCheck" type="checkbox" value="${vo.product_number}">
		    </div>
		    <div class="wishList--info">
		        <div class="wishList--thumbnail">
		            <img src="${vo.product_img_1}">
		        </div>
		        <div class="wishList--description">
		            <p class="wishList--description__category">${vo.product_category_1} &gt; ${vo.product_category_2}</p>
		            <p class="wishList--description__subject"><a>${vo.product_subject}</a></p>
		            <p class="wishList--description__seller">${vo.product_id} / ${vo.product_credit_score}(수정 : 클릭여부, 신용도등급변환)</p>
		        </div>
		    </div>
		    <div class="wishList--currentPrice">
		        <p class="wishList--currentPrice__currentPrice">${vo.product_current_price}</p>
		        <div class="wishList--purchase_priceWarp">
		            <p class="wishList--purchase_priceWarp__purchase_price">즉시구매가 : ${vo.product_purchase_price}</p>
		            <p class="wishList--purchase_priceWarp__bids">입찰 : ${vo.product_bids}</p>
		        </div>
		    </div>
		    <div class="wishList--delivery">
		        <p class="wishList--delivery__delivery">${vo.product_delivery}</p>
		        <p class="wishList--delivery__transactionArea">직거래가능지역 : ${vo.product_transaction_area}</p>
		    </div>
		    <div class="wishList--endDate">
		        <p class="wishList--endDate__endDate" data-endDate="${vo.product_end_date}">${vo.product_end_date}</p>
		        <button class="wishList--bidBtn" type="button" onclick="location.href='./boarddetail.hs?product_number=${vo.product_number}'">응찰하기</button>
		    </div>
		</div>`;
	})
	
	// 위 each문에서 설정된 내용을 출력한다
	$('.wishList--contentsWarp').html(wishListContents);
	
	// 사용자가 지정한 마감시간Format으로 변환
	chageEndDateFormat();
}

// 찜목록 갯수 출력
function wishListCountOutput(listcount) {
	$('.wishList--conut').last().html(listcount)
}

// 페이지정보 출력
function pageInfoOutput(pagination) {
	let allPageContent = ""; // veiw에 출력될 페이지정보 부분 내용
	let prevContent = ""; // 이전버튼 '<'
	let nextContent = ""; // 디음버튼 '>'
	let pageContent = ""; // 페이지번호 버튼
	
	let nowPage = pagination.page; // 클릭한 페이지
	let startpage = pagination.startpage; // '< >' 사이의 제일 왼쪽 페이지버튼 
	let endpage = pagination.endpage; // '< >' 사이의 제일 오른쪽 페이지버튼 
	
	// '<'버튼의 정보가 0이 아니라면 활성화 한다
	if (pagination.prev != 0) {
		prevContent = `
			<li class="nonActive" data-page="${pagination.prev}">
		        <span class="material-icons">keyboard_arrow_left</span>
		    </li>`;
	}
	
	// '>'버튼의 정보가 0이 아니라면 활성화 한다
	if (pagination.next != 0) {
		nextContent = `
			<li class="nonActive" data-page="${pagination.next}">
		        <span class="material-icons">keyboard_arrow_right</span>
		    </li>`;
	}
	
	// 하단에 표시될 페이지버튼을 갯수만큼 활성화한다
	for (let i = startpage; i <= endpage; i++) {
		// 현재페이지
		if (i == nowPage) {
			pageContent += `
		    <li id="active" class="number" data-page="${i}">
		        <span>${i}</span>
		    </li>`;
		}
		// 다른페이지
		else {
			pageContent += `
		    <li class="nonActive number" data-page="${i}">
		        <span>${i}</span>
		    </li>`;
		}
	}
	
	// 위에서 설정한 이전버튼, 다음버튼, 페이지선택버튼을 종합하여 할당한다
	allPageContent = `
	<ul class="wishList--page">` +
		prevContent +
		pageContent +
		nextContent + `
	</ul>`;
	
	// view에 출력한다
	$('.wishList--pageWarp').html(allPageContent);
}

// 찜목록이 없을시에 실행
function notFoundWishList() {
	// 찜목록 갯수 0, 체크박스의 체크해제, 찜목록내용은 공란
	$('.wishList--conut').last().html(0);
	$(".wishList--deleteCheck__allDeleteCheck").prop("checked", false);
	$('.wishList--contentsWarp').html("");
}

// 로딩화면
function LoadingWithMask() {
    // 화면의 높이와 너비를 구한다
    let maskHeight = $(document).height();
    let maskWidth  = window.document.body.clientWidth;
     
    // 화면에 출력할 마스크를 설정
    let mask       = ' \
    	<div id="mask" style=" \
	    	position:absolute; \
	    	z-index:999999; \
	    	background-color:#000000; \
	    	left:0; \
	    	top:0;"> \
    	</div>';
    
    // 화면에 출력할 로딩이미지를 설정
    let loadingImg = ' \
    	<img id="loadingImg" src="resources/img/loading/Spinner-1s-200px.gif" \
    	style=" \
	    	position: relative; \
	    	display: block; \
	    	margin: 0px auto; \
	    	top: -600px; \
    	">';
 
    // 화면에 레이어 추가
    $('body').append(mask)
 
    // 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채움
    $('#mask').css({
            'width' : maskWidth,
            'height': maskHeight,
            'opacity' :'0.3'
    });
  
    // 로딩중 이미지 표시
    $('body').append(loadingImg);
}

// 로딩화면 해제
function closeLoadingWithMask() {
    $('#mask, #loadingImg').remove(); 
}

// 스크롤고정
function scrollDisable() {
	$('html, body').addClass('hidden');
	$('html, body').on('scroll touchmove mousewheel', function(e) {
		e.preventDefault();
		e.stopPropagation();
		return false;
	})
}

// 스크롤고정 해제
function scrollAble(){
	$('html, body').removeClass('hidden');
	$('html, body').off('scroll touchmove mousewheel');
}

// 체크박스 전체선택, 전체해제 
function checkAll() {
	// 전체 체크박스가 체크되었으면 나머지 체크박스을 체크한다 else이면 체크해제한다
	if( $(".wishList--deleteCheck__allDeleteCheck").is(':checked') ){
		$(".wishList--deleteCheck__deleteCheck").prop("checked", true);
	} else {
		$(".wishList--deleteCheck__deleteCheck").prop("checked", false);
	}
}

// 선택한 찜목록 삭제
function wishListDelete() {
	// 중복클릭이라면 함수 중지
	if(clickCheck) {
		return;
	}
	clickCheck = true; // 중복클릭 방지설정
	
	let deleteWishList = new Array(); // 삭제할 데이터의 상품번호
	
	// 체크한 데이터의 상품번호를 list에 담는다
	$('.wishList--deleteCheck__deleteCheck:checked').each((idx, element) => {
		deleteWishList.push(element.value);
	});
	
	$.ajax({
        url : "wishListDelete.yb",
        type : "POST",
        data : {
        	"deleteWishList" : deleteWishList
    	},
        success : () => {
        	getWishList(page); // 성공시 리스트 재갱신
        	clickCheck = false; // 중복클릭 방지해제
        },
        error : () => clickCheck = false // 중복클릭 방지해제
    });
}

// 버튼과 마감시간의 형식을 바꿔준다
function chageEndDateFormat() {
	$('.wishList--endDate__endDate').each(function () {
    	// 버튼의 상태에 따라 마감시간의 형식을 바꿔준다
        if (endDateFormat) {
            chanageEndDateToTimeLeft($(this)); // 종료시간 -> 남은시간
        } else {
            chanageTimeLeftToEndDate($(this)); // 남은시간 -> 종료시간
        }
    })
    
    // 버튼의 내용을 바꿔준다
    if (endDateFormat) {
        $('.wishList--changeEndDateFormBtn').html("종료시간 표기");
    } else {
        $('.wishList--changeEndDateFormBtn').html("남은시간 표기");
    }
}

//종료시간(남은시간)버튼 클릭시 실행
$(document).on('click', '.wishList--changeEndDateFormBtn', () => {
	sendChageEndDateBtn(); // 변수 상태와 URL을 변경해준다
	chageEndDateFormat(); // 마감시간의 형식과 버튼의 내용을 바꿔준다
});

// 버튼을 눌렀을때 버튼의 상태를 나타내는 변수값을 바꿔주고  URL도 바꿔준다
function sendChageEndDateBtn() {
    if (endDateFormat) {
    	endDateFormat = 0;
    	udpateURL();
    } else {
    	endDateFormat = 1;
    	udpateURL();
    }
}

const _second = 1000; // 1초
const _minute = _second * 60; // 1분
const _hour = _minute * 60; // 1시간
const _day = _hour * 24; // 1일

// 종료시간 -> 남은시간
function chanageEndDateToTimeLeft(element) {
	let now = new Date(); // 현재시간
	let endDate = new Date(element.attr("data-endDate")); // 마감시간
	let resultTime = ""; // 남은시간
	
	// 마감시간에서 현재시간을 차감해준다
	let subtractTime = endDate - now;
	 
	// 남은시간이 마이너스라면 마감처리
	if(subtractTime < 0) {
		element.html("마감되었습니다");
		return;
	}
	 
	// 소수점버림(남은시간 / 1일)
	// 예) 1일 1시간 1분 / 1일 = 1일 1시간 1분
	// 소수점을 버리기에 "1일"이 된다
	let days = Math.floor(subtractTime / _day);
	if (days > 0) {
		resultTime += days + "일 "
	}
	 
	// 소수점버림(남은시간 % 1일 / 1시간)
	// 예) 1일 1시간 1분 % 1일 = 1시간 1분
	// 1시간 1분 / 1시간 = 1시간 1분 
	// 소수점을 버리기에 "1시간"이 된다
	let hours = Math.floor((subtractTime % _day) / _hour);
	if (hours > 0) {
		resultTime += hours + "시간 "
	}
	
	let minutes = Math.floor((subtractTime % _hour) / _minute);
	if (minutes > 0) {
		resultTime += minutes + "분 "
	}
	 
	// 마감시간 화면에 출력
	element.html(resultTime);
}

// 남은시간 -> 종료시간
function chanageTimeLeftToEndDate(element) {
	// 현재시간을 얻어온다
	let now = new Date();
	let dataEndDate = element.attr("data-endDate"); // 태그에 저장된 마감시간
	let endDate = new Date(dataEndDate); // Date형식의 마감시간

	// 마감시간에서 현재시간을 차감해준다
	let subtractTime = endDate - now;

	// 남은시간이 마이너스라면 마감처리
	if(subtractTime < 0) {
		element.html("마감되었습니다");
		return;
	}
 
	// 마감시간 화면에 출력
	element.html(dataEndDate);
}

// URL를 바꿔준다
function udpateURL() {
	let renewURL = ""; // 새로운 URL
	
	renewURL += "?page=" + page; // 페이지번호
	renewURL += "&endDateFormat=" + endDateFormat; // 마감시간 형식
	
	// URL업데이트 실행
	history.pushState(null, null, renewURL);
}

// URL에 있는 정보중 파라미터(key)을 찾아 해당 value를 반환한다 
function getParam(key) {
	let result = ""; // 파라미터(key)의 value
	
	// URL에서 파라미터의 모든 정보를 가져온다
    let params = location.search.substr(location.search.indexOf("?") + 1);
    
    // "&"을 기준으로 나누어서 배열로 변화한다
    params = params.split("&");
    
    // 나누어진 key와 value를 쌍으로 묶어서 하나씩 검사한다
    for (let i = 0; i < params.length; i++) {
    	// 한 쌍의 key와 value를 0번, 1번 인덱스에 저장한다(배열형태로)
        temp = params[i].split("=");
        
        // 0번에 있는 key값이 파라미터로 받은 key과 동일하다면
        // 1번에 있는 value값을 result에 할당한다
        if ([temp[0]] == key) {
        	result = temp[1];
    	}
    }
    
    return result;
}

// 페이지 이동시 실행
$(document).on('click', '.nonActive', (e) => {
	// 클릭한 페이지버튼의 번호를 가져온다
	page = e.currentTarget.getAttribute('data-page');
	
	getWishList(page); // 찜목록을 가져온다

	udpateURL(); // 페이지버튼이 변경되었으므로 URL를 변경한다
});

// 페이지 로딩이 끝난 후 실행
$('document').ready(() => {
	page = Number(getParam("page")); // URL에서 페이지번호를 가져온다
	endDateFormat = Number(getParam("endDateFormat")); // URL에서 마감시간 형식를 가져온다
	
	getWishList(page); // 찜목록을 가져온다
})

/* 찜목록 끝 by.유빈 */