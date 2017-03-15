<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/common/newsfeed-common.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#t-l').click(function() {
			$('#spot1, #overlay_t').show();
		});
		$('#overlay_t').click(function(e) {
			e.preventDefault();
			$('#spot1, #overlay_t').hide();
		});
		$('#t-r').click(function() {
			$('#spot2, #overlay_t').show();
		});
		$('#overlay_t').click(function(e) {
			e.preventDefault();
			$('#spot2, #overlay_t').hide();
		});
	});
	
	$(function(){
		$(".disagreeBtn").click(function(){
			var userId = $(this).siblings().prop('type', 'hidden');
		
			
		});
	});
	
	function resultMember(userId, result){
		var groupNo = ${group.groupNo};
		var url;
		console.log(userId);
		console.log(groupNo);
		console.log(result);
		
		if(result == 'agree')
		 	url = "agreeGroupMember.y?userId=" + userId + "&groupNo=" + groupNo;
		else
			url = "disagreeGroupMember.y?userId=" + userId + "&groupNo=" + groupNo;
			
		location.href = url;
	};
	
	
</script>
<style>
	.groupList{
		position: relative;
		float: left;
		width: 47%;
		height: 20%;
		margin: 1%;
		border: 1px solid blue;
	}
	
	.groupName{
		display: inline-block;
		border: 1px solid;
		background: lightblue;
		margin-left: 5px;
		margin-top: 5px;
	}
	
	.memberCount {
		position: absolute;
		display: inline-block;
		border: 1px solid;
		margin-bottom: 5px;
		margin-right: 5px;
		right: 0;
		bottom: 0;
		font-size: 12px;
	}
	
	.category {
		position: absolute;
		display: inline-block;
		border: 1px solid;
		margin-bottom: 5px;
		margin-left: 5px;
		left: 0;
		bottom: 0;
		font-size: 13px;
	}
	
	* { border: 1px solid;}
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
				<li><a href="alink.do?path=group/GroupMain">그룹</a></li>
				<li><a href="alink.do?path=group/GroupList">그룹리스트</a></li>
				<li><a href="alink.do?path=group/CreateGroup">그룹생성</a></li>
			</ul>
		</div>
		<div id="content" class="box" style="position:relative;	border: 1px solid">
			<h2 id="pageName">그룹 멤버</h2>
				<c:if test="${member.grade == 0 || member.grade == 1}">
					<div id="requestContainer">
						<h4>가입 요청한 회원</h4>
						<table>
							<c:forEach var="item" items="${list}">
								<c:if test="${item.groupAccept == 'N'}">
									<tr>
										<td>사진</td>
										<td>${item.userName}</td>
										<td><input type="button" class="agreeBtn" onclick="resultMember('${item.userId}', 'agree');" value="수락"/></td>
										<td><input type="button" class="disagreeBtn" onclick="resultMember('${item.userId}', 'disagree');" value="거절"/></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</c:if>
			<hr/>
			<div id="adminContainer">
				<h4>운영진</h4>
				<table>
					<c:forEach var="item" items="${list}">
						<c:if test="${item.grade == 0 || item.grade == 1}">
							<tr>
								<td>사진</td>
								<td>${item.userName}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<hr/>
			<div id="memberContainer">
				<h4>회원</h4>
				<table>
					<c:forEach var="item" items="${list}">
						<c:if test="${item.grade == 2 && item.groupAccept == 'Y'}">
							<tr>
								<td>사진</td>
								<td>${item.userName}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="right" class="box">
			<h2>친구 목록</h2>
			<ul>
				
			</ul>
		</div>
	</div>
	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>