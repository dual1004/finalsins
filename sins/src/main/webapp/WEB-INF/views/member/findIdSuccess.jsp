<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기 완료</title>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/email.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
</head>
<body>
<div id="main">
	<hr/>
	<br/>
	<h2>${member.userName}님의 아이디는  <label style="font-weight : 'bold'">${member.userId}</label> 입니다!</h2>
	<a href="index.jsp">로그인 하러 가기</a>
	<br/>
	<br/>
	<br/>
	<hr/>
</div>
</body>
</html>