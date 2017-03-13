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
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
    
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
          <li><a href="selectQna.n">고객센터</a></li>
        </ul>
      </div>
      <div id="content" class="box">
        <h2>Content</h2>
       	<h1>내정보보기페이지</h1>
        <a href="alink.do?path=message/messagemain">메시지 페이지</a>
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