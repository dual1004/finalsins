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
	
	var comment = $("#comment").val();
	
	
	 if(comment.length!=0){
		
		 
		 $.ajax({
			
			   url : 'insertCom.n?qnaNo=${qna.qnaNo}&lev=0&content='+comment ,
					   
			   dataType: "json",
			
			   contentType: "application/json; charset=utf-8",
			
			   success : function(result){
			
				   
			    var tag=""; 
			
				tag+="<br/><table>";
				   
				for(var i =0; i<result.comList.length;i++){
				
			
				tag+="<tr><td>"+result.comList[i].userId+"</td><td>"+result.comList[i].content+"</td>";
				
				tag+="<td>";
				
					if(${loginUser} == result.comList[i].userId){
					tag+="<a href='comDelete.n?qNo="+result.comList[i].qnaNo+"&comNo="+result.comList[i].commentNo+">삭제하기</a>";
							
					tag+="</td></tr>";
				
					
					}

				}
				
				tag+="</table>";
				   
				   
				$("#comLocation").html(tag);
				
				
			       alert(result.comList[0].content);
			  	 $("#comment").html("");
			  	 
			  	 
			  	 
			  	 

			   } 
			
			   
			
			 });

		 
		
	}else{
		alert("댓글을 입력해주세요.");
	} 
	
	
});




</script>
<style>

#detailDiv{
	width:600px;
	min-height:300px;
	height:auto;
	border:1px solid;
}
#comLocation{
	width:600px;
	min-height:200px;
	height:auto;
	border:1px solid;
	border-color:blue;
}
#comForm{
	width:600px;
	min-height:100px;
	height:auto;
	border:1px solid;
	border-color:red;
	margin:auto;
}

.labels{
font-size:11px;
float:left; 

}

.buttons{
/* position:relative;*/
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
<label class="labels">전체 댓글 수 : <strong>${commentCount }</strong></label>
<br><br>
<div id="comLocation" >
<br/>


<table>
<c:forEach var="comment" items="${commentList}">
<tr><td>${comment.userId }</td><td>${comment.content }</td>
<td><c:if test="${loginUser.userId eq comment.userId }"><a href="comDelete.n?qNo=${qna.qNo }&comNo=${comment.commentNo}">삭제하기</a></c:if></td></tr>


</c:forEach>

</table>

</div>
<hr/>

<div id="comForm">
<textarea id="comment" rows="4" cols="50" style="overflow:hidden; float:left;"></textarea>


<button id="submitBtn"  style='left:120px;' class="buttons">등록하기</button>


</div>
<hr/>


</div>




</body>
</html>