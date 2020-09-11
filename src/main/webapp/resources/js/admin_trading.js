/* admin_trading 시작 by.유빈 */

let clickCheck = false; // 중복클릭 방지

$(() => {
    $("#listSearch--startDate").datepicker({
        showOn: "both",
        buttonImage: "resources/img/admin/calendar.png",
        buttonImageOnly: true,
    });
});

$(() => {
    $("#listSearch--endDate").datepicker({
        showOn: "both",
        buttonImage: "resources/img/admin/calendar.png",
        buttonImageOnly: true,
    });
});

$(document).ready(() => {
	getAdminTradingDate(1);
})

function getAdminTradingDate(page) {
	LoadingWithMask(); // 로딩화면 실행
	
    let formData = $('#searchForm').serialize();
    formData += "&page=" + page;
    	
    $.ajax({
        url : "getAdminTradingDate.yb",
        data : formData,
        dataType :"json",
        success : (adminTradingDate) => {
        	writeTradingList(adminTradingDate.tradingList);
        	writeTradingCount(adminTradingDate.listcount);
        	writePageInfo(adminTradingDate.pagination);
        	closeLoadingWithMask(); // 로딩화면 종료
    	},
        error : () => closeLoadingWithMask() // 로딩화면 종료
    });
}

$(document).on('click','.listSearch--sendSearchBtn', () => {
    if (searchFormCheck()) {
        return;
    }
    
    getAdminTradingDate(1);
});

function searchFormCheck() {
    const phoneRegexp = /^[0-9]*$/;
    let searchPhone = $('input[name="adminTradingNumber"]').val();
    if(!phoneRegexp.test(searchPhone)) {
        alert("상품번호는 숫자만 입력해주세요");
        return true;
    }

    let v_startDate = $('input[name="adminTradingStartDate"]').val();
    let v_endDate = $('input[name="adminTradingEndDate"]').val();
    
    if (v_startDate.length > 0 ? v_endDate.length == 0 : false) {
    	alert("등록기간의 날짜를 전부 입력해주세요");
        return true;
    }
    
    if (v_endDate.length > 0 ? v_startDate.length == 0 : false) {
    	alert("등록기간의 날짜를 전부 입력해주세요");
        return true;
    }
    
    let startDate = new Date(v_startDate);
    let endDate = new Date(v_endDate);
    let subtractDate = endDate - startDate;
    if (subtractDate < 0) {
        alert("등록기간의 시작하는 날짜는 끝나는날짜보다 빨라야 합니다");
        return true;
    }

    return false;
};

function writeTradingList(tradingList) {
	let adminTradingTable = "";
	
	adminTradingTable += `
		<tr class="list--tableHeader">
		    <th style="width:5%">상품 번호</th>
		    <th style="width:9%">구매자 아이디</th>
		    <th style="width:9%">판매자 아이디</th>
		    <th style="width:7%">거래 가격</th>
		    <th style="width:9%">입금 기한</th>
		    <th style="width:9%">운송장번호 입력기한</th>
		    <th style="width:9%">구매확정기한</th>
		    <th style="width:6%">거래방식</th>
		    <th style="width:10%">운송장번호</th>
		    <th style="width:8%">진행상태</th>
		    <th style="width:9%">등록일</th>
		    <th style="width:10%">거래변경</th>
        </tr>`;
	
	$.each(tradingList, (idx, vo) => {
		vo.tradingVO.trading_price = addCommas(vo.tradingVO.trading_price);
		
		adminTradingTable += `
			<tr>
	            <td class="tdCenter">${vo.tradingVO.trading_product_number}</td>
	            <td class="tdCenter">${vo.tradingVO.trading_buyer_id}</td>
	            <td class="tdCenter">${vo.productVO.product_id}</td>
	            <td class="tdRight">${vo.tradingVO.trading_price}</td>
	            <td class="tdCenter">${vo.tradingVO.trading_deposit_deadline}</td>
	            <td class="tdCenter">${vo.tradingVO.trading_waybill_deadline}</td>
	            <td class="tdCenter">${vo.tradingVO.trading_purchase_deadline}</td>`;
		
		if (vo.tradingVO.trading_transaction_method == "선불" ||
				vo.tradingVO.trading_transaction_method == "착불") {
			adminTradingTable += `
				<td class="tdCenter">택배</td>`;
		} else if (vo.tradingVO.trading_transaction_method == null) {
			adminTradingTable += `
				<td class="tdCenter">미정</td>`;
		} else {
			adminTradingTable += `
				<td class="tdCenter">직거래</td>`;
		}
		
		adminTradingTable += `
	            <td class="tdCenter">${vo.tradingVO.trading_waybill_number}</td>
	            <td class="tdCenter">${vo.tradingVO.trading_progress}</td>
	            <td class="tdCenter">${vo.tradingVO.trading_date}</td>`;
		
		adminTradingTable += `
	            <td class="flex-row list--update">
		            <button class="list--deadlineExtensionBtn" type="button">기한연장</button>
		            <button class="list--tradingResetBtn" type="button">초기화</button>
		        </td>
	        </tr>`;
	});
	
	$('.list--table').html(adminTradingTable);
}

function writeTradingCount(listcount) {
	$('.list--count').html(listcount);
}

//페이지정보 출력
function writePageInfo(pagination) {
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
			<li class="list--nonActive" data-page="${pagination.prev}">
		        <span class="material-icons">keyboard_arrow_left</span>
		    </li>`;
	}
	
	// '>'버튼의 정보가 0이 아니라면 활성화 한다
	if (pagination.next != 0) {
		nextContent = `
			<li class="list--nonActive" data-page="${pagination.next}">
		        <span class="material-icons">keyboard_arrow_right</span>
		    </li>`;
	}
	
	// 하단에 표시될 페이지버튼을 갯수만큼 활성화한다
	for (let i = startpage; i <= endpage; i++) {
		// 현재페이지
		if (i == nowPage) {
			pageContent += `
		    <li id="list--active" class="number" data-page="${i}">
		        <span>${i}</span>
		    </li>`;
		}
		// 다른페이지
		else {
			pageContent += `
		    <li class="list--nonActive number" data-page="${i}">
		        <span>${i}</span>
		    </li>`;
		}
	}
	
	// 위에서 설정한 이전버튼, 다음버튼, 페이지선택버튼을 종합하여 할당한다
	allPageContent = 
		prevContent +
		pageContent +
		nextContent;
	
	// view에 출력한다
	$('.list--paging').html(allPageContent);
}

//페이지 이동시 실행
$(document).on('click', '.list--nonActive', (e) => {
	// 클릭한 페이지버튼의 번호를 가져온다
	page = e.currentTarget.getAttribute('data-page');
	
	getAdminTradingDate(page);
});

$(document).on('click','.list--deadlineExtensionBtn', function() {
	if(clickCheck) {
		return;
	}
	clickCheck = true; // 중복클릭 방지설정
	
	let result = confirm("해당 거래의 기한을 하루 연장하시겠습니까?");
	if(!result) {
		clickCheck = false // 중복클릭 방지해제
		return
	}
	
    let tr = $(this).closest('tr');
    
    let tradingNumber = tr.children().eq(0).html();
    let purchaseDeadline = tr.children().eq(6).html();
    let waybillDeadline = tr.children().eq(5).html();

    let target;
    if (purchaseDeadline != " ") {
    	target = 0;
    } else if (waybillDeadline != " ") {
    	target = 1;
    } else {
    	target = 2;
    }
	
    $.ajax({
		url : "adminDeadlineExtension.yb",
		data : {
			"trading_product_number" : tradingNumber,
			"target" : target,
		},
	    dataType :"json",
		success : (newTradingVO) => {
			successDeadlineExtension(newTradingVO, tr);
			clickCheck = false // 중복클릭 방지해제
		},
		error : () => clickCheck = false // 중복클릭 방지해제
	});
});

function successDeadlineExtension(newTradingVO, tr) {
	tr.children().eq(4).html(newTradingVO.trading_deposit_deadline);
	tr.children().eq(5).html(newTradingVO.trading_waybill_deadline);
	tr.children().eq(6).html(newTradingVO.trading_purchase_deadline);
}

$(document).on('click','.list--tradingResetBtn', function() {
	if(clickCheck) {
		return;
	}
	clickCheck = true; // 중복클릭 방지설정
	
    let tr = $(this).closest('tr');
    let tradingProgress = tr.children().eq(9).html();
    
    if (tradingProgress == "입금대기" || tradingProgress == "거래완료" || tradingProgress == "리뷰완료") {
    	clickCheck = false // 중복클릭 방지해제
    	alert("초기화를 할 수 없습니다");
    	return
    }
	
	let result = confirm("초기화를 하게 되면 진행상태는 '입금대기'로 변경되며, 사용자가 입력했던 데이터는 기본값으로 변경됩니다\n초기화를 진행 하시겠습니까?");
	if(!result) {
		clickCheck = false // 중복클릭 방지해제
		return
	}
    
    let tradingNumber = tr.children().eq(0).html();
    
    $.ajax({
		url : "adminTradingReset.yb",
		data : {
			"trading_product_number" : tradingNumber,
		},
	    dataType :"json",
		success : (tradingVO) => {
			successTradingReset(tradingVO, tr);
			clickCheck = false; // 중복클릭 방지해제
		},
		error : () => clickCheck = false // 중복클릭 방지해제
	});
});

function successTradingReset(tradingVO, tr) {
	if (tradingVO.trading_transaction_method == "선불" ||
			tradingVO.trading_transaction_method == "착불") {
		tradingVO.trading_transaction_method = "택배";
	} else if (tradingVO.trading_transaction_method == null) {
		tradingVO.trading_transaction_method = "미정";
	} else {
		tradingVO.trading_transaction_method = "직거래";
	}
	
	tr.children().eq(4).html(tradingVO.trading_deposit_deadline);
	tr.children().eq(5).html(tradingVO.trading_waybill_deadline);
	tr.children().eq(6).html(tradingVO.trading_purchase_deadline);
	tr.children().eq(7).html(tradingVO.trading_transaction_method);
	tr.children().eq(8).html(tradingVO.trading_waybill_number);
	tr.children().eq(9).html(tradingVO.trading_progress);
}

function addCommas(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g,  ",");
}

//로딩화면
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
	let loadingImg = '<img id="loadingImg" src="resources/img/loading/Spinner-1s-200px.gif">';
	
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

//로딩화면 해제
function closeLoadingWithMask() {
	$('#mask, #loadingImg').remove(); 
}

/* admin_trading 끝 by.유빈 */