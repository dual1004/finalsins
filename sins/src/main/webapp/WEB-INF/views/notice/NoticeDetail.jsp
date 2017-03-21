<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/notice/noticeDetail.css" />
<script>
	$(function(){
		if($("p").height() <= 500){
			$("p").css("height", "500px");
		}
	});
	
	
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
	}
</script>
<style type="text/css">
#noticeDetailTable{
	border-collapse : collapse;
	width : 600px;
	text-align: center;
	border-top : 3px solid;
	border-bottom : 3px solid;
}
#noticeDetailTable td{
	border-bottom : 1px solid;
}
#adminModifyBtn{
	width : 600px;
	text-align : right;
	margin-bottom : 10px;
}
#ftd {
	font-size : 16pt;
	font-weight : bold;
	background-color : #9581BF;
}
#std {
	text-align : left;
	font-size : 9pt;
	background-color : lightgray;
}
#std label {
	text-align : center;
	padding-right : 5px;
	font-weight : bold;
}
#ttd {
	font-size : 10pt;
	background-color : lightgray;
	text-align : left;
	
}
</style>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top">
			<c:import url="../common/top.jsp" charEncoding="UTF-8" />
		</div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
			<h2>LEFT</h2>
			<ul>
				<li><a href="alink.do?path=mypage/mypage">MyPage</a></li>
				<li><a href="alink.do?path=channelListView/channelList">채널</a></li>
				<li><a href="selectGroupList.y">그룹</a></li>
				<li><h4>뉴스피드</h4></li>
				<li id="notice">고객센터</li>
				<li class="notice"><a href="selectNotice.k">└공지사항</a></li>
	          	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
			</ul>
		</div>
		
		<div id="content" class="box">
			<strong id="titleFont">공지사항</strong>
			<div id="noticeDetailDiv">
				<br />
				<hr />
				<br />
				<c:if test="${loginUser.userId eq 'admin'}">
					<div id="adminModifyBtn">
						<button>수정하기</button>
					</div>
				</c:if>
				<table id="noticeDetailTable" style='text-align: center;'>
					<tr>
						<td id="ftd">
							<label id="title">${notice.title}</label>
						</td>	
					</tr>
					<tr>
						<td id="std" >
							작성자 : <label id="admin">관리자</label>
							조회수 : <label id="readCount">(${notice.readCount})</label>
							작성 날짜 :<label id="writeDate">${notice.writeDate}</label>
						</td>
					</tr>
					<tr><td id="ttd"><p id="contentP">${notice.content}</p></td></tr>
					
				</table>
				
				<br>
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