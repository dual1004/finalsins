<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/friend/friend-common.css" />
<style>


.no_underline{
text-decoration:none;

}
</style>
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

			<div id = "requestDiv">
			
			<c:if test="${not empty requestCount }">
			<label class="font1">${requestCount }개의 친구요청이 있습니다.</label><br>
			<label class="font2"><a class="no_underline" href="#">내가 전송한 요청보기</a></label><br>
			
			
			<br>
			<hr><br>
			
			<c:forEach var="friend" items="${reqList }" >
			
			<a class="no_underline" href="#"> <img src="${friend.userProfile }" style='width:80px; height:80px;'/> 
			${friend.userName}</a>
			
			<div style='position:relative; float:left; left:500px; top:65px;'>
			<a class="no_underline" href="#">수락</a>
			 <a class="no_underline" href="#">거절</a>
			</div>
			<br><br><hr>
			<br>
			
			</c:forEach> 
			
			</c:if>
			
			<c:if test = "${empty requestCount }">
			<label style='margin: 200px;'>친구 요청이 없습니다. <a class="no_underline" href="#">친구를 찾아보세요.</a></label>
			</c:if>
			
			</div>
			
			<div id= "recommendDiv">
				<label class="font1">알수도 있는 친구</label>
				
			</div>
			
			</div>
			<br>
			<hr>
			<br>
		
			
		
			
		
	
	

	
		
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