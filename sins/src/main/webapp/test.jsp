<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>


<script>
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
<h2><strong>제목</strong> <button style="left:550px;" class="buttons">질문하기</button></h2>
<hr/>
<label style="left:450px; " class="labels">날짜</label>
<label style="left:550px; " class="labels">조회수</label>
<br>
<hr/>
<table>
<tr><td>사진</td><td>내용</td></tr>
<tr><td></td><td><br>아이디 </td></tr>
</table>
<br>
<hr/>
<label class="labels">전체 댓글 수</label>
<br><br>
<div id="commentDiv" style='position:relative; height:80px;' >


<textarea name="" rows="4" cols="50" style="overflow:hidden; position:relative; float:left; left:60px;"></textarea>

<button id="submitBtn"  style='left:120px;' class="buttons">등록하기</button>


</div>
<hr/>


</div>




</body>
</html>