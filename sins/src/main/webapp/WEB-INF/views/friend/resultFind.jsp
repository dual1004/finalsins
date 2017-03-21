<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML> 
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/friend/friend-common.css" />
<style>
.no_underline {
	text-decoration: none;
}
.link{

	color:blue;
	font-size:8pt;
}

.link:hover{
	text-decoration:under_line;
}

#content {
	width: 600px;
	height: 660px;
	padding: 20px;
	margin-left: 20px;
	float: left;
	background-color: white;
	overflow: auto;
}


#container {
	width:1120px;
	height: 770px;
	margin: 0px auto;
	background-color: #E7E4F9;
}


#left{
width: 200px;
}






</style>

<script>


$(document).on("click", ".addBtn", function(){
	
	var resId= $(this).val();
	

	
	
	$.ajax({

		url : 'addFriend.n?resId='+resId,

		dataType : 'json',
		
		contentType : 'application/json; charset=utf-8',

		success : function(result) {
			
			
				
				
				
			
		}
	
		
	}); 
	
	$(this).text("친구 요청을 보냈습니다.");
	
});


</script>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
 		<div id="top"></div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box" >
		
			
			<%@include file="/WEB-INF/views/friend/friendFind.jsp" %>
			
		</div>
		<div id="content" class="box">



			<label class="font10pt">친구 검색 결과</label>
			<br><br>
			<hr>
			<br>
			<c:if test="${not empty resultList }">
			
			
			 <c:forEach var="member" items="${resultList }">
			
				<div id="friendDiv" >
				<a class="no_underline" href="#" style='margin-left:50px;'>
				<img src="${member.userProfile }" style='width: 80px; height: 80px;' />&nbsp;
					${member.userName }</a>
					<c:if test="${not empty viewAddress }">
					&nbsp; <label class="font8ptGray">${member.address } 거주</label>
					</c:if>
					
					
				
				
				
					<button class= 'addBtn' value="${member.userId }" style='margin-left:170px; '>친구 요청</button>
						 
					
					
					<br>
					</div>
			<br><hr><br>
			</c:forEach> 
	</c:if>
	<c:if test="${empty resultList }">
		<br><br><label class="font10pt" style='margin-left:170px;'>조건을 만족하는 결과가 없습니다.</label>
	</c:if>
	
			



			

		</div>











		<div id="right" class="box">
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp"%>


		</div>
	</div>

	<div id="spot1"></div>
	<div id="spot2"></div>
	<div id="spot">
	<div id="spot3"></div>
	<div id="spot4"><%@include
			file="/WEB-INF/views/common/top.jsp"%></div>
	<div id="spot5"></div>
	</div>
</body>

<footer>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</footer>
</html>