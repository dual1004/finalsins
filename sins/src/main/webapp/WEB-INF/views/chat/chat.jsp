<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your First WebSocket!</title>
<script  src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/sins/resources/js/chat/chat.js"></script>
</head>
<body>
        <h1 style="text-align: center;">Hello World WebSocket Client</h1>
        <br>
        <input type="button" value="확인" id="ttt"/>
        <input type="hidden" id="userid" value="${loginUser.userId }">
        <div style="text-align: center;">
        	<input type="button" onclick="online()" value="연결하기">
            <form action="">
            	<input id="userid" name="userId" value="user01"/>
            	<input id="groupno" name="groupNo" value="1"/>
                <input onclick="sendText()" value="Send" type="button">
                <input id="message" name="message" value="웹소켓 세상"><br>
                <input type="button" value="나가기" onclick="exitchat()"/>
            </form>
        </div>
        <div id="text"></div>
</body>
</html>
