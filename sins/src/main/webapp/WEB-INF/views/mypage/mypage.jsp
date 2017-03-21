<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/mypage/mypage-common.css" />
	<script type="text/javascript" src='<c:url value='/resources/smarteditor/js/service/HuskyEZCreator.js'/>' charset="utf-8"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				jQuery.fn.center = function() {
					this.css("position", "absolute");
					this.css("top", Math.max(0, (($(window).height() - $(this)
							.outerHeight()) / 2)
							+ $(window).scrollTop())
							+ "px");
					this.css("left", Math.max(0, (($(window).width() - $(this)
							.outerWidth()) / 2)
							+ $(window).scrollLeft())
							+ "px");
					return this;
				}

				$(".openMask").click(function(e) {
					e.preventDefault();
					wrapWindowByMask();
				});

				//닫기 버튼을 눌렀을 때
				$(".window .close").click(function(e) {
					//링크 기본동작은 작동하지 않도록 한다.
					e.preventDefault();
					$("#mask, .window").hide();
				});

				//검은 막을 눌렀을 때
				$("#mask").click(function() {
					$(this).hide();
					$(".window").hide();

				});

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

				$("#12").click(function() {
					var isHidden = $(".11").is(":hidden");
					if (isHidden) {
						$(".11").show(100);
						$(".score_textarea").show(100);
					} else {
						$(".11").hide(100);
						$(".score_textarea").hide(100);
					}

				});
				
			});
</script>
<script>

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
	
    //좋아요 -> 취소
      $(document).on("click",".like", function(){
    	  
    	    var mylike = $(this).prev().val();
      		var writeNo = $(this).next().val();
      		if(writeNo == null){
      			writeNo = $(this).parent().next().val();
      			mylike = $(this).parent().prev().val();
      		}
      			mylike-=(-1);
      		var userid = '${loginUser.userId}';
      		var parent = $(this).parent();
      		
      		
      		$.ajax({
      			url : 'mypageLike.b?writeNo=' + writeNo + '&userid=' + userid
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="unlike2" value="좋아요 취소${check}"/>');				
      					
      			
      			}
      		}); 
      });
    
    //좋아요 -> 취소
      $(document).on("click",".like2", function(){
    	  
    	    var mylike = $(this).prev().val();
      		var writeNo = $(this).next().val();
      		if(writeNo == null){
      			writeNo = $(this).parent().next().val();
      			mylike = $(this).parent().prev().val();
      		}
      			
      		var userid = '${loginUser.userId}';
      		var parent = $(this).parent();
      		
      		
      		$.ajax({
      			url : 'mypageLike.b?writeNo=' + writeNo + '&userid=' + userid
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="unlike2" value="좋아요 취소${check}"/>');				
      					
      			
      			}
      		}); 
      });

      //취소 -> 좋아요
      	$(document).on("click",".unlike", function(){

      		 var mylike = $(this).prev().val();
       		var writeNo = $(this).next().val();
       		if(writeNo == null){
       			writeNo = $(this).parent().next().val();
       			mylike = $(this).parent().prev().val();
       		}
       		mylike -= 1;
       		var userid = '${loginUser.userId}';
       		var parent = $(this).parent();
      		
      		$.ajax({
      			url : 'MypageUnLike.b?userid=' + userid + '&writeNo=' + writeNo
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="like2" value="좋아요${check}"/>');	
      				
      			}
      		});
      	});
      
      
      	 //취소 -> 좋아요
      	$(document).on("click",".unlike2", function(){

      		 var mylike = $(this).prev().val();
       		var writeNo = $(this).next().val();
       		if(writeNo == null){
       			writeNo = $(this).parent().next().val();
       			mylike = $(this).parent().prev().val();
       		}
     
       		var userid = '${loginUser.userId}';
       		var parent = $(this).parent();
      		
      		$.ajax({
      			url : 'MypageUnLike.b?userid=' + userid + '&writeNo=' + writeNo
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="like" value="좋아요${check}"/>');	
      				
      			}
      		});
      	});
      	 
     // 댓글 클릭 시, 댓글 리스트 보여주기
        $(".comment").on("click", function(){
        	
        	var writeNo = $(this).parent().next().val();
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
      	 
      	 
      	
	
	var editor_object = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: editor_object,
		elPlaceHolder:"contents",
		sSkinURI:"/sins/resources/smarteditor/SmartEditor2Skin.html",
		 fCreator: "createSEditor2",
		/* htParams:{
			bUseToolbar:true,
			bUseVerticalResizer:true,
			bUseModeChanger:true,
			
		}
	 */
	  

	});
	$("#submitBtn").click(function(){

		if($("#title").val().length>0){
			editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD",[]);

			$("#write_form").submit();
			
		}
			
		else{
			alert("제목을 입력해주세요.");
			
		}
		
	});
	
	
	$('#rev').hide(); 
	
	
});

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


//글삭제용
function deleteWrite(writeno) {
    mask();
     
    //삭제윈도우를 띄운다.
      $(".deleteWindow").show();
    
      $("#deleteBtn").click(function() {
    	  location.href = "mypageDelete.b?writeno=" + writeno + "&pageid=" + '${memberUser.userId }';
    	  
      });
 }
 
 //댓글 삭제용
function deleteWrite(writeno) {
    mask();
     
    //삭제윈도우를 띄운다.
      $(".deleteWindow2").show();
    
      $("#deleteBtn2").click(function() {
    	  location.href = "mypageCommentDelete.b?writeno=" + writeno + "&pageid=" + '${memberUser.userId }';
    	  
    	  
      });
 }
 
 // main화면에서 수정버튼 클릭 시 작동.
 function updateWritePage(writeno, content, filepath) {
    mask();
    $("#updateContent").val(content);
	$("input[name=writeno]").val(writeno);
	$("input[name=filepath]").val(filepath);
	$("input[name=file]").val(filepath);
    $(".updateWindow").show();
 }
 
 
 
 
</script>
<script type="text/javascript">



</script>
<style type="text/css">
/* 팝업 */
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

/* 팝업으로 뜨는 윈도우 css  */
.window {
	display: none;
	position: absolute;
	width: 30%;
	height: 20%;
	background-color: #FFF;
	z-index: 10000;
}

/* 게시글 목록  */
.writeList {
	width: 100%;
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

.content2 {
	width: 560px;
	padding: 20px;
	background-color: #E7E4F9;
}

@media screen and (max-width:500px) {
	.content2, .t1, .t2, .t3 {
		overflow: hidden;
		float: none;
		width: auto;
		margin: auto;
	}
}

.pro {
	width: 30px;
	height: 30px;
}

.t1 {
	width: 100px;
}

.t2 {
	width: 500px;
}

.t3 {
	width: 500px;
	border-collapse: collapse;
	borer: 1px solid black;
	text-align: center;
}

/* 댓글 */
.score_textarea {
	position: relative;
	float: right;
	width: 500px;
	border-left: 1px solid #dedede;
	padding-right: 118px;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.score_textarea textarea {
	width: 350px;
	height: 50px;
	border: none;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	font-size: 18px;
	color: #666
}

.score_textarea .btn_entry {
	position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 60px;
	height: 50px;
	background: #231f20;
	font-size: 18px;
	font-weight: bold;
	color: #cdc197;
	text-align: center;
	line-height: 50px;
	border: 0;
	border-radius: 15px 15px 15px 15px;
	outline: none;
} /*1113*/
.score_etc {
	position: absolute;
	right: 0;
	top: -12px;
	font-size: 13px;
	color: #666
}
</style>
</head>
<body>
<div id="mask"></div>
<!-- 글삭제 -->
   <div class="deleteWindow window">
      <div id="deleteMessageArea">정말 삭제 하시겠습니까?</div>
      <div id="deleteBtnArea">
         <input type="button" id="deleteBtn" value="삭제"/>
         <input type="button" class="cancelBtn" value="취소"/>
      </div>
    </div>
    <!-- 댓글삭제 -->
    <div class="deleteWindow2 window">
      <div id="deleteMessageArea">정말 삭제 하시겠습니까?</div>
      <div id="deleteBtnArea">
         <input type="button" id="deleteBtn2" value="삭제"/>
         <input type="button" class="cancelBtn" value="취소"/>
      </div>
    </div>
    <!-- 글 수정 -->
    <div class="updateWindow window">
       <form action="mypageUpdate.b" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
          <div id="updateMessage">
             <textarea id="updateContent" name="txtComment"></textarea>
          </div>
          <div id="updateBtnArea">
          <input type="file" name="file"/>
             <input type="submit" id="updateBtn" value="수정"/>
             <input type="button" class="cancelBtn" value="취소"/>
             <input type="hidden" name="writeno"/>
             <input type="hidden" value="${memberUser.userId }" name="pageid">
            <input type="hidden" name="filepath"/>
            
          </div>
       </form>
    </div>
    <!-- 댓글 수정 -->








	<div id="mask"></div>
	<div class="window"></div>



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

			<center>
				<h2>Mypage</h2>
				<c:if test="${memberUser.userProfile != null}">
				<img src="${memberUser.userProfile}" style="width: 160px; height: 160px;">
				</c:if>
				<c:if test="${memberUser.userProfile eq null}">
				<img src="/sins/resources/images/missingNO.jpg" style="width: 160px; height: 160px;">
				</c:if>
				
				<h3>${ memberUser.userName }님</h3>
				<br> ${ memberUser.phone }<br>
				<h4>
					<a href="mypage.b">MyPage</a>
				</h4>
				<h4>
					<a href="alink.do?path=mypage/mypageFriend">친구 목록 보기</a>
				</h4>
				<h4>
					<a href="mypagePoto.b">사진 보기</a>
				</h4>
				<h4>
					<a href="mypageDetail.b">정보 보기</a>
				</h4>
			</center>
		</div>
		<div id="content">
			<form id="mypageform2" enctype="multipart/form-data" method="post" action="mypageInsert.b" accept-charset="UTF-8">
				<div class="content2">
					<h2>글 작성 하기</h2>
					<input type="hidden" value="${memberUser.userId }" name="pageid">
					<textarea id="txtContent" name="txtContent" cols="90" rows="9"></textarea>
					<input type="file" name="file"> <select name="select">
						<option value="0" selected>전체 공개
						<option value="1">친구 공개
						<option value="2">나만 보기
					</select> <input type="submit" class="btn_entry Lang-LBL0000"
						href="javascript:void(0)" id="btnSave" value="입력">

				</div>
				
			</form>
		
         <br>
         <!-- 윤진호 부분 -->
					<c:forEach var="item" items="${mylist}">
					<form id="mypageform" action="mypage2.b">
						<input type="hidden" name="userid" value="${memberUser.userId }" />
						<table class="t1">
							<tr>
								<td><input type="submit"><img
									src="${item.userprofile }" class="pro"></td>
								<td><input type="submit">
									<h5>${item.username }</h5></td>
							</tr>
						</table>
					</form>
						<div class="writeList">
							<div>
								<table class="writerInfo">
									<tr class="writerInfoTr">
									
										<td class="writerPhoto" rowspan="2">
										<c:if test="${item.userprofile != null}">
				<img src="${item.userprofile}" style="width: 30px; height: 30px;">
				</c:if>
				<c:if test="${item.userprofile eq null}">
				<img src="/sins/resources/images/missingNO.jpg" style="width: 30px; height: 30px;">
				</c:if></td>
										<td class="writerName">${item.username}</td>
									</tr>
									<tr>
										<td class="writeDate">${item.writedate}</td>
									</tr>
								</table>
								<div class="contentContainer">
									${item.content}
									<br>
									<c:if test="${not empty item.filepath}">
        		<c:forTokens var="pic" items="jpg,jpeg,bmp,png,gif" delims=",">
   				<c:if test="${fn:split(item.filepath,'.')[1] eq pic}">
				<center><img src="${pageContext.request.contextPath}/resources/file/${item.userid}/${item.filepath}" style="width: 480px; " /></center>
				</c:if>
        		</c:forTokens>
        		
   				<c:if test="${fn:split(item.filepath,'.')[1] eq 'mp4'}">
   				<center>
				<video width="480" height="360" controls>
  				<source src="${pageContext.request.contextPath}/resources/file/${item.userid}/${item.filepath}" type="video/mp4">
  				</video>
  				</center>
				</c:if>
        		</c:if>
								</div>
								<div class="buttonContainer">
									<table>
									<tr><td>
										<c:if test="${not empty item.filepath}">
        		<a href="download.p?userId=${item.userid}&fileName=${item.filepath}">${fn:split(item.filepath,'=')[1]}</a>
        		                        </c:if>
        		                        <c:if test="${empty item.filepath}">
        		                                                첨부파일 없음
        		                        </c:if>
									</td></tr>
										<tr>
											
											<c:set var="check" value="0"/>
											<c:forEach var="like" items="${likeList}">
											<c:if test="${like.writeNo == item.writeno && check == 0}">
												<c:set var="check" value="1"/>
											</c:if>
										</c:forEach>
											<input type="hidden" class="mylike" value="${item.writelike}"/>
										<c:if test="${check == 1}">
											<td>
											<input type="hidden" class="mylike" value="${item.writelike}"/>
											${item.writelike}명이 좋아합니다.
											<input type="button" class="unlike" value="좋아요 취소"/>
											<input type="hidden" class="writeNo" value="${item.writeno}"/>
											</td>
										</c:if>	
										<input type="hidden" class="mylike" value="${item.writelike}"/>
										<c:if test="${check == 0}">
											<td>
											<input type="hidden" class="mylike" value="${item.writelike}"/>
											${item.writelike}명이 좋아합니다.
											<input type="button" class="like" value="좋아요"/>
											<input type="hidden" class="writeNo" value="${item.writeno}"/>
											</td>
										</c:if>
										<input type="hidden" class="writeNo" value="${item.writeno}"/>
											<c:if test="${item.userid == loginUser.userId}">
												<td><input type="button" class="update" 
													onclick="updateWritePage(${item.writeno}, '${item.content}', '${filepath}');"value="수정"/></td>
												<td><input type="button" class="deleteWrite" 
													onclick="deleteWrite(${item.writeno});"value="삭제"/></td>
											</c:if>
											<c:if test="${item.userid != loginUser.userId}">
											<td><input type="button" class="report" 
												onclick="reportWrite('${item.userid}', ${item.writeno});" value="신고"/></td>
										</c:if>
										<td><input type="button" class="comment" value="댓글"/></td>
										<td><input type="hidden" class="writeNo" value="${item.writeno}"/></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						
						<c:forEach var="item2" items="${mycolist}">
						<c:if test="${item2.contentno eq item.writeno }">

							<div class="11">
								<table class="t1">
									<tr>
										<td><c:if test="${item2.userprofile != null}">
				<img src="${item2.userprofile}" style="width: 30px; height: 30px;">
				</c:if>
				<c:if test="${item2.userprofile eq null}">
				<img src="/sins/resources/images/missingNO.jpg" style="width: 30px; height: 30px;">
				</c:if></td>
										<td><div style="width: 50px;">
												<h5>${item2.username}</h5>
											</div></td>
										<td>
											<table class="t2">
												<tr>
													<td>
														<form action="mypageCommentUpdate.b">
														<textarea name="txtComment">${item2.content }</textarea>
															 <input
																type="hidden" name="writeno" value="${item2.commentno}">
															<input type="hidden" value="${memberUser.userId }"
																name="pageid">
																<input type="submit" value="수정">
														</form>
														<form action="mypageCommentDelete.b">
															<input type="button" class="deleteWrite2" 
													onclick="deleteWrite(${item2.commentno});"value="삭제"/>
															<input type="hidden" name="writeno"
																value="${item2.commentno}"> <input type="hidden"
																value="${memberUser.userId }" name="pageid">
														</form>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
                                
							</div>

						</c:if>
					</c:forEach>
					<form id="mypageform3" action="mypageComment.b">
						<div class="score_textarea">
							<input type="hidden" value="${memberUser.userId }" name="pageid">
							<input type="hidden" value="${item.writeno }" name="writeno">
							<textarea id="txtComment" name="txtComment" title="댓글 입력"
								placeholder="댓글을 입력하세요!" cols="23" rows="9"
								style="outline: none;" onclick="docheck()"
								onkeyup="javascript:doleft();"></textarea>

							<input type="submit" class="btn_entry Lang-LBL0000"
								href="javascript:void(0)" id="btnSave" value="입력">
						</div>
					</form>
					
					</c:forEach>
				
         <!-- 윤진호 -->
			<br>
			
				<!-- 조건문들 -->
				<c:if test="${item.userid eq memberUser.userId }"></c:if>
				<c:if test="${not item.filepath eq null}"></c:if>

				

				<br>

			

		</div>


		<div id="right" class="box">
			<h2>RIGHT</h2>
			<ul>
				<li>Lorem</li>
				<li>Ipsum</li>
				<li>Dolor</li>
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