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
 	
 	$("#fireCommentList").click(function(){
 		location.href = "fireCommentList.k";
 	});
	
 	$(document).on("click", ".deleteBtn", function(){
 		var classify = $(this).next().val();
 		var no = $(this).next().next().val();
 		
 		var th = $(this).parent().parent();
 		
 		$.ajax({
 			url : "contentDelete.k",
 			type : "post",
 			data : { "classify" : classify, "no" : no },
 			success : function(result){
 				th.text("");
 				th.prev().text("");
 				th.prev().prev().text("");
 				th.prev().prev().prev().text("");
 			}
 		})
 		
 	});
 	
});
</script>
<style type="text/css">
	#content {
		text-align : center;
	}
	.tap {
		font-size : 14pt;
		font-weight : bold;
		width : 120px;
		display : block;
		float : left;
	}
	#fireContentList {
		margin-left : 180px;
		border-right : 1px solid gray;
		background-color : #9581BF;
	}
	#fireContent {
		width : 600px;
	}
	.imgmy {
		width : 50px;
		height : 50px;
	}
	
	#writerChannel {
		width : 100%;
	}
	.writerChannel {
		width : 60%;
		margin : auto;
	}
	.img{
		width : 50px;
		height : 50px;
	}
	.userid {
		text-align : left;
	}
	.writedate {
		text-align : left;
	}
	.content {
		text-align : left;
	}
	.btn {
		text-align : right;
	}
	.writeList{
		overflow : hidden;
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
	       	<label class="tap" id="fireContentList">게시물 신고</label><label class="tap" id="fireCommentList">댓글 신고</label>
	       	<br/>
	       	<br/>
	       	<br/>
	       	<div id="fireContent">
	       		<div class="writeList" class="box">
					<table class="writerChannel">
						<c:if test="${ not empty channel }">
				       		<c:forEach var="item" items="${channel}">
								<tr class="writerInfoTr">
									<c:set var="check" value="0" />
									<c:forEach var="profile" items="${member }">
										<c:if test="${item.channel_user_id eq profile.userId && check eq 0 }">
											<td rowspan="2" class="img"><img class="imgmy" src="/sins/resources/file/${profile.userId }/${profile.userProfile}" /></td>
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<td class="userid">${item.channel_user_id}</td>
								</tr>
								<tr>
									<td class="writedate">${item.chan_article_write_date}</td>
								</tr>
								<tr>
									<td colspan="2" class="content">
									 	${item.chan_article_content}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn">
										<button class="deleteBtn">삭제하기</button>
										<input type="hidden" name="classify" value="${item.classify }"/>
										<input type="hidden" name="chan_article_no" value="${item.chan_article_no }" />
									</td>
									
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not empty group }">
								<c:forEach var="item" items="${group}">
								<tr class="writerInfoTr">
									<c:set var="check" value="0" />
									<c:forEach var="profile" items="${member }">
										<c:if test="${item.userId eq profile.userId && check eq 0 }">
											<td rowspan="2" class="img"><img class="imgmy" src="/sins/resources/file/${profile.userId }/${profile.userProfile}" /></td>
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<td class="userid">${item.userId}</td>
								</tr>
								<tr>
									<td class="writedate">${item.writeDate}</td>
								</tr>
								<tr>
									<td colspan="2" class="content">
									 	${item.content}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn">
										<button class="deleteBtn">삭제하기</button>
										<input type="hidden" name="classify" value="${item.classify }"/>
										<input type="hidden" name="writeNo" value="${item.writeNo }" />
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not empty mypage }">
								<c:forEach var="item" items="${mypage}">
								<tr class="writerInfoTr">
									<c:set var="check" value="0" />
									<c:forEach var="profile" items="${member }">
										<c:if test="${item.userid eq profile.userId && check eq 0 }">
											<td rowspan="2" class="img"><img class="imgmy" src="/sins/resources/file/${profile.userId }/${profile.userProfile}" /></td>
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<td class="userid">${item.userid}</td>
								</tr>
								<tr>
									<td class="writedate">${item.writedate}</td>
								</tr>
								<tr>
									<td colspan="2" class="content">
									 	${item.content}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn">
										<button class="deleteBtn">삭제하기</button>
										<input type="hidden" name="classify" value="${item.classify }"/>
										<input type="hidden" name="writeno" value="${item.writeno }" />
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
	       	</div>
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