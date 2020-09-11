/* 상품등록 시작 by.유빈 */

/* 카테고리 선택 시작 */
function changeCategory(item) {
    let name = item.name; // 카테고리1, 카테고리2
    let value = item.value; // 선택한 카테고리
    let routeOutput = ''; // 카테고리 경로 출력

    // 선택한 카테고리가 1차인지 2차인지
    if (name == 'product_category_1') {

        // 카테고리가 1차이면 선택한 값을 카테고리 경로로 바꾼다
        // '선택해주세요'를 선택하면 공란으로 바꾼다
        routeOutput = $('.category--select__01 option:selected').text();
        if (routeOutput == '- 선택해주세요 -') {
            $('.category--route__text').children('p').html('');
            $('.category--select__01').next().remove();
            return;
        } else {
            $('.category--route__text').children('p').html(routeOutput);
        }

        // 선택한 1차 카테고리에 대한 세부적인 2차 카테고리를 띄운다
        if (value == 'cate01') { // 패션
            changeCategory_2(value, "여성의류", "남성의류", "여성신발", "남성신발", 
                "액세서리", "귀금속", "모자", "기타잡화/관련용품", "수입명품");

        } else if (value == 'cate02') { // 뷰티
            changeCategory_2(value, "스킨케어", "메이크업", "헤어/바디", "향수", 
                "네일케어", "남성 화장품", "가발/기타용품");

        } else if (value == 'cate03') { // 출산/유아동
            changeCategory_2(value, "출산/육아용품", "유아동안전/실내용품", "유아동의류", "유아동잡화", 
                "유아동가구", "기타 유아동용품");

        } else if (value == 'cate04') { // 전자기기
            changeCategory_2(value, "모바일", "태블릿 PC", "노트북", "데스크탑", 
                "카메라", "캠코더");

        } else if (value == 'cate05') { // 가전제품
            changeCategory_2(value,"냉장고", "TV", "세탁기/건조기", "주방가전", 
                "스마트홈", "영상가전", "음향가전", "계절가전", "생활가전", "기타 가전제품");

        } else if (value == 'cate06') { // 가구/인테리어
            changeCategory_2(value, "침실가구", "거실가구", "주방가구", "수납/선반/공간박스", "사무용가구", 
                "기타가구", "침구" ,"커튼/카페트", "인테리어소품", "이벤트/파티용품", "리빙생활");

        } else if (value == 'cate07') { // 반려동물/취미
            changeCategory_2(value, "반려동물", "키덜트", "핸드메이드/DIY", "악기", 
                "예술작품/골동품/수집", "미술재료/미술도구", "게임");

        } else if (value == 'cate08') { // 도서/음반/문구
            changeCategory_2(value, "유아동도서/음반", "학습/교육", "소설/만화책", "여행/취미/레저", 
                "문화/과학/경영", "예술/디자인", "잡지", "기타 도서", "음반/DVD/굿즈", "문구/사무용품");

        } else if (value == 'cate09') { // 티켓/쿠폰
            changeCategory_2(value, "티켓", "상품권/쿠폰", "여행숙박/이용권", "기타 티켓/쿠폰/이용권");

        } else if (value == 'cate10') { // 스포츠
            changeCategory_2(value, "골프", "자전거", "인라인/스케이트/전동", "축구", "야구", "농구", 
                "라켓스포츠", "헬스/요가", "수상스포츠", "검도/격투/권투", "기타 스포츠", "레저/여행");

        } else if (value == 'cate11') { // 공구/산업용품
            changeCategory_2(value, "드릴/전동공구", "에어/유압", "작업공구", "측정공구", 
                "초경/절삭/접착윤활", "전기/전자", "배관설비/포장운송", "금형공작", "용접기자재", 
                "산업/안전/공구함", "산업자재", "농기계/농업용공구");

        } else if (value == 'cate12') { // 기타잡화 display: none 때문에 따로 정의
            $('.category--select__01').next().remove();

            let selectOutput = ' \
            <select class="category--select__02" name="product_category_2" \
            	size="7" dionchange="changeCategory(this)" \
            	style="display: none;"> \
                <option value="cate1201" selected>기타잡화</option> \
            </select>';

            $('.category--select__01').after(selectOutput);
        }
    }
    // 2차 카테고리를 선택했을시에는 경로를 추가하여 표시해준다
    else if (name == 'product_category_2') {
        // 2차 카테고리에서 선택한 값을 할당
        let category02Check = $('.category--select__02 option:selected').text();

        if (category02Check == '- 선택해주세요 -') { // 1차경로만 표시
            routeOutput = $('.category--select__01 option:selected').text();
            $('.category--route__text').children('p').html(routeOutput);
        } else { // 1차경로 + 2차경로 표시
            routeOutput = $('.category--select__01 option:selected').text();
            routeOutput += ' &gt; ';
            routeOutput += $('.category--select__02 option:selected').text();
            $('.category--route__text').children('p').html(routeOutput);
        }
    }
}

// 1차 카테고리를 선택했을때 선택할수 있는 2차 카테고리 콤보박스를 바꿔준다
function changeCategory_2(value) {
    let selectOutput; // 2차 카테고리 생성 태그가 담길 객체
    let categoryNumber; // 2차카테고리 넘버

    $('.category--select__01').next().remove(); // 기존에 있던 2차카테고리 삭제
    
    /* 2차 카테고리 태그 작성 시작 */
    selectOutput = `<select class="category--select__02" 
    	name="product_category_2" size="7" onchange="changeCategory(this)">
            <option value="">- 선택해주세요 -</option>`;
    	
    	// arguments는 해당 함수를 호출할때의 파라미터 데이터를 의미한다
    	// js에서는 호출할때 지정된 것 외의 파라미터를 받을 수 있다
        $.each(arguments, (idx, argument) => { // 2차 카테고리 갯수만큼 루프
        	if(idx == 0) {
        		return true;
        	}
        	if (idx < 10) { // 2차 카테고리 넘버가 한자리 수이면 앞에 0 붙이기. 예) 0 + 1 = 01
                categoryNumber = 0 + String(idx);
            }
            // 함수의 0번쨰 파라미터를 제외한 나머지 갯수만큼 option태그 생성
            selectOutput += `<option value="${value}${categoryNumber}">
            	${argument}</option>`;
        });
    selectOutput += `</select>`;
    /* 2차 카테고리 태그 작성 끝 */

    $('.category--select__01').after(selectOutput);
}
/* 카테고리 선택 끝 by.유빈 */

// 직거래, 가능지역 input태그 Open, Close 하기
function changeInput(item) {
    let name = item.name; // 직거래, 즉시구매
    let value = item.value; // 불가능, 가능

    // 변경된 값이 직거래일때
    if (name == 'direct') {
        if (value == 0) {
            $('.directArea').attr("readonly", true);
            $('.directArea').addClass('readonlyfalse');
            $('.directArea').val('');
        }
        if (value == 1) {
            $('.directArea').attr("readonly", false);
            $('.directArea').removeClass('readonlyfalse');
            $('.directArea').focus();
        }
    }
    // 변경된 값이 즉시구매일때
    else if (name == 'purchase') {
        if (value == 0) {
            $('.purchasePrice').attr("disabled", true);
            $('.purchasePrice').addClass('readonlyfalse');
            $('.purchasePrice').val('');
        }
        if (value == 1) {
            $('.purchasePrice').attr("disabled", false);
            $('.purchasePrice').removeClass('readonlyfalse');
            $('.purchasePrice').focus();
        }
    }
    
}

/* 시작가, 즉시구매가 천단위쉼표, 숫자만입력 시작  */
$(".product--form [name$='price']")
	.on("focus", function () {
		let value = $(this).val(); // 입력값
		value = removeCommas(value); // 쉼표제거
    	$(this).val(value); // 반환
	})
	.on("focusout", function () { 
		let value = $(this).val(); // 입력값
		if(value && value.length > 0) { // 데이터가 존재하면
	        if(!$.isNumeric(value)) { // 숫자가 아닌것은 제거
	        	value = value.replace(/[^0-9]/g, "");
	        }
	        value = addCommas(value); // 쉼표추가
	        $(this).val(value); // 반환
		}
	})
	.on("keyup", function () {
    $(this).val($(this).val().replace(/[^0-9]/g, "")); // 숫자가 아닌것은 제거
});

//3자리 단위마다 콤마 생성
function addCommas(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(value) {
    if(!value || value.length == 0) {
    	return "";
    } else {
    	return value.split(",").join("");
    }
}
/* 시작가, 즉시구매가 천단위쉼표, 숫자만입력 끝 */

// 경매기간에 따른 마감시간 계산 후 input태그에 삽입
function changeEndDate(value) {
    let now = new Date(); // 현재
    value = Number(value); // Number로 타입변환

    now.setDate(now.getDate() + value); // 현재 + 선택한 기간

    let year = now.getFullYear(); // 년

    // if문
    // 10이하는 한자리수 이므로 "0"을 붙여 2자리수로 만든다
    let month = now.getMonth() + 1; // 월

    if (month < 10) {
        month = "0" + month;
    }

    let date = now.getDate(); // 일
    if (date < 10) {
        date = "0" + date;
    }

    let hour = now.getHours(); // 시간
    if (hour < 10) {
        hour = "0" + hour;
    }

    let min = now.getMinutes(); // 분
    if (min < 10) {
        min = "0" + min;
    }

    // 출력 포맷
    let output = year + "년 " + month + "월 " + date + "일 " + hour + "시 " + min + "분"

    // input태그에 삽입
    $('.endDate').val(output);

}

// 에디터 이미지 업로드 및 이미지 출력
function editorImgUpload(file, editor) {
    let form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
        data: form_data,
        type: "POST",
        url: 'editorImgUpload.yb',
    	/*
    	- cache : false 로 선언 시 ajax 로 통신 중 cache 가 남아서 갱신된 데이터를 받아오지 못할 경우를 방지함
    	- contentType : false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
		- processData : false로 선언 시 formData를 string으로 변환하지 않음
    	*/
        cache: false,
        contentType: false,
        processData: false,
        enctype: 'multipart/form-data',
        success: (img_name) => {
        	/*
        	0 = jpg 형식이 아님.
        	1 = 3MB 초과
        	그외는 에디터에 이미지 추가
        	*/
        	
            if (0 == img_name) {
                alert("이미지는 jpg 형식만 가능합니다");
            } else if (1 == img_name) {
                alert("업로드 가능한 이미지의 최대용량은 3MB입니다");
            } else {
                $(editor).summernote('insertImage', img_name);
            }

        }, error: () => alert("이미지 업로드를 실패하였습니다")
    });
}

/* 상품정보 - 이미지 등록 시작 */

let uploadFiles = []; // 업로드 할 이미지가 할당 될 배열
let thumbnailCount = 0;

$(document)
    .on("dragover", '#drop', dragOver) // 드래그 요소가 들어왔을때
    .on("dragleave", '#drop', dragOver) // 드래그 요소가 나갔을때
    .on('drop', '#drop', uploadFile); // 드래그 요소를 떨어트렸을때

$(document)
    .on("change", '#fileUpload', uploadFile) // input으로 파일첨부가 되었을때

function dragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
        $('#drop').css({
            "background-color": "#ddd"
        });
    } else {
        $('#drop').css({
            "background-color": "#eee"
        });
    }
}

function uploadFile(e) { // 파일첨부 실행
    let files; // 파일리스트를 담을 객체
    let file; // 파일을 담을 객체
    let idx // uploadFiles 배열에 push한 인덱스번호
    
    e.stopPropagation(); // 이벤트 상위요소로 전파X
    e.preventDefault(); // 기본 이벤트 제거

    /* input으로 파일첨부가 되엇을때 */
    if (e.type == "change") {
        file = this.files[0]; // 이미지 할당

        if (fileValidation(file)) { // 이미지 유효성 검사
            return;
        }

        idx = uploadFiles.push(file); // 업로드 목록에 추가
        preview(file, idx - 1); // 미리보기 만들기
    } 
    /* 드랍으로 파일첨부가 되엇을때 */
    else {
        dragOver(e); // 드랍되을때 css 원상복귀
        files = e.originalEvent.dataTransfer.files; // 드래그&드랍 항목들

        for (let i = 0; i < files.length; i++) { // 이미지 한개씩 할당
            file = files[i]; // 이미지 할당
            
            if (fileValidation(file)) { // 이미지 유효성 검사
                return;
            }
            
            idx = uploadFiles.push(file); // 업로드 목록에 추가
            preview(file, idx - 1); // 미리보기 만들기
        }
    }
    
}

// 이미지 유효성 검사
function fileValidation(file) { 
    if (thumbnailCount > 4) { // 이미지는 최대 5장까지만
        alert("이미지는 최대 5장까지 가능합니다");
        return true;
    } else if (file.size > 30145728) { // 용량 3MB 유효성 검사
        alert("업로드 가능한 이미지의 최대용량은 3MB입니다");
        return true;
    } else if (file.type != "image/jpeg") { // 확장자 유효성 검사
        alert("이미지는 jpg 형식만 가능합니다");
        return true;
    }
    
    return false;
}

// 미리보기 생성
function preview (file, idx) {
    let reader = new FileReader(); // 파일을 읽기 위한 FileReader객체 생성
    
    reader.onload = (e) => { // 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
    	let thumb = `
    	<div class="thumb">
    		<span class="material-icons close" data-idx="${idx}">clear</span>
    		<img src="${e.target.result}"/>
    		<p>${file.name}</p>
    	</div>`;
    	
        $("#thumbnails").append(thumb);
    };
    
    reader.readAsDataURL(file); // File내용을 읽어 dataURL형식의 문자열로 저장
    thumbnailCount++; // 썸네일 갯수 증가
	$('#drop').css({"font-size": "0"}); // 드롭박스 안내문구 안보이게
}

// 미리보기 삭제
$("#thumbnails").on("click", ".close", (e) => {
    let idx = $(e.target).attr('data-idx');
    uploadFiles[idx].upload = 'disable'; // 삭제된 항목은 업로드하지 않기 위해 플래그 생성
    $(e.target).parent().remove(); // 프리뷰 삭제
    
    // 썸네일 갯수 감소
    thumbnailCount--;
    if (thumbnailCount == 0) { // 드롭박스 안내문구 보이게
    	$('#drop').css({"font-size": "14px"});
    }
});

/* 상품정보 - 이미지 등록 끝 */

let clickCheck = false; // 중복클릭 방지

// 상품(경매) 등록 - 버튼눌렀을때(썸네일이미지 등록부터)
// 썸네일 이미지 등록을 완료하면 success에 있는 함수를 실행하여 DB등록을 한다
function productSubmit() {
	// 중복클릭이라면 함수 중지
	if(clickCheck) {
		return;
	}
	clickCheck = true; // 중복클릭 방지설정
	
	// 시작가, 즉사거래가 쉼표 없애기
	let purchase_price = $(".product--form [name='product_purchase_price']");
	let starting_price = $(".product--form [name='product_starting_price']");
	purchase_price.val(removeCommas(purchase_price.val()));
	starting_price.val(removeCommas(starting_price.val()));
	
	if (formCheck()) { // 양식에 대한 유효성 검사
		purchase_price.val(addCommas(purchase_price.val()));
		starting_price.val(addCommas(starting_price.val()));
		clickCheck = false; // 중복클릭 방지해제
		return;
	}
	
	let formData = new FormData(); 
    $.each(uploadFiles, (idx, file) => { // 이미지등록(썸네일)에 있는 파일들
        if (file.upload != 'disable') // 삭제하지 않은 이미지만 업로드 항목으로 추가
            formData.append('file', file);
    });
    
    $.ajax({ // 상품 등록전 썸네일에 올라온 이미지들을 업로드한다
        url: 'thumbnailsUpload.yb',
        data: formData,
        type: 'post',
        contentType: false,
        processData: false,
        // 이미지경로를 담은 배열을 파라미터로 넘기고 상품등록 진행
        success: (imgSrcList) => productInsert(imgSrcList),
        error: () => clickCheck = false // 중복클릭 방지해제
    });
};

// 양식에 대한 유효성 검사
function formCheck() {
	let category_2 = $('.category--select__02'); // 2차카테고리
	let subject = $('input[name=product_subject]'); // 상품제목
	let content = $('.note-editable'); // 상품내용
	let thumbnail = $('.thumb'); // 썸네일
	let starting_price = $('input[name=product_starting_price]'); // 경매시작가
	let bidding_unit = $('select[name=product_bidding_unit]'); // 입찰단위
	let transaction_area = $('input[name=product_transaction_area]'); // 거래가능지역
	let purchase_price = $('input[name=product_purchase_price]'); // 즉시구매가
	let delivery = $('input[name=product_delivery]:checked'); // 택배거래
	let direct = $('input[name=direct]:checked'); // 택배거래
	
	/* 유효성 검사 */
	// 2차카테고리
	if (!(category_2.length == 1 && category_2.val().startsWith('cate'))) {
		alert("카테고리를 선택해주세요");
		return true;
	} 
	// 상품 제목
	else if (subject.val().trim().length < 3) {
		alert("상품제목을 최소 세글자 이상 입력해주세요");
		return true;
	} 
	// 상품 내용
	else if (content.text().trim().length < 10) {
		alert("상품설명을 최소 열글자 이상 입력해주세요");
		return true;
	} 
	// 썸네일 갯수
	else if (thumbnail.length == 0) {
		alert("이미지 등록은 최소 한장이상 해주세요");
		return true;
	} 
	// 경매 시작가
	else if (starting_price.val() < 1000) {
		alert("경매 시작가는 최소 1,000원부터 입니다");
		return true;
	} 
	// 경매 시작가 100원 단위
	else if (starting_price.val().substr(-2) != '00') {
		alert("경매 시작가의 최소 단위는 100원입니다");
		return true;
	} 
	// 입찰 단위
	else if (bidding_unit.val() < 100) {
		alert("입찰 단위는 최소 100원부터 입니다");
		return true;
	} 
	// 직거래 가능지역
	else if (transaction_area.attr('readonly') == undefined
				&& transaction_area.val().trim().length < 2) {
		alert("직거래 가능지역을 입력해주세요");
		return true;
	} 
	// 즉시구매가
	else if (purchase_price.attr('disabled') == undefined
		&& purchase_price.val() < Number(starting_price.val()) + Number(bidding_unit.val())) {
		alert("최소 즉시구매가는 '경매 시작가 + 입찰단위가' 입니다");
		return true;
	} 
	// 즉시구매가 100원 단위
	else if (purchase_price.attr('disabled') == undefined
			&& purchase_price.val().substr(-2) != '00') {
		alert("즉시구매가의 최소 단위는 100원입니다");
		return true;
	}
	// 택배, 직거래 중 최소 1개 선택 여부
	else if (delivery.val() == 'none' && direct.val() == 0) {
		alert("택배거래와 직거래 중 최소 1개의 방법을 선택해주세요");
		return true;
	}
		
	// 유효성 검사 완료
	return false;
}

// 상품(경매) 등록 - DB저장
function productInsert(imgSrcList) {
	let formData = $('.product--form').serialize(); // 사용자가 입력한 내용
	$.each(imgSrcList, (idx, imgSrc) => { // 이미지등록(썸네일)에 있는 이미지
		formData += `&product_img_${idx + 1}=${imgSrc}`;
	})
	
	$.ajax({ // 상품 등록전 썸네일에 올라온 이미지들을 업로드한다
        url: 'productInsert.yb',
        type: 'post',
        data: formData,
        success: () => {
        	window.location.href = "selling.hs?page=1";
        	clickCheck = false; // 중복클릭 방지해제
        },
        error: () => clickCheck = false // 중복클릭 방지해제
    });
}

$('document').ready(() => {
    // 경매기간 초기값
    changeEndDate(1);

    // 썸머노트 가본설정
    $('#summernote').summernote({
        minHeight: 400,	// 최소 높이
        maxHeight: 800,	// 최대 높이
        lang: "ko-KR",	// 한글 설정
        disableDragAndDrop: true, // 드래그 앤 드롭 비활성화
        placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정

        callbacks: {
            onImageUpload: (files) => {
            	let summernote = $('#summernote');
                for (let i = files.length - 1; i >= 0; i--) {
                	editorImgUpload(files[i], summernote);
                }
            }
        }
    });
})
/* 상품등록 끝 by.유빈 */