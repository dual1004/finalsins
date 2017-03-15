<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 <script>
 
 $(document).on("click", "#subBtn", function(){
	 var birth=$("#birth option:selected").val();
		var userName=$("#userName").val().length;
		var address= $("#address").val().length;
		
		var phone=$("#phone").val().length;
		 
		if(birth==0 && userName==0 && address==0 && phone==0){
			alert("4가지 항목중 한가지이상 입력해주세요.")
		}
		else{
			$("#findForm").submit();
		}
			
 });
 
	
	
		 
	 
 
 
 </script>
  
<title></title>
<style>
.textsize{
width:110px;
font-size:8px;
}
.btnsize{
width:50px;
margin-left:60px;
}



</style>
</head>
<body>

<div id="page">
<br><h2 align="center">친구 찾기</h2><br>
				<hr>
				
				
<div id="find" style='margin-left:10px; margin-top:50px; margin-bottom:50px;'>
<form id=findForm action="friendFind.n" method="post">

<label class="font8pt">이름</label><br>
<input id="userName" class="textsize" name="userName" placeholder="이름을 입력하세요"><br><br>
<label class="font8pt">출생년도</label><br>



<% int year=java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
%>


<select class="textsize" name="birth" id="birth">
<c:forEach varStatus="status" begin="1900" end="<%=year %>">
<option>${status.index }</option>

</c:forEach>
<option value="0" selected>년도 선택</option>

</select><br><br>
<label class="font8pt">주소</label><br>
<input id="address" class="textsize" name="address" placeholder="도시를 입력하세요"><br><br>
<label class="font8pt">전화번호</label><br>
<input id="phone" class="textsize" type="tel" name="phone" placeholder="전화번호를 입력하세요"><br><br>

<input id="subBtn" class="btnsize" type="button" value="찾기">



</form>




</div>
<br>
<hr>
</div>

</body>
</html>