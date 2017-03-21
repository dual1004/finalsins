<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</style>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Channel List</title>
<script type="text/javascript">
	$(function() {
		$(".channelList").click(function() {
			var channel_no = $(this).children().first().val();
			var url = "selectChannelPage.l?channel_no=" + channel_no;
			$(location).attr('href', url);
		});
	});
	

</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/channelList.css" />
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
				<li><a href="alink.do?path=channel/channelList">내 페이지</a></li>
				<li><a href="alink.do?path=channel/channelList">뉴스피드</a></li>
				<li><a href="selectChannelList.l">채널</a></li>
				<li><a href="alink.do?path=channel/channelList">그룹</a></li>
			</ul>
		</div>
		<div id="content" class="box">
		
			<c:forEach var="item" items="${channellist}">
			<%-- <c:if test ="${not empty item.channel_filepath}"> --%>
				<div class="channelList" style="background-image:url('${pageContext.request.contextPath}/resources/file/${item.channel_user_id}/${item.channel_filepath}');background-size:230px 200px; "  >
					<input type="hidden" class="channelNo" value="${item.channel_no}" />
					<label class="channelName">${item.channel_name}</label>
					<div class="memberCount">${item.follow_count}명</div>
					<div class="category">${item.category1}</div>
					</div>
			</c:forEach>
		
		</div>
		</div>
		<div id="right" class="box">
			<br>
			<div id="center">
				<h3>빠른 채널 개설</h3>
			</div>
			<form id="insertChannel" action="insertChannel.l" method="post"
				enctype="multipart/form-data">
				<center>
					<div id="side">
						<!-- case -->
						<br> <br>
						<div class="channel_name">
							<input type="text" id="channel_name" name="channelName" size="18"
								maxlength="11" required placeholder="채널 이름">
							<button type="button" id="dupcheck" name="dupcheck"
								onclick="checkTitle()">중복 확인</button>
							<br> <br>
						</div>
						<div id="channel_info">
							<textarea class="channelInfo" rows="5" cols="30"
								name="channelInfo" id="channel_info" placeholder="채널 정보 입력"></textarea>
						</div>
						<br> <br>
						<div id="channel_filepath">
							<input type="file" name="channelfilepath1" id="channel_filepath">
						</div>
						<br>
						<div id="category1">
							<select name="category1" id="category1">
								<option value="">카테고리 선택</option>
								<option value="여행">여행</option>
								<option value="책">책</option>
								<option value="뷰티">뷰티</option>
								<option value="패션">패션</option>
								<option value="스터디">스터디</option>
							</select>
						</div>
						<br> <br>

						<textarea class="form-control" rows="5" cols="30"
							id="channel_keyword" name="channelKeyword" placeholder="태그 설정"></textarea>
					</div>
					<br> <br> <br> <input type="submit" name="skins"
						class="btn btn-default2" id="makeGroup" onclick="return check()"
						value="채널생성" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" name="reset" class="btn btn-default3">선택
						취소</button>
					<br> <br>
				</center>
			</form>
		</div>
	</div>



	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
</body>
</html>