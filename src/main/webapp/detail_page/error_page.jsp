<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>All-tion</title>
    <link rel="shortcut icon" type="image⁄x-icon" href="./resources/img/header/logo.jpg">
    <link rel="stylesheet" href="./resources/css/error_page.css">
    
</head>    
<body  style="background-image: url(./resources/img/error_page/error_page1.gif); background-size:cover; background-repeat:no-repeat;">
	<div class="main_body">
        <div class="sub_body" align="center">
            <h1><span>!</span></h1>
            <h1 style="font-style:italic">페이지를 <font style="color:cornflowerblue">찾을 수 없습니다.</font></h1>
            <p style="border-bottom: thin solid darkgray;">
                방문하시려는 페이지의 주소가 잘못 입력되었거나, <br>
                페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다. <br>
                입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
            </p>
            <p>
                관련 문의사항은 <a href="#">고객센터</a>에 알려주시면 친절히 안내해드리겠습니다.&nbsp; 감사합니다.
            </p>
            <a type="button" href="javascript:history.back();">이전 페이지로</a><a type="button" href="/alltion/">홈으로 돌아가기</a>
        </div>
    </div>
</body>
</html>