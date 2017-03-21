<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		$(document).on("click", ".articleLike", function() {
			var article_no = $(this).parent().next().children().val();
			var channel_no = $(this).parent().next().next().children().val();
			$(this).parent().html("<input type='button' class='articlUnLike' value='좋아요취소' />");
		
			$.ajax({
				url : "articleLikeClick.l",
				type : "post",
				data : {
					"chan_article_no" : article_no,
					"channel_no" : channel_no
				},
				success : function(data) {
					
				}
			})
		});
		
		$(document).on("click", ".articlUnLike", function() {
			var article_no = $(this).parent().next().children().val();
			var channel_no = $(this).parent().next().next().children().val();
			$(this).parent().html("<input type='button' class='articleLike' value='좋아요' />");
			console.log(article_no + " " + channel_no);
			$.ajax({
				url : "articleUnLikeClick.l",
				type : "post",
				data : {
					"chan_article_no" : article_no,
					"channel_no" : channel_no
				},
				success : function(data) {
				}
			})
			
		});

	});
	
	function fnclick(){
		var div = document.getElementById("flipper");
		div.style.transform="rotateY(180deg)";
		div.style.transition= "0.8s";
	}
	
	function fnReclick(){
		var div = document.getElementById("flipper");
		div.style.transform="rotateY(0deg)";
		div.style.transition= "0.8s";
	}
	function delete_chan(){
		var del_chan =  document.getElementById("channel_no");
		location.href="deleteChannel.l?channel_no="+del_chan;		
	}
	
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Channel Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/channelPage.css" />
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
			<hr />
			<br /> <br>
			<ul id='ul'>
				<li><a href="">나의 정보</a></li>
				<li><a href="alink.do?path=channel/channelList">뉴스피드</a></li>
				<li><a href="selectChannelList.l">채널</a></li>
				<li><a href="alink.do?path=channel/channelList">그룹</a></li>
			</ul>
		</div>

		<div id="content" class="box">
		<div class="flip-container">
    	<div class="flipper" id="flipper">
      	  <div class="front">
			<div id="signalImageArea">
				 채널 이름 : ${channelPage.channel_name }<br>
				 채널 정보 : ${channelPage.channel_info}<br>
				 <c:if test="${channelPage.channel_user_id eq loginUser.userId}">
				<button onclick="fnclick();">채널수정/삭제</button>
				</c:if>
				<div id="signalImageCalled"
					style="background-image:url('${pageContext.request.contextPath}/resources/file/${channelImageCalled.channel_user_id}/${channelImageCalled.channel_filepath}');background-size:230px 200px; "></div>
			</div>
		</div>
		 <div class="back">
		 <div id="signalImageArea">
				<form action="updateChannel.l"  method="post">
					<input type="hidden" id="channel_no" name ="channel_no" value="${channelPage.channel_no}" />
					<input type="text" id="channel_name" placeholder="채널이름 입력" name="channel_name"/><br>
					<input type="text" id="channel_info" placeholder="채널정보 입력" name="channel_info"/><br>
					<input type="file" id="channel_filepath" placeholder="채널사진 변경" name="channel_filepath"/><br>
					<input type="button" value="수정취소"  onclick="fnReclick();">&nbsp;
					<input type="button" value="채널삭제" onclick="delete_chan();"/>&nbsp;
					<input type="submit" value="수정완료"/> 
					<div id="signalImageCalled"
						style="background-image:url('${pageContext.request.contextPath}/resources/file/${channelImageCalled.channel_user_id}/${channelImageCalled.channel_filepath}');background-size:230px 200px; "></div>
				</form>
					</div>
        </div>
		
		</div>
		</div>

			<div id="writeArticle">
				<c:if test="${channelPage.channel_user_id eq loginUser.userId}">
					<form action="insertChannelArticle.l" id="article" method="post">
						<input type="submit" value="등록"> <input type="hidden"
							name="channel_no" value="${channelPage.channel_no }"> <input
							type="hidden" name="user_id_bak" value="${loginUser.userId }">
						<input type="hidden" name="classify"
							value="${channelPage.classify }">
						<textarea name="chan_article_content" form="article" cols="64"
							rows="7">게시글을 입력하세요.</textarea>
					</form>
				</c:if>
			</div>
			<c:forEach var="article" items="${selectArticle}">
				<div class="writeList">
					<div>
						<table class="writerInfo">
							<tr class="writerInfoTr">
								<td class="writerPhoto" rowspan="2">사진</td>
								<td class="writerName">${Barticle.channel_name}</td>
							</tr>
							<tr>
								<td class="writeDate">${article.chan_article_write_date}</td>
							</tr>
						</table>
						<div class="contentContainer">
							${article.chan_article_content}</div>

						<div class="buttonContainer">
							<form action="articleLikeClick.l" id="articleLikeClick"
								method="post">
								<table>
									<tr>
										<td><input type="button" class="comment" value="댓글" /></td>
										<td><input type="button" class="update" value="수정" /></td>
										<td><input type="button" class="openMask" value="삭제" /></td>
										
											<c:set var="likeVar" value="0"/>
										<c:forEach var="likelist" items="${selectLikeList }">
										<c:if test = "${article.chan_article_no eq likelist.chan_article_no}">
										<c:set var="likeVar" value="1"/>
										</c:if>
										
										</c:forEach>
										<c:if test="${likeVar==0}">
													<td><input type="button" class="articleLike" value="좋아요" /></td>
												</c:if>
												<c:if test="${likeVar==1}">
													<td><input type="button" class="articlUnLike" value="좋아요취소" /></td>
												</c:if>
												<td class="chan_article_no"><input type="hidden"
												name="chan_article_no" value="${article.chan_article_no}" /></td>
												<td class="channel_no"><input type="hidden"
												name="channel_no" value="${article.channel_no}" /></td>
												<td>좋아요 갯수: ${article.like_amount}</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div id="right" class="box"></div>

	</div>

	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
</body>
</html>