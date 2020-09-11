/* admin_product 시작 by.유빈 */

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
	getAdminProductDate(1);
})

function getAdminProductDate(page) {
	LoadingWithMask(); // 로딩화면 실행
	
    let formData = $('#searchForm').serialize();
    formData += "&page=" + page;
	
    $.ajax({
        url : "getAdminProductDate.yb",
        data : formData,
        dataType :"json",
        success : (adminProductDate) => {
        	writeProductList(adminProductDate.productList);
        	writeProductCount(adminProductDate.listcount);
        	writePageInfo(adminProductDate.pagination);
        	closeLoadingWithMask(); // 로딩화면 종료
    	},
        error : () => closeLoadingWithMask() // 로딩화면 종료
    });
}

$(document).on('click','.listSearch--sendSearchBtn', () => {
    if (searchFormCheck()) {
        return;
    }
    
    getAdminProductDate(1);
});

function searchFormCheck() {
    const phoneRegexp = /^[0-9]*$/;
    let searchPhone = $('input[name="adminProductNumber"]').val();
    if(!phoneRegexp.test(searchPhone)) {
        alert("상품번호는 숫자만 입력해주세요");
        return true;
    }

    let v_startDate = $('input[name="adminProductStartDate"]').val();
    let v_endDate = $('input[name="adminProductEndDate"]').val();
    
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

function writeProductList(productList) {
	let adminProductTable = "";
	
	adminProductTable += `
		<tr class="list--tableHeader">
            <th style="width:8%">상품 번호</th>
            <th style="width:10%">상품 제목</th>
            <th style="width:10%">판매자 아이디</th>
            <th style="width:8%">상품 분류</th>
            <th style="width:8%">경매현재가</th>
            <th style="width:8%">입찰수</th>
            <th style="width:14%">경매종료일</th>
            <th style="width:14%">등록일</th>
            <th style="width:10%">진행상태</th>
            <th style="width:10%">마감처리</th>
        </tr>`;
	
	$.each(productList, (idx, vo) => {
		vo.product_current_price = addCommas(vo.product_current_price);
		
		adminProductTable += `
			<tr>
	            <td class="tdCenter">${vo.product_number}</td>
	            <td><p>${vo.product_subject}</p></td>
	            <td class="tdCenter">${vo.product_id}</td>
	            <td class="tdCenter">${vo.product_category_1}</td>
	            <td class="tdRight">${vo.product_current_price}</td>
	            <td class="tdRight">${vo.product_bids}</td>
	            <td class="tdCenter">${vo.product_end_date}</td>
	            <td class="tdCenter">${vo.product_issue_date}</td>`;
		
		if (vo.product_progress == 0) {
			adminProductTable += `
				<td class="tdCenter">진행중</td>`;
		} else if (vo.product_progress == 1) {
			adminProductTable += `
				<td class="tdCenter">마감</td>`;
		}
		
		adminProductTable += `
	            <td class="flex-row list--update">
	                <button class="list--productEndBtn" type="button">마감</button>
	            </td>
	        </tr>`;
	});
	
	$('.list--table').html(adminProductTable);
}

function writeProductCount(listcount) {
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
	
	getAdminProductDate(page);
});

$(document).on('click','.list--productEndBtn', function() {
	let result = confirm("마감된 경매는 되돌리지 못합니다\n정말로 경매를 마감 하시겠습니까?");
	if(!result) {
		return
	}
	
    let tr = $(this).closest('tr');
    
    let productNumber = tr.children().eq(0).html();
	
    $.ajax({
		url : "adminProductEnd.yb",
		data : {
			"product_number" : productNumber,
		},
	    dataType :"json",
		success : (newProductVO) => {
			successProductEnd(newProductVO, tr);
		},
		error : () => {}
	});
});

function successProductEnd(newProductVO, tr) {
	tr.children().eq(6).html(newProductVO.product_end_date);
	tr.children().eq(8).html("마감");
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

/* admin_product 끝 by.유빈 */