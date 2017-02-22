<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<style>
.atag{
text-decoration:none;
}

</style>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
<script>
/* $(function() {
	var loginUser= ${loginUser};

	if(loginUser==null){
		alert("로그인 후 이용해주세요.");
		location.href="로그인페이지";
	}
	
}); */

</script>

<title></title>
</head>
<body>

<div id = "qnaDiv">
<table id = "qnaTable" style='text-align:center; ' align="center">

<tr><th>No</th><th>Subject</th><th>name</th><th>Read</th><th>Date</th></tr>
<c:forEach var="qna" items="${qnaList }">
		<tr>
			<td>${qna.qnaNo }</td>
			<td>
				
				
				
					<a class= "atag" href="detailQna.n?no=${qna.qnaNo }">${qna.title }</a>
				
				
			</td>
			<td><a class= "atag" style='text-decoration:none; ' href='#'>${qna.userId }</a></td>
			<td>${qna.readCount }</td>
			<td>${qna.writeDate }</td>
			
		</tr>
	</c:forEach>




</table>

</div>

<br><br>
<div id="pageSection" align="center">
<a class = "atag"  href="selectQna.n?page=1">[처음] </a> 

<c:if test="${startPage gt 1 }">
	<a class = "atag"  href="selectQna.n?page=${startPage - 1 }">[이전] </a> 
</c:if>
<c:if test="${startPage eq 1 }">[이전] </c:if>

<c:forEach var="num" begin="${startPage }" end="${endPage }" step="1">
	<c:if test="${num eq currentPage }">
		<strong><b>${num }</b></strong>&nbsp;
	</c:if>
	<c:if test="${num ne currentPage }">
		<a class = "atag"  href="selectQna.n?page=${num }">${num }</a> &nbsp;
	</c:if>
</c:forEach>

<c:if test="${endPage lt maxPage }">
	<a class = "atag"  href="selectQna.n?page=${endPage + 1 }"> [다음] </a>
</c:if>
<c:if test="${endPage eq maxPage }">
	[다음]
</c:if>

<a class = "atag"  href="selectQna.n?page=${maxPage }"> [마지막]</a>
</div>

</body>
</html>