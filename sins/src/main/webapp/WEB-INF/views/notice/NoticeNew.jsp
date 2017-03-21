<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/jindo.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/notice/noticeNew.css" />
	
<script>
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
function submitContents() {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
    	$("#write_form").submit();
    } catch(e) {
     
    }
}
 
// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML ="<img src='${pageContext.request.contextPath}/resources/file/temp/"+filepath+"' style='width:300px; height:300px;'>";
 
  
    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
    
}
</script>

<style type="text/css">
	.titleFont {
		font-size : 18pt;
	}
	#submitBtn {
		width : 100px;
		margin-left : 498px;
	}
	#title{
		width : 549px;
	}
</style>

</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"><%@include file="/WEB-INF/views/common/top.jsp"%></div>
		<div id="t-r"></div>
	</div>
	<div id="container" >
		<div id="left" class="box">
			<h2>left</h2>
			<br>
			<ul>

			</ul>
		</div>
		<div id="content" class="box" >
			<strong class="titleFont">공지사항</strong><br><br>
			<div id="writeForm" style='width:600px;'>
			<hr/>
			<br/>
				<form id="write_form" action="noticeWrite.k" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
					제목 : <input id="title" name="title" />
					<br/><br/>
					<textarea style="width: 100%" rows="10" name="content" id="textAreaContent" cols="80"></textarea>
					<br/>
					<br/>
					<input type="button" id="submitBtn" value="작성완료" onclick="submitContents()"/>
				</form>
			</div>
			<br/>
			<hr/>
		</div>
		<div id="right" class="box">
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer"><%@include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>