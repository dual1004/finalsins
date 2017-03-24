<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/jindo.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/notice/noticeModify.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script>
	$(function(){
		if($("p").height() <= 500){
			$("p").css("height", "500px");
		}
	});
	
	
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
	}
	
	var oEditors = [];
	$(function(){
	   
	   
	   nhn.husky.EZCreator.createInIFrame({
	       oAppRef: oEditors,
	       elPlaceHolder: "textAreaContent",
	       sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",
	       fCreator: "createSEditor2"
	   });
	});

	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	 
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	  
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {
	     
	    }
	}
</script>
<style type="text/css">
#noticeDetailTable{
	border-collapse : collapse;
	width : 600px;
	text-align: center;
	border-top : 3px solid;
	border-bottom : 3px solid;
}
#noticeDetailTable td{
	border-bottom : 1px solid;
}
#adminModifyBtn{
	width : 600px;
	text-align : right;
	margin-bottom : 10px;
}
#ftd {
	font-size : 16pt;
	font-weight : bold;
	background-color : #9581BF;
}
#std {
	text-align : left;
	font-size : 9pt;
	background-color : lightgray;
}
#std label {
	text-align : center;
	padding-right : 5px;
	font-weight : bold;
}
#ttd {
	font-size : 10pt;
	background-color : lightgray;
	text-align : left;
	
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
				<li><a href="alink.do?path=channelListView/channelList">채널</a></li>
				<li><a href="selectGroupList.y">그룹</a></li>
				<li><h4>뉴스피드</h4></li>
				<li id="notice">고객센터</li>
				<li class="notice"><a href="selectNotice.k">└공지사항</a></li>
	          	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
			</ul>
		</div>
		
		<div id="content" class="box">
			<strong id="titleFont">공지사항</strong>
			<div id="noticeModifyDiv">
				<br />
				<hr />
				<br />
				<table id="noticeModifyTable" style='text-align: center;'>
					<tr>
						<td id="ftd">
							<label id="title">${notice.title} : </label><input type="text" name="title" />
						</td>	
					</tr>
					<tr>
						<td id="std" >
							<textarea rows="500px" cols="100%" id="textAreaContent"></textarea>
						</td>
					</tr>
					<tr><td id="ttd"><p id="contentP">${notice.content}</p></td></tr>
					
				</table>
				
				<br>
				<hr />

			</div>
		</div>
		
		<div id="right" class="box">
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

	</div> 
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>