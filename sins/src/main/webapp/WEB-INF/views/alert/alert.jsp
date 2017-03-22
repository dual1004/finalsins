<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/sins/resources/js/alert/alert.js"></script>
<style type="text/css">
#iframe{
	width : 100%;
	height: 100%;
}
</style>
<body>
<iframe id="iframe" src="http://localhost:9999/sins/newsfeed.jsp">
</iframe>
</body>
</html>