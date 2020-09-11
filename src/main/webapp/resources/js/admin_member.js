/* admin_member 시작 by.유빈 */

let updateFormStatus = false;

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
	getAdminMemberDate(1);
})

$(document).on('click','.listSearch--sendSearchBtn', () => {
    if (searchFormCheck()) {
        return;
    }
    
    getAdminMemberDate(1);
});

function getAdminMemberDate(page) {
	LoadingWithMask(); // 로딩화면 실행
	
    let formData = $('#searchForm').serialize();
    formData += "&page=" + page;
	
    $.ajax({
        url : "getAdminMemberDate.yb",
        data : formData,
        dataType :"json",
        success : (adminMemberDate) => {
        	writeMemberList(adminMemberDate.memberList);
        	writeMemberCount(adminMemberDate.listcount);
        	writePageInfo(adminMemberDate.pagination);
        	closeLoadingWithMask(); // 로딩화면 종료
    	},
        error : () => {
        	closeLoadingWithMask(); // 로딩화면 종료
        	updateFormStatus = false;
        }
    });
}

function searchFormCheck() {
    const phoneRegexp = /^[0-9]*$/;
    let searchPhone = $('input[name="adminMemberPhone"]').val();
    if(!phoneRegexp.test(searchPhone)) {
        alert("연락처에는 숫자만 입력해주세요");
        return true;
    }

    let v_startDate = $('input[name="adminMemberStartDate"]').val();
    let v_endDate = $('input[name="adminMemberEndDate"]').val();
    
    if (v_startDate.length > 0 ? v_endDate.length == 0 : false) {
    	alert("가입기간의 날짜를 전부 입력해주세요");
        return true;
    }
    
    if (v_endDate.length > 0 ? v_startDate.length == 0 : false) {
    	alert("가입기간의 날짜를 전부 입력해주세요");
        return true;
    }
    
    let startDate = new Date(v_startDate);
    let endDate = new Date(v_endDate);
    let subtractDate = endDate - startDate;
    if (subtractDate < 0) {
        alert("가입기간의 시작하는 날짜는 끝나는날짜보다 빨라야 합니다");
        return true;
    }

    return false;
};

function writeMemberList(memberList) {
	let adminMemberTable = "";
	
	adminMemberTable += `
		<tr class="list--tableHeader">
	        <th style="width:15%">아이디</th>
	        <th style="width:15%">이름</th>
	        <th style="width:20%">이메일</th>
	        <th style="width:15%">연락처</th>
	        <th style="width:10%">계정상태</th>
	        <th style="width:15%">가입일</th>
	        <th style="width:10%">수정</th>
	    </tr>`;
	
	$.each(memberList, (idx, vo) => {
		adminMemberTable += `
			<tr>
	            <td class="tdCenter">${vo.member_id}</td>
	            <td class="tdCenter">${vo.member_name}</td>
	            <td class="tdCenter">${vo.email}</td>
	            <td class="tdCenter">${vo.member_phone}</td>`;
		
		if (vo.member_delete == 0 && vo.member_manager == 0) {
			adminMemberTable += `
				<td class="tdCenter">정상</td>`;
		} else if (vo.member_delete == 1 && vo.member_manager == 0) {
			adminMemberTable += `
				<td class="tdCenter">탈퇴</td>`;
		} else if (vo.member_manager == 1) {
			adminMemberTable += `
				<td class="tdCenter">관리자</td>`;
		}
		
		adminMemberTable += `
	            <td class="tdCenter">${vo.member_date}</td>
	            <td class="flex-row list--update">
	                <button class="list--changeUpdateFormBtn" type="button">수정</button>
	            </td>
	        </tr>`;
	});
	
	$('.list--table').html(adminMemberTable);
}

function writeMemberCount(listcount) {
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
	
	getAdminMemberDate(page);
});

let originData = [];

$(document).on('click','.list--changeUpdateFormBtn', function() {
    if (updateFormStatus) {
        alert("수정은 한개의 데이터씩 가능합니다");
        return;
    }
    updateFormStatus = true;

    let tr = $(this).closest('tr');

    for(let i = 0; i < 6; i ++) {
        originData.push(tr.children().eq(i).html());
    }

    let updateFormOutput = `
        <td class="tdCenter">${originData[0]}</td>
        <td class="tdCenter"><input type="text" value="${originData[1]}"></td>
        <td class="tdCenter"><input type="text" value="${originData[2]}"></td>
        <td class="tdCenter"><input type="text" value="${originData[3]}"></td>
        <td class="tdCenter">
            <select>`;

    if (originData[4] == "정상") {
        updateFormOutput += `
            <option value="0" selected>정상</option>
            <option value="1">탈퇴</option>
            <option value="2">관리자</option>`;
    } else if (originData[4] == "탈퇴") {
        updateFormOutput += `
            <option value="0">정상</option>
            <option value="1" selected>탈퇴</option>
            <option value="2">관리자</option>`;
    } else {
        updateFormOutput += `
            <option value="0" selected>정상</option>
            <option value="1">탈퇴</option>
            <option value="2" selected>관리자</option>`;
    }

    updateFormOutput += `
            </select>
        </td>
        <td class="tdCenter">${originData[5]}</td>
        <td class="flex-row list--update">
            <button class="list--updateBtn" type="button">수정</button>
            <button class="list--cancelUpdateFormBtn" type="button">취소</button>
        </td>`;

    tr.html(updateFormOutput);
});

$(document).on('click','.list--cancelUpdateFormBtn', function() {
    let tr = $(this).closest('tr');

    let updateFormOutput = `
        <td class="tdCenter">${originData[0]}</td>
        <td class="tdCenter">${originData[1]}</td>
        <td class="tdCenter">${originData[2]}</td>
        <td class="tdCenter">${originData[3]}</td>
        <td class="tdCenter">${originData[4]}</td>
        <td class="tdCenter">${originData[5]}</td>
        <td class="flex-row list--update">
            <button class="list--changeUpdateFormBtn" type="button">수정</button>
        </td>`;

    tr.html(updateFormOutput);

    originData = [];
    updateFormStatus = false;
});

$(document).on('click','.list--updateBtn', function() {
    let tr = $(this).closest('tr');

    let updateData = [];

    for(let i = 0; i < 5; i ++) {
    	if (i == 0) {
    		updateData.push(tr.children().eq(i).html());
    	} else {
        	updateData.push(tr.children().eq(i).children().val());
    	}
    }

    let formData = "";
    formData += "adminMemberId=" + updateData[0];
    formData += "&adminMemberName=" + updateData[1];
    formData += "&adminMemberEmail=" + updateData[2];
    formData += "&adminMemberPhone=" + updateData[3];
    formData += "&adminMemberStatus=" + updateData[4];

    $.ajax({
        url : "adminMemberUpdate.yb",
        data : formData,
        success : () => {updateComplete(updateData, tr)},
        error : () => {}
    });
});

function updateComplete(updateData, tr) {
	for (let i = 1; i < 5; i++) {
		if (i == 4) {
			if (updateData[i] == 0) {
				tr.children().eq(i).html("정상");
			} else if (updateData[i] == 1) {
				tr.children().eq(i).html("탈퇴");
			} else if (updateData[i] == 2) {
				tr.children().eq(i).html("관리자");
			}
		} else {
			tr.children().eq(i).html(updateData[i]);
		}
	}
	
	let changeBtn = `
        <button class="list--changeUpdateFormBtn" type="button">수정</button>`;
	
	tr.children().eq(6).html(changeBtn);
	
	originData = [];
	updateFormStatus = false;
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

/* admin_member 끝 by.유빈 */