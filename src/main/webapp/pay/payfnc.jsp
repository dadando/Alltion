<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<% 
	String buyer = (String)request.getParameter("buyer_name");
	String money = (String)request.getParameter("amount");
	
	System.out.println("buyer: " + buyer);
	System.out.println("money: " + money);
%>

<!doctype html>

<html>
<head>
<meta charset="utf-8" />

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function makeid() {
	  var text = "";
	  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	  for (var i = 0; i < 9; i++)
	    text += possible.charAt(Math.floor(Math.random() * possible.length));

	  return text;
	}
	var id = makeid();
</script>
<script>
    $(function() {
        var IMP = window.IMP;
        var code = "imp42790723"; // 가맹점 식별코드
        IMP.init(code);

        // 결제요청
        IMP.request_pay({
            // name과 amount만 있어도 결제 진행가능
            pg : 'kakao', // pg 사 선택(kakao, kakaopay 둘다 가능)
            pay_method : 'card',
            //merchant_uid : 'merchant_' + new Date().getTime(),
            merchant_uid : id, // 주문번호.. 취소할때 이 값이 필요
            name : 'e머니', // 상품명
            amount : '<%=money%>',
            //buyer_email : 'minseok2709@naver.com',
            buyer_name : '<%=buyer%>',
            //buyer_tel : '010-9094-2709'
            // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
            //m_redirect_url : 'https://localhost:8080/payments/complete' / 
        }, function(rsp) {
            if ( rsp.success ) { // 결제 성공시 
                var msg = '결제가 완료되었습니다. ';
                //msg += '고유ID : ' + rsp.imp_uid;
                //msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액은 ' + rsp.paid_amount + '입니다. ';
                msg += '결제주문번호는 ' + rsp.merchant_uid +'입니다. 해당 주문번호는 환불요청 시에 필요하니 기억해주시기 바랍니다.';
                
                var payVO = { 
                pay_merchant_uid : rsp.merchant_uid, //주문번호...상품번호로 대체
                //name : rsp.name,  //결제상품명
                pay_amount : rsp.paid_amount,   //금액
                pay_status : rsp.status, // 결제상태
     	  		pay_id: rsp.buyer_name,   //아이디
                }

                //post로 payVO객체의 내용을 전달해야한다............
                $.ajax({
                	url : '/alltion/getSuccessData.bo',
                	type : 'POST',
                	data : payVO,
                	contentType : 'application/x-www-form-urlencoded; charset=utf-8',
                	dataType : "json",
                	success: function(retVal){
                		console.log('성공');
                	},
                	error: function(){
                		console.log('실패');
                	}
            	});

            }
            else { // 결제 실패시
                var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
            }
            alert(msg);
            location.href='./pay.ms';
        });
    });

    </script>

</head>
<body>

</body>
</html>