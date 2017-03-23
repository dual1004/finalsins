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
    <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript" src="/sins/resources/js/alert/alertlist.js"></script>
<style type="text/css">
.sendtr{
	cursor:pointer;
}
</style>
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
        	<h2>LEFT</h2>
	        <ul>
	          <li><a href="alink.do?path=mypage/mypage">MyPage</a></li>
	          <li><a href="alink.do?path=channelListView/channelList">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><h4>뉴스피드</h4></li>
	          <li id="notice">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	        </ul>
      	</div>
		<div id="content" class="box">
	        <h2>알림</h2>
	        <font name="alertajax">
	        	<input type="hidden" id="count" value="${count }"/>
	        	<input type="hidden" id="limit" value="${limit }">
	        </font>
	        <form name="alertdelet">
	        	<input type="hidden" id="user_id" name="user_id"/>
	        	<input type="hidden" id="classify" name="classify"/>
	        	<input type="hidden" id="content_no" name="content_no"/>
	        	<input type="hidden" id="sendid" name="userid"/>
	        </form>
	        <div id="contentDiv" class="box">
				<hr>
			<c:if test="${not empty list }">
			<table id="alertTable">	
			<tbody>
			 <c:forEach var="alert" items="${list }">
			<tr class="sendtr" onclick="visit('${alert.send_id}','${alert.user_id }','${alert.classify }'
			,${alert.content_no })">
				<td class='alertid' style='width:20%'><img class='curs' src="${pageContext.request.contextPath}/resources/file/${alert.send_id}/${alert.filepath }" style='width: 80px; height: 80px;' /></td>
				<td class='content' style='width:40%; text-align:left;'><label class='curs'>${alert.classify }</label><br><label class="grayc">
				</label>
			</tr>
			</c:forEach> 
			</tbody>
			</table>	
	</c:if>
	
	<c:if test="${empty list }">
		<br><br><label class="font10pt" style='margin-left:170px;'>알람이 존재하지 않습니다.</label>
	</c:if>
			</div>
			<a href="#" onclick="appendalert()">알이</a>
			</div>
    	<div id="right" class="box">
      		<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
    	</div>
   	</div>
 	<div id="footer">
    	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />
  	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
	<div id="spot">
	<div id="spot3"></div>
	<div id="spot4"><c:import url="/WEB-INF/views/common/top.jsp" charEncoding="UTF-8" /></div>
	<div id="spot5"></div>
	</div>
</body>
</html>