<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Q&A</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>

<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qnaMain.css" />
	<script>
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
		
	}
	
$(document).ready(function(){
		
	if(${not empty option}){
			if(option==1){
				$("#option1").prop("selected", true);
			}
			if(option==2){
				$("#option2").prop("selected", true);
			}
			if(option==3){
				$("#option3").prop("selected", true);
			}
		}
	
		
	});
	
	function search(){
		
		
		var option=$("#option").val();
		var keyword=$("#key").val();
		location.href="selectQna.n?keyword="+keyword+"&option="+option; 
	}
	
	
	</script>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"><%@include file="/WEB-INF/views/common/top.jsp"%></div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
			<h2>left</h2>
			<br>
			<ul>

			</ul>
		</div>
		<div id="content" class="box">

			<strong class="titleFont">Q&A</strong><br><br>
			<div id="qnaDiv">
				<hr />
				<br>
				<table id="qnaTable" style='text-align: center;' align="center">

					<tr>
						<th class='ths'>글번호</th>
						<th class='ths'>제목</th>
						<th class='ths'>작성자</th>
						<th class='ths'>조회수</th>
						<th class='ths'>작성일</th>
						<th class='ths'>답변상태</th>
					</tr>
					<c:forEach var="qna" items="${qnaList }">
						<tr>
							<td class='tds'>${qna.qnaNo }</td>
							<td class='tds'><a class="atag"
								href="detailQna.n?no=${qna.qnaNo }">${qna.title }</a></td>
							<td class='tds'><a class="atag"
								style='text-decoration: none;' href='#'>${qna.userId }</a></td>
							<td class='tds'>${qna.readCount }</td>
							<td class='tds'>${qna.writeDate }</td>
							<td class='tds'><c:if test="${qna.comCount gt 0}">
									<label style='font-color: red'>답변 완료</label>
								</c:if> <c:if test="${qna.comCount eq 0}">미답변</c:if></td>
						</tr>
					</c:forEach>




				</table>
				<br>
				<hr />

			</div>
			<button class="buttons" onclick="writeForm()">질문하기</button>

			<br>
			<br>

			<div id="pageSection" align="center">
			
				<a class="atag" href="<c:if test="${empty keyword }">selectQna.n?page=1</c:if>
				<c:if test="${not empty keyword }">selectQna.n?page=1&keyword=${keyword }&option=${option }</c:if>
				">[처음] </a>

				
					
				<c:if test="${currentPage gt 1 }">
					<a class="atag" href="
					<c:if test="${empty keyword }">selectQna.n?page=${currentPage - 1 }</c:if>
					<c:if test="${not empty keyword }">selectQna.n?page=${currentPage - 1 }&keyword=${keyword }&option=${option }</c:if>
					">[이전]
					</a>
				</c:if>
				<c:if test="${currentPage eq 1 }">[이전] </c:if>

				<c:forEach var="num" begin="${startPage }" end="${endPage }"
					step="1">

					<c:if test="${num eq currentPage }">
						<strong><b>${num }</b></strong>&nbsp;
	</c:if>
					<c:if test="${num ne currentPage }">
						<a class="atag" href="
						<c:if test="${empty keyword }">selectQna.n?page=${num }</c:if>
						<c:if test="${not empty keyword}">selectQna.n?page=${num }&keyword=${keyword }&option=${option }</c:if> 
						">${num }</a> &nbsp;
	</c:if>
				</c:forEach>



				<c:if test="${currentPage lt maxPage }">
					<a class="atag" href="
					<c:if test="${empty keyword }">selectQna.n?page=${currentPage + 1 }</c:if>
					<c:if test="${not empty keyword }">selectQna.n?page=${currentPage + 1 }&keyword=${keyword }&option=${option }</c:if>
					
					"> [다음] </a>
				</c:if>
				<c:if test="${currentPage eq maxPage }">[다음]
</c:if>

				<a class="atag" href="
				<c:if test="${empty keyword }">selectQna.n?page=${maxPage }</c:if>
				<c:if test="${not empty keyword }">selectQna.n?page=${maxPage }&keyword=${keyword }&option=${option }</c:if>
				"> [마지막]</a>
			</div>

<br><br>
	<div id = "search" align="center">
	
	
	<select id= "option">
	<option id = "option1" value="1" >전체</option>
	<option id = "option2" value="2">제목</option>
	<option id = "option3" value="3">내용</option>


	</select>
	
	
	<input id = "key" value="${keyword }" />
	
	<button onclick="search()">검색</button>
	</div>
	
</div>
		<div id="right" class="box">
			<h2>RIGHT</h2>
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>

			
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>