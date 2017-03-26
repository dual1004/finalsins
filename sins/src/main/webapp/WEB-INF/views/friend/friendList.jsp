<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML> 
<html>
<head>
<meta charset="UTF-8">
<title>SINS</title>
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

#FriendTable{
width:100%;
border-spacing:0px;
}
.friendTds{
padding-top:10px;
padding-bottom:10px;
border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;
text-align:left;

}

.nameLink{
color:#9581BF;
cursor:pointer;
}
.nameLink:hover{

text-decoration:underline;
}
.addBtn{
background:white;
outline:0;
border:0;
color:#9581BF;
}



</style>


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



			<label class="font10pt">친구 목록</label>
			<br><br>
			<hr>
			<br>
			<c:if test="${not empty friendList }">
			
			<table id="FriendTable">
			<tbody>
			 <c:forEach var="member" items="${friendList }">
			
			<tr>
			<td class="friendTds" onclick="location.href='mypage2.b?userid=${member.userId}'" style='width:20%; padding-left:20px;'><img class="nameLink" src="${pageContext.request.contextPath}/resources/file/${member.userId}/${member.userProfile }" style='width: 80px; height: 80px;' /></td>
			<td class="friendTds" style='width:80%;'><label class="nameLink" onclick="location.href='mypage2.b?userid=${member.userId}'" > ${member.userName }</label>
			
			
			</td>
			
			
			</tr>
				
		
			</c:forEach> 
			</tbody>
			</table>
	</c:if>
	<c:if test="${empty friendList }">
		<br><br><label class="font10pt" style='margin-left:200px;'>친구가 없습니다</label>
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