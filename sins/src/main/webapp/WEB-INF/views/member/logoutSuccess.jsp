<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그아웃 성공</title>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/email/email.css" />
 <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript">
	// 뒤로가기 버튼 막기
	history.pushState(null, null, location.href); 
	window.onpopstate = function(event) { 
		history.go(1); 
	}
</script>
</head>
<body>
<div id="main">
	<hr/>
	<br/><br/>
	<h2>정상적으로 로그아웃처리 되었습니다.</h2>
	<a href="alink.do?path=../../index">시작페이지로 가기</a>
	<br/>
	<br/>
	<br/>
	<hr/>
</div>
</body>
</html>