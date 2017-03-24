<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Channel Page</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$( document ).ready(function() { 
    
	
	
	$("#t-l").click(function(){ 
		$("#spot1, #overlay_t").show(300);
	}); 
 	$("#overlay_t").click(function(e){ 
     	e.preventDefault(); 
     	$("#spot1, #spot2, #overlay_t").hide(300); 
	});
 	$("#t-r").click(function(){ 
 		$("#spot2, #overlay_t").show(300);
 	}); 
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice").click(function(){
 		if(noticeMenuStatus == 0){
 			noticeMenuStatus = 1;
 			$(".notice").slideDown("slow");
 		}
 		else {
 			noticeMenuStatus = 0;
 			$(".notice").slideUp("slow");
 		}
 		
 	});
 	
 	
 	setTimeout(function(){
 		$('#friend').html(friendTag);
 		
 	},500);
 	
 	
});

$(function() {
	
	$(".comment").on("click", function(){
    	
		var state = $(this).parent().parent().parent().parent().parent().next().css('display'); 
    /* 	var state = $(this).parent().parent().parent().parent().parent().next().attr('id'); */
/*     	alert(state); 
    	 */
    	 if(state == 'none') {
    		$(this).parent().parent().parent().parent().parent().next().show(300);
		} else {
			$(this).parent().parent().parent().parent().parent().next().hide(300);
		}
    	
    	
		});
    });
	
	
	
	
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
	
	//댓글등록
	$(document).on("click", ".btn_entry Lang-LBL0000", function(){
	    	var user_id= '${loginUser.userId}';
	    	var chan_article_no= $(this).prev().prev().val();
	    	var content= $(this).prev().val();
	    	var thisdiv = $(this).parent().parent().next().children();
	    	console.log(chan_article_no);
	    	
	    	$.ajax({
				url : 'ajax.l?user_id='+user_id+'&chan_article_no='+chan_article_no+'&content='+content
				,dataType : 'json'
				,contentType : 'application/json; charset=utf-8'
				,success : function(data) {
					if(data == 1){
						thisdiv.append($('<li>', {html : content}));
					}
				}
			});
	    });
	
	//댓글삭제
	 $(document).on("click", ".commentdel", function(){
    	var comment_no = $(this).next().next().val();
		var chan_article_no = $(this).next().next().next().val();
		var th = $(this).parent();
		console.log(comment_no);
		console.log(chan_article_no);
		
		$.ajax({
            url : "deleteChannelComment.l",
            data : {"comment_no" : comment_no,"cane_article_no" : chan_article_no},
            type : "post",
            success : function(data){
            	th.remove();
            }
         })
      });
	
	
	 $(document).on("click", ".dofire", function(){
			var chan_article_no = $(this).parent().next().children().val();
			var classify = "CHANNEL_ARTICLE";
			var fireId = $(this).parent().next().next().children().val();
			
			var th = $(this);
			
			$.ajax({
				url : "fireChannelContent.k",
				type : "post",
				data : {
					"fireNo" : chan_article_no,
					"classify" : classify,
					"fireId" : fireId
				},
				success : function(data) {
					th.parent().html("<input type='button' class='fireCancel' value='신고취소'/>");
				}
			})
		});
		
		$(document).on("click", ".fireCancel", function(){
			var chan_article_no = $(this).parent().next().children().val();
			var classify = "CHANNEL_ARTICLE";
			var fireId = $(this).parent().next().next().children().val();
			
			var th = $(this);
			
			$.ajax({
				url : "CancelChannelContent.k",
				type : "post",
				data : {
					"fireNo" : chan_article_no,
					"classify" : classify,
					"fireId" : fireId
				},
				success : function(data) {
					th.parent().html("<input type='button' class='dofire' value='신고'/>");
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
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/channel/channelPage.css" />
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
			
			<br/> 
			<c:if test="${memberUser.userProfile != null}">
				<img src="${memberUser.userProfile}"
					style="width: 100px; margin-left:15px;">
			</c:if>
			<c:if test="${memberUser.userProfile eq null}">
				<img src="/sins/resources/images/missingNO.jpg"
					style="width: 100px; margin-left:15px;">
			</c:if>

			<ul>
				<li><a href="mypage.b">MyPage</a></li>
				<li><a href="javascript:goMyInfo()">내 정보보기</a></li>
				<li><a href="selectChannelList.l">채널</a></li>
				<li><a href="selectGroupList.y">그룹</a></li>
	         	<li><a href="alink.do?path=common/newsfeed">뉴스피드</a></li>
	         	<li id="notice">고객센터</li>
	        	<li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	         	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
	         
			</ul>
		</div>

		<div id="content">
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
				<form id="backForm" action="updateChannel.l"  method="post">
					<input type="hidden" id="channel_no" name ="channel_no" value="${channelPage.channel_no}" />
					<input type="text" id="channel_name" placeholder="채널이름 입력" name="channel_name" />
					<br/>
					<input type="text" id="channel_info" placeholder="채널정보 입력" name="channel_info"/>
					<br/>
					<input type="file" id="channel_filepath" placeholder="채널사진 변경" name="channel_filepath"/>
					<br/><br/>
					<input type="button" value="수정취소"  onclick="fnReclick();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="채널삭제" onclick="delete_chan();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="수정완료"/> 
				</form>
			</div>
        </div>
		
		</div>
		</div>

			<div id="writeArticle">
				<c:if test="${channelPage.channel_user_id eq loginUser.userId}">
					<form action="insertChannelArticle.l" id="article" method="post" enctype="multipart/form-data">
					<div class="content2">
					<br/>
					<h3>&nbsp;&nbsp; 글 작성 하기</h3>
						&nbsp;&nbsp;&nbsp;<textarea name="chan_article_content" form="article" cols="50" rows="4" style="resize:none;"></textarea>
						<input id="file" type="file" name="file">
						<input type="submit" value="등록"> 
						<input type="hidden" name="channel_no" value="${channelPage.channel_no }"> 
						<input type="hidden" name="user_id_bak" value="${loginUser.userId }">
						<input type="hidden" name="classify" value="${channelPage.classify }">
					</div>	
					</form>
				</c:if>
			</div>
			
			<c:forEach var="article" items="${selectArticle}">
				<div class="writeList">
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
						<form id="mypageform3" class="commentForm" >
								<div class="score_textarea">
									<input id="user_id" type="hidden" name="user_id" value="${loginUser.userId}"/>
									<input id="chan_article_no" type="hidden" name="chan_article_no" value="${article.chan_article_no}"/>
									<textarea id ="txtComment" class="content1" name="txtComment" title="댓글입력" placeholder="댓글을 입력하세요!" cols="50" rows="1"></textarea>
									<input type="submit" class="btn_entry Lang-LBL0000" id="btnSave" value="입력" />
								</div>
								</form>
									
									
									<div class= "commentList">
									<ul class="commentList">
												<c:forEach var="comment" items="${channelCommentList}">
													<c:if test="${article.chan_article_no eq comment.chan_article_no}">
														<li>${comment.content }
														<input type="button" value="수정" class="commentUpd"/>
														<input type="button" value="삭제" class="commentdel"/>
														<input type="button" value="신고" class="commentFire" />
														<input type="hidden" name="comment_no" value="${comment.comment_no}"/>
														<input id="chan_article_no" type="hidden" name="chan_article_no" value="${article.chan_article_no}"/>
														</li>
													</c:if> 	
												</c:forEach>
												</ul>
											</div>
											
								</div>
								
								</c:forEach>
								</div>
								</div>

		<div id="right" class="box">
		<div id="channelInfo"> 채널 정보</div>
		<div id="channelFoll"> 채널 팔로워</div>
		</div>

	

	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
	<div id="spot1">
		<ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="alink.do?path=common/newsfeed">뉴스피드</a></li>
	          <li id="notice2">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	          
	    </ul>
	</div>
	<div id="spot2">
		<ul>
		<li><a href="javascript:goMyInfo()">내 정보보기</a></li>
		<li><a href="javascript:message();">메세지 보기</a></li>
		<li><a href="javascript:alertover()">알림 보기</a></li>
		<li><a href="javascript:logout()">로그 아웃</a></li>
	</ul>
	<hr style="width:100px; margin:auto;">
	<br/>
	<%@include file="/WEB-INF/views/friend/friendView.jsp" %> 
	
	</div>
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
</body>
</html>