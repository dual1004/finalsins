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
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">

<script type="text/javascript">
	// 문호형꺼
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
	
	
	
	// 내꺼
	$(function(){
		// 화면 중앙에 배치.		
		jQuery.fn.center = function () {
		    this.css("position","absolute");
		    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 3) + 
		                                                $(window).scrollTop()) + "px");
		    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
		                                                $(window).scrollLeft()) + "px");
		    return this;
		}
			
        //닫기 버튼을 눌렀을 때
        $(".window .cancelBtn").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
        });     
        
        // 가입하기 버튼 클릭 시
        $("#requestBtn").click(function(){
			var groupNo = $("#groupNo").val();
			var userId = $("#userId").val();
        	
			location.href = "requestGroupMember.y?groupNo=" + groupNo + "&userId=" + userId;
        });
        
        // 좋아요 -> 취소
        $(document).on("click",".like", function(){
      		
    		var writeNo = $(this).parent().next().val();
    		var groupNo = ${group.groupNo};
    		var userId = '${loginUser.userId}';
			var parent = $(this).parent();
    		
    		$.ajax({
    			url : 'groupLike.y?userId=' + userId + '&writeNo=' + writeNo + '&groupNo=' + groupNo
    			,dataType : 'json'
    			,contentType : 'application/json; charset=utf-8'
    			,success : function(result) {
    				
    				parent.html('<input type="button" class="unlike" value="취소${check}"/>');				
    			}
    		}); 
        });
        
        //취소 -> 좋아요
		$(document).on("click",".unlike", function(){

			var writeNo = $(this).parent().next().val();
			var groupNo = ${group.groupNo};
    		var userId = '${loginUser.userId}';
			var parent = $(this).parent();
    		
    		$.ajax({
    			url : 'groupUnlike.y?userId=' + userId + '&writeNo=' + writeNo + '&groupNo=' + groupNo
    			,dataType : 'json'
    			,contentType : 'application/json; charset=utf-8'
    			,success : function(result) {
    				parent.html('<input type="button" class="like" value="좋아요${check}"/>');		
    			}
    		});
		});
        
        
        // 댓글 클릭 시, 댓글 리스트 보여주기
        $(".comment").on("click", function(){
        	
        	var writeNo = $(this).parent().next().next().val();
    		var userId = '${loginUser.userId}';
    		var thediv = $(this).parent().parent().parent().parent().next().children('.commentListContainer').text();
    		$.ajax({
				url : 'selectGroupCommentList.y?writeNo=' + writeNo
				,dataType : 'json'
				,contentType : 'application/json; charset=utf-8'
				,success : function(list) {
					
					console.log(thediv);
					console.log(list);
					for(var i = 0; i < list.length; i ++) {
						
						/* thediv.append($('<div>', {html : list[i].userId}));
						thediv.append($('<div>', {class : 'commentOne', text : list[i].content}));	 */
					}
				}
    		});
        });
        
        // 댓글에 글쓰기 했을 때
        $(".commentSubmit").on("click", function(){
        	var commentForm = $(this).parent().serialize();
			var thisdiv = $(this).parent().parent().next();
        	
        	$.ajax({
				url : 'insertGroupComment.y'
				,dataType : 'json'
				,data : commentForm
				,contentType : 'application/json; charset=utf-8'
				,success : function(commentList) {
					
					for(var i = 0; i < commentList.length; i ++) {
						thisdiv.append($('<div>', {html : commentList[i].userId}));
						thisdiv.append($('<div>', {class : 'commentOne', text : commentList[i].content}));	
					}
				}
			});
        });
        
	});
	
	// main화면에서 삭제버튼 클릭 시 작동.
	function deleteWrite(writeNo) {
		mask();
 		
		//삭제윈도우를 띄운다.
        $(".deleteWindow").show();
		
        $("#deleteBtn").click(function() {
        	location.href = "deleteGroupWrite.y?writeNo=" + writeNo + "&groupNo=" + ${group.groupNo};
        });
	}
	
	// main화면에서 수정버튼 클릭 시 작동.
	function updateWritePage(writeNo, content, filepath) {
		mask();
		$("#updateContent").val(content);
		$("input[name=writeNo]").val(writeNo);
		$("input[name=filepath]").val(filepath);
		$(".updateWindow").show();
	}

	// 검은 막 생성.
	function mask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $(".window").center();
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
        
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
	}
	
</script>

<style type="text/css">
	/* 공용 */
	a:link, a:visited { text-decoration: none; color: #000000; }
	a:hover { text-decoration: none; color: #0080ff; }
	ul, li {list-style:none; margin:0; padding:10px;}
	/* ---------------------------------------------- */
	
	
	#mask {  
	    position:absolute;  
	    z-index:9000;  
	    background-color:#000;  
	    display:none;  
	    left:0;
	    top:0;
	} 
	
	/* 팝업으로 뜨는 윈도우 css  */ 
	.window{
	    display: none;
	    position:absolute;  
	    width:30%;
	    height:20%;
	    background-color:#FFF;
	    z-index:10000;   
	 }
	
	/* main(대표사진, 그룹정보 등) */
	#mainContainer {
		 width:100%;
		 height:20%;
	}

	/* 그룹 멤버 리스트  */
	#memberContainer {
		float: right;
		width: 28%;
		margin-top: 10px;
	}
	
	.groupMember {
		border-bottom: 1px solid grey;
	}
	
	.groupMember .memberdiv {
		display: inline-block;
	}
	
	.groupMember .profilePhoto {
		width: 30%;
	}
	
	.groupMember .memberInfo {
		width: 60%;
		text-align: center;
	}
		
	/* 게시글 쓰기 */
	#groupWriteContainer {
		width: 70%;
		height: 20%;
		margin-top: 10px;
		margin-right: 10px;
	}
	
	#writeAreaContainer {
		width: 100%;
		height: 80%;
	}
	
	#writeAreaContainer textarea {
		width: 80%;
		height: 90%;
		padding: 1%;
		resize: none;
		float: right;
	}
	
	#writeBtnContainer {
		width: 100%;
		height: 19%;
	}
	
	#writeBtnContainer #writeBtn {
		display: inline-block;
		margin: 1%;
		float: right;
	}
	
	
	/* 게시글 목록  */
	.writeList {
		width: 70%;
		margin-top: 10px;
		margin-right: 10px;
		-moz-box-shadow: 1px 1px 1px #888888;
		box-shadow: 1px 1px 1px #888888;
	}
	
	.writeList .writerInfo {
		width: 100%;
	}
	
	.writeList .writerPhoto {
		width: 15%;
	}
	
	.writeList .writerName {
		font-size: 15px;
	}
	
	.writeList .writeDate {
		font-size: 12px;
	}
	
	.contentContainer {
		padding: 5%;
	}
	
	.buttonContainer {
		background: #ededed;
	}
	
	/* 삭제클릭 시 영역, 버튼 */
	#deleteMessageArea {
		width: 100%;
		height: 70%;
		text-align: center;
		
	}
	
	#deleteBtnArea {
		width: 100%;
		height: 30%;
	}
	
	/* 댓글 */
	.commentOne {
		border-bottom : 1px solid;
	}
	
	
	/* 그룹회원이 아닌 경우  */
	#requestContainer {
		width: 70%;
		height: 30%;
		margin-top: 10px;
		margin-right: 10px;
	}
	
	/* footer 에 마지막 글이 가려지는 문제 해결 */
	#container {
		margin-bottom: 30px;
	}
	#rightchat{
		position: fixed;
	}
	
		
	
	input[type=button] {
		background-color : white;
		border-radius: 5px;
	}
	
	
</style>

</head>
<body>

<div id="mask"></div>
<div class="deleteWindow window">
	<div id="deleteMessageArea"><div>정말 삭제 하시겠습니까?</div></div>
	<div id="deleteBtnArea">
		<input type="button" id="deleteBtn" value="삭제"/>
		<input type="button" class="cancelBtn" value="취소"/>
	</div>
   </div>
   <div class="updateWindow window">
   	<form action="updateGroupWrite.y" method="post">
    	<div id="updateMessage">
    		<textarea id="updateContent" name="content"></textarea>
    	</div>
    	<div id="updateBtnArea">
    		<input type="submit" id="updateBtn" value="수정"/>
    		<input type="button" class="cancelBtn" value="취소"/>
    		<input type="hidden" name="groupNo" value="${group.groupNo}"/>
    		<input type="hidden" name="writeNo"/>
			<input type="hidden" name="filepath"/>
    	</div>
   	</form>
   </div>
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
	<div id="content" class="box" style="position:relative;">
		<h2>${group.groupName}</h2>
		<div id="mainContainer" class="box">
			<h3>메인 사진</h3>
		</div>
		<div id="memberContainer" class="box">
			<h3><a href="groupMemberDetail.y?groupNo=${group.groupNo}">그룹 멤버</a></h3>
				<c:forEach var="item" items="${memberList}">
					<c:if test="${item.groupAccept == 'Y'}">
						<div class="groupMember">
							<div class="profilePhoto memberdiv">
								사진
							</div>
							<div class="memberInfo memberdiv">
								${item.userName}
							</div>
						</div>
					</c:if>
				</c:forEach>
						
		</div>
		<c:choose>
			<c:when test="${memberCheck == true}">
				<div id="groupWriteContainer" class="box">
					<form id="insertWrite" action="insertGroupWrite.y" method="post" enctype="multipart/form-data">
						<input type="hidden" id="userId" name="userId" value="${loginUser.userId}"/>
						<input type="hidden" id="groupNo" name="groupNo" value="${group.groupNo}"/>
						<div id="writeAreaContainer">
							<label>새글쓰기</label>
							<label>
								<textarea name="content" placeholder="내용입력"></textarea>
							</label>
						</div>
						<div id="writeBtnContainer">
							<input id="writeBtn" type="submit" value="올리기"/>
						</div>
					</form>
				</div>
				<c:forEach var="item" items="${writeList}">
					<div class="writeList" class="box">
						<div>
							<table class="writerInfo">
								<tr class="writerInfoTr">
									<td class="writerPhoto" rowspan="2">사진</td>
									<td class="writerName">${item.userName}</td>
								</tr>
								<tr>
									<td class="writeDate">${item.writeDate}</td>
								</tr>
							</table>
							<div class="contentContainer">
								${item.content}
							</div>
							<div class="buttonContainer">
								<table>
									<tr>
										<td><input type="button" class="comment" value="댓글"/></td>
										<c:set var="check" value="0"/>
										<c:set var="count" value="${item.writeLike}"/>
										<c:forEach var="like" items="${likeList}">
											<c:if test="${like.writeNo == item.writeNo && check == 0}">
												<c:set var="check" value="1"/>
											</c:if>
										</c:forEach>
											
										<c:if test="${check == 1}">
											<td><input type="button" class="unlike" value="좋아요 취소"/></td>
										</c:if>	
										<c:if test="${check == 0}">
											<td><input type="button" class="like" value="좋아요"/></td>
										</c:if>
											<input type="hidden" class="writeNo" value="${item.writeNo}"/>
										
										<c:if test="${item.userId == loginUser.userId}">
											<td><input type="button" class="update" 
												onclick="updateWritePage(${item.writeNo}, '${item.content}', '${filepath}');"value="수정"/></td>
											<td><input type="button" class="deleteWrite" 
												onclick="deleteWrite(${item.writeNo});"value="삭제"/></td>
										</c:if>
										<c:if test="${item.userId != loginUser.userId}">
											<td><input type="button" class="report" 
												onclick="reportWrite('${item.userId}', ${item.writeNo});" value="신고"/></td>
										</c:if>
											<td class="countLike">${count}</td>
									</tr>
								</table>
							</div>
							<div class="commentContainer" style="border:1px solid red; width: 100%;">
								<div class="commentWriteContainer">
									<form action="" class="commentForm" method="post" enctype="multipart/form-data">
										<input type="hidden" name="userId" value="${loginUser.userId}"/>
										<input type="hidden" name="writeNo" value="${item.writeNo}"/>
										<textarea name="content"></textarea>
										<input type="button" class="commentSubmit" value="댓글쓰기"/>
									</form>
								</div>
								<div class="commentListContainer">${item.writeNo }</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			
			<c:when test="${memberCheck == 'false'}">
				<div id="requestContainer">
					<input type="hidden" id="userId" name="userId" value="${loginUser.userId}"/>
					<input type="hidden" id="groupNo" name="groupNo" value="${group.groupNo}"/>
					<input type="button" id="requestBtn" value="가입하기"/>				
				</div>
			</c:when>
			
			<c:otherwise>
				<div id="requestContainer">
					<label>가입 요청됨</label>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="right" class="box">
	<div id="rightchat">
		<h2>그룹 채팅</h2>
		<c:import url="/WEB-INF/views/chat/chat.jsp"></c:import>
		<ul>
			
		</ul>
	</div>
	</div>
</div>
<div id="footer">
	<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
</div>
<div id="spot1"></div>
<div id="spot2"></div>

</body>
</html>