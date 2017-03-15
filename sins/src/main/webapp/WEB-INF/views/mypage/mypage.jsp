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
	href="/sins/resources/css/mypage/mypage-common.css" />

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
				<img src="" style="width: 160px; height: 160px;">
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
			<form id="mypageform2" action="mypageInsert.b">
				<div class="content2">
					<h2>글 작성 하기</h2>
					<input type="hidden" value="${memberUser.userId }" name="pageid">
					<textarea id="txtContent" name="txtContent" title="글 입력"
						placeholder="글을 작성해 보세요!" cols="23" rows="9"
						style="outline: none;" onclick="docheck()"
						onkeyup="javascript:doleft();"></textarea>
					<input type="file"> <select name="select">
						<option value="0" selected>전체 공개
						<option value="1">친구 공개
						<option value="2">나만 보기
					</select> <input type="submit" class="btn_entry Lang-LBL0000"
						href="javascript:void(0)" id="btnSave" value="입력">




				</div>
			</form>
			<%-- 
                         예비 폼        
        <br>
        <c:forEach var="item" items="${mylist}">
            <div class="content2">
               <div>
                  <table class="writerInfo">
                     <tr class="writerInfoTr">
                        <td class="writerPhoto" rowspan="2">사진</td>
                        <td class="writerName">${item.username}</td>
                     </tr>
                     <tr>
                        <td class="writeDate">${item.writedate}</td>
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
                           <c:if test="${item.userid == loginUser.userId}">
                              <td><input type="button" class="update" value="수정"/></td>
                              <td><input type="button" class="openMask" value="삭제"/></td>
                              <input type="hidden" value="${item.writeno}"/>
                           </c:if>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </c:forEach> --%>
			<br>
			<c:forEach var="item" items="${mylist}">
				<!-- 조건문들 -->
				<c:if test="${item.userid eq memberUser.userId }"></c:if>
				<c:if test="${not item.filepath eq null}"></c:if>

				<div class="content2">
					<form id="mypageform" action="mypage2.b">
						<input type="hidden" name="userid" value="${item.userid }" />
						<table class="t1">
							<tr>
								<td><input type="submit"><img
									src="${item.userprofile }" class="pro"></td>
								<td><input type="submit">
									<h5>${item.username }</h5></td>
							</tr>
						</table>
					</form>
					<c:if test="${item.userid eq memberUser.userId }">
						<a>수정하기</a>
						<form action="mypageDelete.b" id="delete">
							<input type="hidden" value="${item.writeno }" name="writeno">
							<input type="hidden" value="${memberUser.userId }" name="pageid">
							<input type="submit" value="삭제">
						</form>
					</c:if>

					<br>
					<table class="t2">
						<tr>
							<td>${item.content }</td>
						</tr>
						<tr>
							<td><img src="${item.filepath }"></td>
						</tr>
					</table>
					<br>
					<table class="t3">
						<tr>
							<td><input type="submit" value="좋아요" onclick=""></td>
							<td><input type="button" value="댓글" id="12"></td>
						</tr>
					</table>

					<c:forEach var="item2" items="${mycolist}">
						<c:if test="${item2.contentno eq item.writeno }">

							<div class="11">
								<table class="t1">
									<tr>
										<td><img src="${item2.userprofile}" class="pro"></td>
										<td><div style="width: 50px;">
												<h5>${item2.username}</h5>
											</div></td>
										<td>
											<table class="t2">
												<tr>
													<td>
														<form action="mypageCommentUpdate.b">
														<textarea name="txtComment">${item2.content }</textarea>
															<input type="submit" value="수정"> <input
																type="hidden" name="writeno" value="${item2.commentno}">
															<input type="hidden" value="${memberUser.userId }"
																name="pageid">
														</form>
														<form action="mypageCommentDelete.b">
															<input type="submit" value="삭제">
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
				</div>

				<br>

			</c:forEach>

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