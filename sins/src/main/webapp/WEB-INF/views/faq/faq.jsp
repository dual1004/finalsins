<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/faq/faq.css" />
    
<script type="text/javascript">
$( document ).ready(function() { 
    $('#t-l').click(function(){ 
     	$('#spot1, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot1, #overlay_t').hide(); 
	});
 	$('#t-r').click(function(){ 
     	$('#spot2, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot2, #overlay_t').hide(); 
	});
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice").click(function(){
 		if(noticeMenuStatus == 0){
 			noticeMenuStatus = 1;
 			$(".notice").slideDown("slow");
 		}
 		else {
 			noticeMenuStatus = 0;
 			$(".notice").slideUp("slow");
 		}
 		
 	});
 	
 	$(".answerTr").hide();
 	
 	var nowIndex = -1;
 	
 	$(".questionTr").click(function(){
 		var index = $(this).index();
 		if(nowIndex < 0 && nowIndex != index){
 			$(this).next($(".answerTr")).slideDown("slow");
 			nowIndex = index;
 		}
 		else if(nowIndex >= 0 && nowIndex == index){
 			$(this).next($(".answerTr")).slideUp("slow");
 			nowIndex = -1;
 		}
 		else if(nowIndex >= 0 && nowIndex != index) {
 			$(".answerTr").slideUp("slow");
 			$(this).next($(".answerTr")).slideDown("slow");
 			nowIndex = index;
 		}
 		
 		console.log(index);
 	});
 	
});
</script>
  </head>
  <body>
  		<div id="header">
	      	<div id="overlay_t"></div> 
	      	<div id="t-l"></div>
	      	<div id="top"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
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
        <strong id="titleFont">FAQ</strong>
        <div id="qnaDiv">
   			<br/>
        	<hr/>
			<br/>
			<table id="qnaTable" style='text-align: center;' align="center">
				<tr class="questionTr"><td><div class="questionDiv">회원탈퇴는 어떻게 하나요?</div></td></tr>
				<tr class="answerTr"><td><div class="answerDiv">회원 탈퇴는 화면 상단에 내정보보기 버튼을 누르신후 <br/>내정보보기 페이지에 본인 아이디 뒤에 회원탈퇴 버튼이<br/> 생성되어 있습니다.</div></td></tr>
				<tr class="questionTr"><td><div class="questionDiv">회원탈퇴는 어떻게 하나요?</div></td></tr>
				<tr class="answerTr"><td><div class="answerDiv">회원 탈퇴는 화면 상단에 내정보보기 버튼을 누르신후<br/>내정보보기 페이지에 본인 아이디 뒤에 회원탈퇴 버튼이<br/> 생성되어 있습니다.</div></td></tr>
				<tr class="questionTr"><td><div class="questionDiv">회원탈퇴는 어떻게 하나요?</div></td></tr>
				<tr class="answerTr"><td><div class="answerDiv">회원 탈퇴는 화면 상단에 내정보보기 버튼을 누르신후<br/>내정보보기 페이지에 본인 아이디 뒤에 회원탈퇴 버튼이<br/> 생성되어 있습니다.</div></td></tr>
				<tr class="questionTr"><td><div class="questionDiv">회원탈퇴는 어떻게 하나요?</div></td></tr>
				<tr class="answerTr"><td><div class="answerDiv">회원 탈퇴는 화면 상단에 내정보보기 버튼을 누르신후<br/>내정보보기 페이지에 본인 아이디 뒤에 회원탈퇴 버튼이<br/> 생성되어 있습니다.</div></td></tr>
				<tr class="questionTr"><td><div class="questionDiv">회원탈퇴는 어떻게 하나요?</div></td></tr>
				<tr class="answerTr"><td><div class="answerDiv">회원 탈퇴는 화면 상단에 내정보보기 버튼을 누르신후<br/>내정보보기 페이지에 본인 아이디 뒤에 회원탈퇴 버튼이<br/> 생성되어 있습니다.</div></td></tr>
				<tr class="questionTr"><td><div class="questionDiv">회원탈퇴는 어떻게 하나요?</div></td></tr>
				<tr class="answerTr"><td><div class="answerDiv">회원 탈퇴는 화면 상단에 내정보보기 버튼을 누르신후<br/>내정보보기 페이지에 본인 아이디 뒤에 회원탈퇴 버튼이<br/> 생성되어 있습니다.</div></td></tr>
			</table>
        </div>
        
      </div>
      <div id="right" class="box">
        <%@include file="/WEB-INF/views/friend/friendView.jsp" %>
      </div>
    </div>
     <div id="footer">
        <c:import url="../common/footer.jsp" charEncoding="UTF-8" />
      </div>
    <div id="spot1"></div>
    <div id="spot2"></div>
  </body>
</html>