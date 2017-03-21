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
		$(".groupPageBtn").click(function(){
			var groupNo = $(this).next().val();
			var url = "selectGroup.y?groupNo="+groupNo;		
			$(location).prop('href', url);
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
		margin-bottom: 5px;
		margin-right: 5px;
		right: 0;
		bottom: 0;
		font-size: 12px;
	}
	
	.category {
		position: absolute;
		display: inline-block;
		margin-bottom: 5px;
		margin-left: 5px;
		left: 0;
		bottom: 0;
		font-size: 13px;
	}
	
	#content {
		position: relative;
	}
	
	#createTable {
		width: 150px;
		height: 400px;
		border-collapse: collapse;
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
        	<div id="center"><h3>그룹 개설</h3></div>
			<form id="createGroup" action="insertGroup.y" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="userId" value="${loginUser.userId}"/>
            	<table id="createTable">
            		
            		<tr><td><input type="text" id="groupName" name="groupName" size="18" 
            					maxlength="11" required placeholder="그룹 이름"></td></tr>
            		
            		<tr><td><textarea id="groupInfo" rows="5" cols="30" 
            					name="groupInfo" placeholder="그룹 정보 입력"></textarea></td></tr>
            		
            		<tr><td><label>대표 이미지</label>
            				<input type="file" id="filepath" name="filepath"></td></tr>

            		<tr><td>
            				<label>카테고리</label><br/>
	            			<select id="selectCategory" name="category1">
								<option value="">선택</option>
								<option value="여행">여행</option>
								<option value="책">책</option>
								<option value="뷰티">뷰티</option>
								<option value="패션">패션</option>
								<option value="스터디">스터디</option>						
							</select>
					</td></tr>
            	
            		<tr><td><button type="submit" id="makeGroup" class="create">그룹 생성</button></td></tr>
            	
            	</table>
            	<input type="hidden" name="keyword" value=""/>
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