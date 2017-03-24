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
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/member/modifySuccess.css" />
    <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
    
<script type="text/javascript">
$( document ).ready(function() { 
    
	$("#t-l").click(function(){ 
		$("#spot1, #overlay_t").show();
	}); 
 	$("#overlay_t").click(function(e){ 
     	e.preventDefault(); 
     	$("#spot1, #spot2, #overlay_t").hide(); 
	});
 	$("#t-r").click(function(){ 
 		$("#spot2, #overlay_t").show();
 	}); 
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice1, #notice2").click(function(){
 		if(noticeMenuStatus == 0){
 			noticeMenuStatus = 1;
 			$(".notice").slideDown("slow");
 		}
 		else {
 			noticeMenuStatus = 0;
 			$(".notice").slideUp("slow");
 		}
 		
 	});
});

</script>
  </head>
  <body>
  		<div id="header">
      	<div id="overlay_t"></div> 
      	<div id="t-l"></div>
      	<div id="top"></div>
       	<div id="t-r"></div>
      </div>
    <div id="container">
      <div id="left" class="box">
        <ul>
          <li><a href="alink.do?path=mypage/mypage">MyPage</a></li>
          <li><a href="alink.do?path=channelListView/channelList">채널</a></li>
          <li><a href="selectGroupList.y">그룹</a></li>
          <li><h4>뉴스피드</h4></li>
          <li><a href="selectQna.n">고객센터</a></li>
        </ul>
      </div>
      <div id="content" class="box">
        <div id="resultdiv">
        	<p><label class="c">${loginUser.userName}</label>님의 <label class="c">${message}</label> 정보가 정상적으로 수정되었습니다.</p><br/>
        	<a href="alink.do?path=member/myInfo">내 정보 보기</a>
        </div>
       	
        
      </div>
      <div id="right" class="box">
        <%@include file="/WEB-INF/views/friend/friendView.jsp" %>
      </div>
    </div>
     <div id="footer">
        <c:import url="../common/footer.jsp" charEncoding="UTF-8" />
      </div>
    <div id="spot1">
		<ul>
	          <li><a href="alink.do?path=mypage/mypage">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="alink.do?path=common/newsfeed">뉴스피드</a></li>
	          <li id="notice2">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	          <li><a href="brodcasting.j">채팅</a></li>
	    </ul>
	</div>
	<div id="spot2">
		<ul>
		<li><a href="javascript:goMyInfo()">내 정보보기</a></li>
		<li><a href="javascript:message();">메세지 보기</a></li>
		<li><a href="javascript:alertover()">알림 보기</a></li>
		<li><a href="javascript:logout()">로그 아웃</a></li>
	</ul>
	<div><%@include file="/WEB-INF/views/friend/friendView.jsp" %></div>
	</div>
	
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
  </body>
</html>