<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/sins/WEB-INF/common/js/jquery-3.1.1.min.js"></script>
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
<h2><strong>제목</strong> <button style="left:600px;" class="buttons">질문하기</button></h2>
<hr/>
<label style="left:500px; " class="labels">날짜</label>
<label style="left:600px; " class="labels">조회수</label>
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
<div id="commentDiv" style='border:1px solid; height:100px;' >

<!-- <textarea name="" rows="4" cols="55" style="overflow:hidden; position:relative; float:left; left:100px;"></textarea>
 -->

<button id="submitBtn"  class="buttons">등록하기</button>

</div>



</div>




</body>
</html>