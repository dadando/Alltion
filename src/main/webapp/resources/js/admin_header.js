/* admin_header by.유빈 */
// 카카오톡 채널 새탭으로 열기
function goKakaoTalk() {
    window.open("https://center-pf.kakao.com/_NIxgxoxb/dashboard");
}

$(() => {
	var nowPage = document.location.href.split("/alltion/");
    
	if (nowPage[1].startsWith('adminHome.yb')) {
		let li = $('.sidebar > li:nth-child(1)')
		li.find('i').css("color", "#e2e4e6");
		li.find('span').css("color", "#e2e4e6");
	} else if (nowPage[1].startsWith('adminMember.yb')) {
		let li = $('.sidebar > li:nth-child(2)')
		li.find('i').css("color", "#e2e4e6");
		li.find('span').css("color", "#e2e4e6");
	} else if (nowPage[1].startsWith('adminProduct.yb')) {
		let li = $('.sidebar > li:nth-child(3)')
		li.find('i').css("color", "#e2e4e6");
		li.find('span').css("color", "#e2e4e6");
	} else if (nowPage[1].startsWith('adminTrading.yb')) {
		let li = $('.sidebar > li:nth-child(4)')
		li.find('i').css("color", "#e2e4e6");
		li.find('span').css("color", "#e2e4e6");
	} else if (nowPage[1].startsWith('adminPay.yb')) {
		let li = $('.sidebar > li:nth-child(5)')
		li.find('i').css("color", "#e2e4e6");
		li.find('span').css("color", "#e2e4e6");
	}
})

/* admin_header 끝 by.유빈 */