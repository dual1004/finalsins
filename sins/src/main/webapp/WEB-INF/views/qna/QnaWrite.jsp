<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Q&A</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src='<c:url value='/resources/smarteditor/js/service/HuskyEZCreator.js'/>' charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>

<script src="/sins/resources/js/qna/qna.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />

</head>

<script>

$(function(){
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






</script>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"><%@include file="/WEB-INF/views/common/top.jsp"%></div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
			<h2>left</h2>
			<br>
			<ul>

			</ul>
		</div>
		<div id="content" class="box">
			<strong class="titleFont"><a href="selectQna.n" class="atag">Q&A</a> - 문의하기</strong><br><br>
		
		<div id="writeForm" style='width:600px;'>
			<form id="write_form" action="write.n" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			
				
					
					
					제목 <input id="title" name="title" style='width:530px;'/>
				
				<br><br>
						
					<input id="contents" name="content"/>
				<br>
				
				<input type="file" name="uploadFile" value="파일선택"/>
			
				<input type="button" id= "submitBtn" value="작성" style='position:relative; float:left; left:470px; width:100px;'/>
			</form>

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