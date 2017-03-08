<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE DETAIL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/sins/resources/js/message/messagewrite.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
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
         <h2>메시지함</h2><br>
        <ul>
        	<li><a class = "atag" href="msgreadlist.j">받은 메세지</a></li>
        	<li><h4>메시지 쓰기</h4></li>
          	<li><a class = "atag" href="msgsendlist.j">보낸 메시지</a></li>
          	<li>스팸 보관함</li>
          	<li>스팸 유저</li>
          	
        </ul>
      </div>
      <div id="content" class="box">
        <div id="msgsenddiv">
        	<h2>메시지 쓰기</h2><br>
        	<form action="msgsead.j" enctype="multipart/fora-data" name="sendform" onsubmit="return submit()">
        		<input type="hidden" id="send_id" name="send_id" value="${loginUser.userId}">
        		<input type="submit" id="msgsendbtn" value="쪽지보내기"/><br/>
        		<input type="hidden" name="sendid" value="user01">
				<label for="reciveid">받는 사람 :</label><input type="text" required="required" id="reciveid" name="receivie_id"/><br/>
        		<textarea rows="10" cols="70" name="content"></textarea><br/>
				<input type="file" name="filepath">

        	</form>
        </div>
      </div>
      <div id="right" class="box">
        <h2>RIGHT</h2>
        <ul>
          <li>Lorem</li>
          <li>Ipsum</li>
          <li>Dolor</li>
        </ul>
      </div>
    </div>
     <div id="footer">
        <c:import url="../common/footer.jsp" charEncoding="UTF-8" />
      </div>
    <div id="spot1"></div>
    <div id="spot2"></div>
  </body>
</html>