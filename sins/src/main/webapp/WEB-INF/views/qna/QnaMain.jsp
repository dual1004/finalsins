<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/sins/WEB-INF/common/js/jquery-3.1.1.min.js"></script>
<script>
$(function() {
	var loginUser= ${loginUser};

	if(loginUser==null){
		alert("로그인 후 이용해주세요.");
		location.href="로그인페이지";
	}
	
});

</script>

<title></title>
</head>
<body>

<div id = "qnaDiv">
<table id = "qnaTable">

<tr><th>No</th><th>Subject</th><th>name</th><th>Read</th><th>Date</th></tr>
<c:forEach var="qna" items="${qnaList }">
		<tr>
			<td>${qna.qnaNo }</td>
			<td>
				
				
				<c:if test="${not empty loginUser }">
					<a href="alink.do?path=#">${qna.title }</a>
				</c:if>
				
			</td>
			<td><a style='text-decoration:none; ' href='alink.do?path=#'>${qna.userId }</a></td>
			<td>${qna.writeDate }</td>
			<td>${qna.readCount }</td>
		</tr>
	</c:forEach>




</table>

</div>
<div id="pageSection" align="center">
<a href="page=1페이지로">[처음] </a> 

<c:if test="${startPage gt 1 }">
	<a href="page=${startPage - 1 }">[이전] </a> 
</c:if>
<c:if test="${startPage eq 1 }">[이전] </c:if>

<c:forEach var="num" begin="${startPage }" end="${endPage }" step="1">
	<c:if test="${num eq currentPage }">
		<strong><b><a href="page=${num }">${num }</a></b></strong>&nbsp;
	</c:if>
	<c:if test="${num ne currentPage }">
		<a href="page=${num }">${num }</a> &nbsp;
	</c:if>
</c:forEach>

<c:if test="${endPage lt maxPage }">
	<a href="page=${endPage + 1 }"> [다음] </a>
</c:if>
<c:if test="${endPage eq maxPage }">
	[다음]
</c:if>

<a href="page=${maxPage }"> [마지막]</a>
</div>

</body>
</html>