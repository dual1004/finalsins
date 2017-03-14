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
		$(".update").on("click", function(){
			$(".contentContainer").html("<textarea>${item.content}</textarea>");
		});
		
		jQuery.fn.center = function () {
		    this.css("position","absolute");
		    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + 
		                                                $(window).scrollTop()) + "px");
		    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
		                                                $(window).scrollLeft()) + "px");
		    return this;
		}
		
		 $(".openMask").click(function(e){
	            e.preventDefault();
	            wrapWindowByMask();
        });
			
		 // 삭제 버튼 클릭 시
		 $(".window #deleteBtn").click(function(){
			 
		 });
		 
        //닫기 버튼을 눌렀을 때
        $(".window #cancelBtn").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
 
        });      
	});
	
	
	function wrapWindowByMask(){
		 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $(".window").center();
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
        
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $(".window").show();
 
    }

</script>

<style type="text/css">
	
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


	/* 그룹 멤버 리스트  */
	#groupMemberList {
		list-style: none;
	}
	
	#groupMemberList .groupMember {
		width: 100%;
		height: 100%;
	}
	
	#groupMemberList .groupMember .profilePhoto {
		width: 30%;
	}
	 
	#groupMemberList .groupMember .memberInfo {
		text-align: center;
	}
	
	/* 게시글 쓰기 */
	#groupWriteContainer {
		width: 70%;
		height: 20%;
		margin-top: 10px;
		margin-right: 10px;
		border: 1px solid;
	}
	
	#writeAreaContainer {
		width: 100%;
		height: 80%;
	}
	
	#writeAreaContainer textarea {
		border: 1px solid;
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
		border: 1px solid;
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
	#messageArea {
		width: 100%;
		height: 70%;
		text-align: center;
		vertical-align: middle;
		
	}
	
	#deleteBtnArea {
		width: 100%;
		height: 30%;
	}
	
	
	* {
		border: 1px solid;
	}
	
	
</style>

</head>
<body>
	<div id="mask"></div>
	<div class="window">
		<div id="messageArea">정말 삭제 하시겠습니까?</div>
		<div id="deleteBtnArea">
			<input type="submit" id="deleteBtn" value="삭제"/>
			<input type="hidden" value="${item.writeNo}">
			<input type="button" id="cancelBtn" value="취소"/>
		</div>
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
			<div style="width:100%;height:20%;border:1px solid; ">
				<h3>메인 사진</h3>
			</div>
			<div style="float:right;width:28%;border:1px solid;margin-top:10px;">
				<h3><a href="groupMemberDetail.y?groupNo=${group.groupNo}">그룹 멤버</a></h3>
				<ul id="groupMemberList">
					<c:forEach var="item" items="${memberList}">
						<li>
							<table class="groupMember">
								<tr>
									<td rowspan=2 class="profilePhoto">사진</td>
									<td class="memberInfo">${item.userName}</td>
								</tr>
							</table>
						</li>
						<hr/>
					</c:forEach>
				</ul>			
			</div>
			<div id="groupWriteContainer">
				<form id="insertWrite" action="insertGroupWrite.y" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userId" value="${loginUser.userId}"/>
					<input type="hidden" name="groupNo" value="${group.groupNo}"/>
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
				<form action="deleteGroupWrite.y">
					<div class="writeList">
						<div>
							<div class="window">
								<div id="messageArea">정말 삭제 하시겠습니까?</div>
								<div id="deleteBtnArea">
									<input type="submit" id="deleteBtn" value="삭제"/>
									<input type="hidden" value="${item.writeNo}">
									<input type="button" id="cancelBtn" value="취소"/>
								</div>
						    </div>
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
										<td><input type="button" class="like" value="좋아요"/></td>
										<c:if test="${item.userId == loginUser.userId}">
											<td><input type="button" class="update" value="수정"/></td>
											<td><input type="button" class="openMask" value="삭제"/></td>
											<input type="hidden" value="${item.writeNo}"/>
										</c:if>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</form>
			</c:forEach>
		</div>
		<div id="right" class="box">
			<h2>친구목록</h2>
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