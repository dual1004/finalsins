<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/sins/resources/js/message/messageread.js"></script>   
<link rel="stylesheet" type="text/css" href="/sins/resources/css/newsfeed-common.css" />
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
        	<li><h4>받은 메세지</h4></li>
        	<li><a class = "atag" href="alink.do?path=message/messagewrite">메시지 쓰기</a></li>
          	<li><a class = "atag" href="msgsendlist.j">보낸 메시지</a></li>
          	<li>스팸 보관함</li>
          	<li>스팸 유저</li>
        </ul>
      </div>
      <div id="content" class="box">
        <div id="listdiv">
        	<div id="tablemenu">
        	<form name = "chkform">
			<input type="hidden" name="check_no"/>
        	</form>        	
        	<input type="button" value="스팸신고" onclick="spamin()"/>
        	<input type="button" value="삭제" onclick=""/> 
        	<select id="select" name="select">
        		<option value="userid">아이디 </option>
        		<option value="content">내용</option>
        	</select>
        	<input type="search" id="seach" name="seach">
        	<input type="button" value="찾기">
        	${currentPage } / ${maxPage } page
        	</div> 
	        <table id="listtable" align="center">
	        	<tr><th><input type="checkbox" id="msgallchk"></th><th>보낸사람</th><th>내용</th><th>보낸날자</th><th>첨부파일</th><th>수신여부</th></tr>
	        	<c:forEach var="msg" items="${msglist }">
	        		<tr><td><input type="checkbox" class="cmsgchkbox" name="msg_no" value="${msg.message_no}"></td>
		        	<td>${msg.user_name }</td>
		        	<td>${msg.content }</a></td>
		        	<td>${msg.message_date }</td>
		        	<td> 11${msg.filepath }
<%-- 		        	<c:if test="${msg.filepath } eq null"> 파일없음 </c:if>
		        	<c:if test="${msg.filepath } ne null">${msg.filepath }  </c:if> --%>
		        	</td>
		        	<td>${msg.read_check }
		        </tr>
	        	</c:forEach>
	        </table>
	        <br>
	        <hr>
	        <div id="paging">
		        <a class = "atag"  href="msgreadlist.j?page=1">[처음] </a> 
	
				<c:if test="${startPage gt 1 }">
					<a class = "atag"  href="msgreadlist.j?page=${startPage - 1 }">[이전] </a> 
				</c:if>
				<c:if test="${startPage eq 1 }">[이전] </c:if>
				
				<c:forEach var="num" begin="${startPage }" end="${endPage }" step="1">
					<c:if test="${num eq currentPage }">
						<strong><b>${num }</b></strong>&nbsp;
					</c:if>
					<c:if test="${num ne currentPage }">
						<a class = "atag"  href="msgreadlist.j?page=${num }">${num }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage lt maxPage }">
					<a class = "atag"  href="msgreadlist.j?page=${endPage + 1 }"> [다음] </a>
				</c:if>
				<c:if test="${endPage eq maxPage }">
					[다음]
				</c:if>
				
				<a class = "atag"  href="msgreadlist.j?userid=page=${maxPage }"> [마지막]</a>
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
     <div id="footer">
        <c:import url="../common/footer.jsp" charEncoding="UTF-8" />
      </div>
    <div id="spot1"></div>
    <div id="spot2"></div>
  </body>
</html>