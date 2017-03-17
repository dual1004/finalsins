<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE READ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/sins/resources/js/message/spamuser.js"></script>   
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
<link rel="stylesheet" type="text/css" href="/sins/resources/css/message/messageread.css" /> 
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
        	<li><a class = "atag" href="msgbeforewrite.j">메시지 쓰기</a></li>
          	<li><a class = "atag" href="msgsendlist.j">보낸 메시지</a></li>
          	<li><a class = "atag" href="msgspamlist.j">스팸 보관함</a></li>
          	<li><h4>스팸 유저</h4></li>
        </ul>
      </div>
      <div id="content" class="box">
        <div id="listdiv">
        	<h2>스팸 유저 목록</h2><br>
        	<form name = "detailform">
        		<input type="hidden" id="msgno" name="msgno"/>
        		<input type="hidden" name="recive" value="true"/>
        	</form>
        	<input type="hidden" id="selectid" value="${select}"/>
        	<div id="tablemenu">
        	<form name = "chkform">
				<input type="hidden" name="check_spamid"/>
        	</form>        	
        		<input type="button" value="스팸등록해제" onclick="spamdel()"/>
        		
	        	<div id="page">${currentPage } / ${maxPage } page</div>
        	</div> 
			     	
	        <table id="listtable" align="center">
	        	<tr><th id="chkth"><input type="checkbox" id="msgallchk"></th><th id="userth">이름</th><th>아이디</th></tr>
	        	<c:forEach var="msg" items="${msgspamuserlist }">
						        	
	        		<tr><td><input type="checkbox" class="msgchkbox" name="msg_no" ></td>
		        	<td><label>${msg.user_name }</label></td>
		        	<td><label>${msg.send_id }</label></td>
		        
		        </tr>
	        	</c:forEach>
	        </table>
	        <br>
	        <hr>
	       

	        <div id="paging">
		        <a class = "atag"  onclick="pagefn(1)" href="#">[처음] </a> 
	
				<c:if test="${startPage gt 1 }">
					<a class = "atag"  onclick="pagefn(${startPage - 1 })" href="#">[이전] </a> 
				</c:if>
				<c:if test="${startPage eq 1 }">[이전] </c:if>
				
				<c:forEach var="num" begin="${startPage }" end="${endPage }" step="1">
					<c:if test="${num eq currentPage }">
						<strong><b>${num }</b></strong>&nbsp;
					</c:if>
					<c:if test="${num ne currentPage }">
						<a class = "atag"  onclick="pagefn(${num })" href="#">${num }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage lt maxPage }">
					<a class = "atag"  onclick="pagefn(${endPage + 1 })" href="#"> [다음] </a>
				</c:if>
				<c:if test="${endPage eq maxPage }">
					[다음]
				</c:if>
				
				<a class = "atag" onclick="pagefn(${maxPage })" href=""> [마지막]</a>
			</div>
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
    <div id="mouseover" style="position:absolute; display:none;">
    	유저 아이디 넣을 공간 div
    </div>
     <div id="footer">
        <c:import url="../common/footer.jsp" charEncoding="UTF-8" />
      </div>
    <div id="spot1"></div>
    <div id="spot2"></div>
  </body>
</html>