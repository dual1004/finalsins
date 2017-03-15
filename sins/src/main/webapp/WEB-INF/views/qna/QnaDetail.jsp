<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Q&A</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>

<script src="/sins/resources/js/qna/qna.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qnaDetail.css" />
<script>




	$(document).on(
			"click",
			"#submitBtn",
			function() {

				var comment = $("#comment").val();

				if (comment.length != 0) {

					$.ajax({

						url : 'insertCom.n?qnaNo=${qna.qnaNo}&lev=0&content='
								+ comment,

						dataType : 'json',

						contentType : 'application/json; charset=utf-8',

						success : function(result) {

							var tag = "";

							tag += "<br/><table style='margin-left: 50px;'>";

							for (var i = 0; i < result.comList.length; i++) {

								tag += "<tr><td>" + result.comList[i].userId
										+ "</td><td>"
										+ result.comList[i].content + "</td>";

								/* tag+="<td>";
								
									if( ${loginUser} == result.comList[i].userId){
									tag+="<a href='comDelete.n?qNo="+result.comList[i].qnaNo+"&comNo="+result.comList[i].commentNo+">삭제하기</a>";
											
									tag+="</td></tr>";
								
									
									} */

							}

							tag += "</table>";

							$("#comLocation").html(tag);

							$("#comment").val("");

						}

					});

				} else {
					alert("댓글을 입력해주세요.");
				}

			});
	
	
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
		
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
			<strong class="titleFont"><a href="selectQna.n" class="atag">Q&A</a></strong><br>
			<br>

			<div id="detailDiv">
				<h2>
					<strong>${qna.title }</strong>
					<button style='left: 530px;' class="buttons" onclick="writeForm()">질문하기</button>


				</h2>
				<br>
				<hr />

				<label style="left: 400px;" class="labels">작성일 :
					${qna.writeDate }</label> <label style="left: 420px;" class="labels">조회수
					: ${qna.readCount }</label> <br>
				<hr />
				<br>
				<table>
					<tr>
						<td><a href="#"><img src="${qna.userProfile }" style='width:50px;height:50px;'></a></td>
						<td>${qna.content }</td>
					</tr>
					<tr>
					<td></td>
					<td><img src="${pageContext.request.contextPath}/resources/file/${loginUser.userId}/${qna.filepath}" style='width:300px; height:300px;'></td>
					
					
					
					</tr>
					
					<tr>
						<td></td>
						<td><br>이름 or 아이디 : ${qna.userId }</td>
					</tr>
				</table>
				<br>
				<hr />

				<strong>답변</strong> <br>

				<div id="comLocation">

					<c:if test="${empty commentList }">
						<label style='margin: 200px;'>등록된 답변이 없습니다</label>

					</c:if>


					<table style='margin-left: 50px;'>



						<c:forEach var="comment" items="${commentList}">

							<tr>
								<td>${comment.userId }</td>
								<td>${comment.content }</td>
								<td><c:if test="${loginUser.userId eq comment.userId }">
										<a
											href="comDelete.n?qNo=${qna.qNo }&comNo=${comment.commentNo}">삭제하기</a>
									</c:if></td>
							</tr>


						</c:forEach>

					</table>

				</div>
				<hr />


				<div id="comForm">
					<label class="labels" style='font-size: 15px; margin: 30px;'><strong>답글</strong></label>
					<textarea id="comment" rows="4" cols="50"
						style="overflow: hidden; float: left; margin-top: 20px;"></textarea>


					<button id="submitBtn" style='left: 80px; margin-top: 20px;'
						class="buttons">등록하기</button>


				</div>
				<hr />




			</div>


		</div>
		<div id="right" class="box">
			
			
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