<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/admin/adminPage.css" />
    <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript">
$( document ).ready(function() { 
    $('#t-l').click(function(){ 
     	$('#spot1, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot1, #overlay_t').hide(); 
	});
 	$('#t-r').click(function(){ 
     	$('#spot2, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot2, #overlay_t').hide(); 
	});
 	
 	//영구 정지 버튼 클릭시
 	$(document).on("click", ".stop", function(){
 		var th = $(this);
 		var userId = th.parent().prev().prev().children(".userId").text();
 		$.ajax({
 			url : "banTimePlus.k?userId="+userId,
 			type : "post",
 			success : function(data){
 				if(data == 1){
 					th.parent().prev().children().text("정지 시간 : 영정");
 					th.prop("disabled", "disabled");
 					th.next().removeAttr("disabled");
 				}
 				else {
 					alert("실패");
 				}
 			}
 		})
 	});
 	
 	//영구 정지 취소 버튼 클릭시
 	$(document).on("click", ".cancle", function(){
 		var th = $(this);
 		var userId = th.parent().prev().prev().children(".userId").text();
 		$.ajax({
 			url : "banTimeMinus.k?userId="+userId,
 			type : "post",
 			success : function(data){
 				if(data == 1){
 					th.parent().prev().children().text("정지 시간 : 없음");
 					th.prop("disabled", "disabled");
 					th.prev().removeAttr("disabled");
 				}
 				else {
 					alert("실패");
 				}
 			}
 		})
 	});
 	
 	$(".comOut").click(function(){
 		var th = $(this);
 		var userId = th.parent().prev().prev().prev().children(".userId").text();
 		
 		$.ajax({
 			url : "memberDelete.k?userId="+userId,
 			type : "post",
 			success : function(data){
 				if(data == 1){
 					th.parent().parent().remove();
 				}
 			}	
 		})
 	});
 	

 	
});
</script>
<style type="text/css">
	.profile {
		width : 50px;
		height : 50px;
	}
	.idAndName{
		width : 240px;
	}
	.time {
		width : 117px;
	}
	.btn {
		width : 60px;
	}
	.imgmy {
		width : 50px;
		height : 50px;
	}
	.userId {
		margin-left : 10px;
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
      	<div id="left" class="box">
        	<h2>LEFT</h2>
	        <ul>
	          <li><a href="alink.do?path=admin/adminPage">회원 관리</a></li>
	          <li><a href="#">채널 관리</a></li>
	          <li><a href="#">그룹 관리</a></li>
	          <li><a href="fireList.k">신고 관리</a></li>
	          
	          
	          <li><a href="brodcasting.j">채팅</a></li>
	        </ul>
      	</div>
		<div id="content" class="box">
	        <table id="memberTable">
	        	<c:forEach var="member" items="${allMember }">
	        		<tr >
	        			<td class="profile">
				        	<img class="imgmy" src="/sins/resources/file/${member.userId }/${member.userProfile}" />
	        			</td>
	        			<td class="idAndName">
	        				<label class="userId">${member.userId }</label>&nbsp;<label class="userName">${member.userName }</label>
	        			</td>
	        			<td class="time">
	        				<label class="banTime">정지 시간 : ${member.banTime }</label>
	        			</td>
	        			<td class="plusTime">
	        				<c:set var="mo" value="없음"/>
	        				<c:if test="${member.banTime eq mo }">
	        					<input type="button" value="영정" class="stop"/>&nbsp; <input type="button" value="취소" class="cancle" disabled/>
	        				</c:if> 
	        				<c:if test="${member.banTime ne mo }">
	        					<input type="button" value="영정" class="stop"/>&nbsp; <input type="button" value="취소" class="cancle" />
	        				</c:if>
	        			</td>
	        			<td class="btn">
	        				<input type="button" value="탈퇴" class="comOut" />
	        			</td>
	        		</tr>
	        		
	        	</c:forEach>
	        </table>
	        
		</div>
    	<div id="right" class="box">
      		<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
    	</div>
   	</div>
 	<div id="footer">
    	<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
  	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
	<div id="spot">
	<div id="spot3"></div>
	<div id="spot4"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
	<div id="spot5"></div>
	</div>
</body>
</html>