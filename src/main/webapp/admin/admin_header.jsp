<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap">
    <link rel="stylesheet" href="resources/css/admin_header.css">

    <title>All-tion</title>
</head>
<body>
    <header class="flex-row">
        <h1>ALL-TION - Manager</h1>
        <a class="logout" href="logout.kj">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
        </a>
    </header>

    <nav>
        <ul class="sidebar flex-column">
        	<li onclick="location.href='adminHome.yb'">
                <i class="fas fa-home"></i>
                <span>홈으로</span>
            </li>
            <li onclick="location.href='adminMember.yb'">
                <i class="fas fa-address-card"></i>
                <span>회원 관리</span>
            </li>
            <li onclick="location.href='adminProduct.yb'">
                <i class="fas fa-folder-open"></i>
                <span>상품 관리</span>
            </li>
            <li onclick="location.href='adminTrading.yb'">
                <i class="fas fa-exchange-alt"></i>
                <span>거래 관리</span>
            </li>
            <li onclick="location.href='adminPay.yb'">
                <i class="fas fa-hand-holding-usd"></i>
                <span>결제 관리</span>
            </li>
            <li onclick="goKakaoTalk();">
                <i class="fas fa-comments"></i>
                <span>카카오톡 채널로 이동</span>
            </li>
        </ul>
    </nav>

    <!--  스크립트 영역  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/js/admin_header.js"></script>
</body>
</html>