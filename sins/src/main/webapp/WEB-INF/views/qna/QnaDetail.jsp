<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
<script>



$(document).on("click","#submitBtn", function(){
	
	
	alert($("#comment").val());
	
	
});

</script>
<style>
#detailDiv{
	width:600px;
	height:500px;
}

.labels{
font-size:11px;
position:relative; 
float:left; 

}

.buttons{
position:relative;
float:left;
}

</style>
<title></title>
</head>
<body>


 <div id= "detailDiv">
<h2><strong>${qna.title }</strong> <button style="left:480px;" class="buttons">질문하기</button></h2>
<hr/>
<label style="left:400px; " class="labels">작성일 : ${qna.writeDate }</label>
<label style="left:420px; " class="labels">조회수 : ${qna.readCount }</label>
<br>
<hr/>
<table>
<tr><td>[사진]</td><td> ${qna.content }</td></tr>
<tr><td></td><td><br>이름 or 아이디 : ${qna.userId } </td></tr>
</table>
<br>
<hr/>
<label class="labels">전체 댓글 수</label>
<br><br>
<div id="commentDiv" style='position:relative; height:80px;' >

<div id="comLocation">


</div>
<textarea id="comment" rows="4" cols="50" style="overflow:hidden; position:relative; float:left; left:60px;"></textarea>


<button id="submitBtn"  style='left:120px;' class="buttons">등록하기</button>


</div>
<hr/>


</div>




</body>
</html>