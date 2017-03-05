<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/top-common.css" />
<title>Insert title here</title>
<script type="text/javascript">
	function message() {
		location.href="msgreadlist.j";
	}
</script>
	</head>
<body>
<div id="logo"></div>
<div id="serchbar">
	<input id="s" type="text" name="serch" placeholder="검색하기"/>
</div>
<div id="mylayout">
	<div id="message" onclick="message()"></div>
	<div id="allet"></div>
	<div id="my">${ loginUser.userId } <br/>님 정보보기</div>
</div>
</body>
</html>