/* admin_home by.유빈 */

$(() => {
	LoadingWithMask(); // 로딩화면 실행
	
    $.ajax({
        url : "getAdminHomeData.yb",
        dataType :"json",
        success : (adminHomeData) => {
        	setMainConut(adminHomeData);
        	dailyAuction(adminHomeData.dailyAuctionList);
        	cateCountChart(adminHomeData.cateCountList);
        	dailySubscribersChart(adminHomeData.dailySubscribersList);
        	closeLoadingWithMask(); // 로딩화면 종료
        },
        error : () => {
        	closeLoadingWithMask(); // 로딩화면 종료
        }
    });
})

function setMainConut(adminHomeData) {
	let countDataArr = [];
	
	countDataArr.push(adminHomeData.memberCount);
	countDataArr.push(adminHomeData.productCount);
	countDataArr.push(adminHomeData.tradingCount);
	countDataArr.push(adminHomeData.bidCount);
	countDataArr.push(adminHomeData.paySum);
	
	for (let i = 0; i < countDataArr.length; i++) {
		countDataArr[i] = addCommas(countDataArr[i]);
	}
	
	$('.memberCount').html(countDataArr[0]);
	$('.productCount').html(countDataArr[1]);
	$('.tradingCount').html(countDataArr[2]);
	$('.bidCount').html(countDataArr[3]);
	$('.paySum').html(countDataArr[4]);
}

function addCommas(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g,  ",");
}

// 최근 일주일 경매등록수
function dailyAuction(dailyAuctionList) {
	c3.generate({
	    bindto: '.dailyAuction--chart',
	    data: {
	        x : 'x',
	        columns: [
	            ['x', 'D-7', 'D-6', 'D-5', 'D-4', 'D-3', 'D-2', 'D-1'],
	            ['dailyAuction', 
            	dailyAuctionList[0], 
            	dailyAuctionList[1], 
            	dailyAuctionList[2],
            	dailyAuctionList[3],
            	dailyAuctionList[4], 
            	dailyAuctionList[5], 
            	dailyAuctionList[6]
	            ]
	        ],
	        types: {
	            'dailyAuction': 'area'
	            // 'line', 'spline', 'step', 'area', 'area-step' are also available to stack
	        },
	        names: {
	            dailyAuction: '일일 경매등록수'
	        },
	        colors: {
	            dailyAuction: '#00b9f1'
	        }
	    },
	    axis: {
	        x: {
	            type: 'category' // this needed to load string x value
	        }
	    },
	    padding: {
	        top: 20,
	        right: 50,
	        bottom: 20,
	        left: 50,
	    },
	    legend: {
	        show: false
	    }
	});
}


// 카태고리별 상품수
function cateCountChart(cateCountList) {
	c3.generate({
	    bindto: '.cateCount--chart',
	    data: {
	        columns: [
	            ['cate01', cateCountList[0]],
	            ['cate02', cateCountList[1]],
	            ['cate03', cateCountList[2]],
	            ['cate04', cateCountList[3]],
	            ['cate05', cateCountList[4]],
	            ['cate06', cateCountList[5]],
	            ['cate07', cateCountList[6]],
	            ['cate08', cateCountList[7]],
	            ['cate09', cateCountList[8]],
	            ['cate10', cateCountList[9]],
	            ['cate11', cateCountList[10]],
	            ['cate12', cateCountList[11]]
	        ],
	        names: {
	            cate01: '패션',
	            cate02: '뷰티',
	            cate03: '출산/유아동',
	            cate04: '전자기기',
	            cate05: '가전제품',
	            cate06: '가구/인테리어',
	            cate07: '반려동물/취미',
	            cate08: '도서/음반/문구',
	            cate09: '티켓/쿠폰',
	            cate10: '스포츠',
	            cate11: '공구/산업용품',
	            cate12: '기타잡화'
	        },
	        colors: {
	            cate01: '#1f77b4',
	            cate02: '#ff7f0e',
	            cate03: '#2ca02c',
	            cate04: '#d62728',
	            cate05: '#9467bd',
	            cate06: '#8c564b',
	            cate07: '#e377c2',
	            cate08: '#7f7f7f',
	            cate09: '#bcbd22',
	            cate10: '#17becf',
	            cate11: '#1fb492',
	            cate12: '#d22c9f'
	        },
	        type : 'pie'
	    },
	    padding: {
	        top: 20,
	        bottom: 20
	    },
	    legend: {
	        position: 'right'
	    }
	});
}

// 최근 일주일 가입자수
function dailySubscribersChart(dailySubscribersList) {
	c3.generate({
	    bindto: '.dailySubscribers--chart',
	    data: {
	        x : 'x',
	        columns: [
	            ['x', 'D-7', 'D-6', 'D-5', 'D-4', 'D-3', 'D-2', 'D-1'],
	            ['dailySubscribers', 
            	dailySubscribersList[0], 
            	dailySubscribersList[1], 
            	dailySubscribersList[2], 
            	dailySubscribersList[3], 
            	dailySubscribersList[4], 
            	dailySubscribersList[5],
            	dailySubscribersList[6]
            	]
	        ],
	        names: {
	            dailySubscribers: '일일 가입자'
	        },
	        type: 'bar',
	        colors: {
	            dailySubscribers: '#ff7f0ebb'
	        }
	    },
	    axis: {
	        x: {
	            type: 'category' // this needed to load string x value
	        }
	    },
	    padding: {
	        top: 20,
	        right: 50,
	        bottom: 20,
	        left: 50,
	    },
	    legend: {
	        show: false
	    }
	});
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

// 로딩화면 해제
function closeLoadingWithMask() {
    $('#mask, #loadingImg').remove(); 
}

/* admin_home 끝 by.유빈 */