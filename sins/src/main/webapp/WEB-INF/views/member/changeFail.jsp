<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 실패</title>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/email.css" />
</head>
<body>
<div id="main">
	<hr/>
	<br/>
	<h2>${message} 를 실패하셨습니다. 다시 시도해주십시오.</h2>
	<a href="alink.do?path=member/myInfo">마이페이지로 가기</a>
	<br/>
	<br/>
	<br/>
	<hr/>
</div>
</body>
</html>