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
		/* $(".groupList").click(function() {
			var groupNo = $(this).children().first().val();
			var url = "selectGroup.y?groupNo="+groupNo;
			$(location).attr('href', url);
		}); */
		
		
		$(".groupPageBtn").click(function(){
			var groupNo = $(this).next().val();
			var url = "selectGroup.y?groupNo="+groupNo;		
			$(location).attr('href', url);
		});
		
		$(".requestBtn").click(function(){
			
			
		});
	});
	
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
	
	#content {
		position: relative;
		border: 1px solid;
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
				 <li><a href="alink.do?path=channel/channelList">채널</a></li>
				 <li><a href="selectGroupList.y">그룹</a></li>
				 <li><h4>뉴스피드</h4></li>
				 <li><a href="selectQna.n">고객센터</a></li>
			</ul>
		</div>
		<div id="content" class="box">
			<h2 id="pageName">그룹리스트</h2>
			<c:forEach var="item" items="${list}">
				<div class="groupList">
					<input type="hidden" class="groupNo" value="${item.groupNo}"/>
					<label class="groupName">${item.groupName}</label>
					<div class="memberCount">${item.memberCount} 명</div>
					<div class="category">${item.category1}</div>
					
					<div class="groupBtnContainer">
						<input type="button" class="groupPageBtn" value="그룹페이지로"/>
						<input type="hidden" class="groupNo" value="${item.groupNo}"/>
					</div>
					
				</div>
				
			</c:forEach>
		</div>
		<div id="right" class="box">
			<br/>
        	<div id="center"><h3>빠른 그룹 개설</h3></div>
			<form id="createGroup" action="insertGroup.y" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="userId" value="${loginUser.userId}"/>
            	<div id="case">
            		<br/><br/>
            		<div id="side">
            			<label id="title" for="groupName"></label>
            			<input type="text" id="groupName" name="groupName" size="18" 
            					maxlength="11" required placeholder="그룹 이름">
            			<button type="button" id="dupcheck" name="dupcheck" onclick="checkTitle()">중복확인</button>
            			<br/><br/>
            		</div>
					<div id="groupComment">
						<textarea class="groupInfo" rows="5" cols="30" name="groupInfo" placeholder="그룹 정보 입력"></textarea>
					</div>
					<br/><br/>
					<div id="image">
						<label id="ima" for="image">대표 이미지</label>
						<input type="file" name="images" id="images">
					</div>
					<br/>
					<div>
						<label id="ho" for="categories">카테고리 설정</label>
						<label><br/><input type="checkbox" id="categories" name="category1" class="c1" value="여행" />여행 </label> 
						<label><input type="checkbox" id="categories" name="category1" class="c1" value="책" />책</label>
						<label><input type="checkbox" id="categories" name="category1" class="c1" value="뷰티" />뷰티 </label>
                 		<label><input type="checkbox" id="categories" name="category1" class="c1" value="패션" />패션</label>
						<label><input type="checkbox" id="categories" name="category1" class="c1" value="스터디" />스터디</label>
					</div>
					<br/><br/>
					<div id="tag">
						<textarea class="form-control" rows="5" cols="30" id="tags" name="tags" placeholder="태그 설정"></textarea>
					</div>
					<br/><br/><br/>
            	</div>
            	<button type="submit" name="skins" class="btn btn-default2" id="makeGroup">그룹 생성</button>
            	<button type="reset" name="reset" class="btn btn-default3">선택 취소</button>
            	<br/><br/>
			</form>
		</div>
	</div>
	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>