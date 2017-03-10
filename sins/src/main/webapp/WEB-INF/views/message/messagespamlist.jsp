<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE SPAM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/sins/resources/js/message/messageread.js"></script>   
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
        	<li><a class = "atag" href="alink.do?path=message/messagewrite">메시지 쓰기</a></li>
          	<li><a class = "atag" href="msgsendlist.j">보낸 메시지</a></li>
          	<li><h4>스팸 보관함</h4></li>
          	<li><a class = "atag" href="msgspamuserlist.j">스팸 유저</a></li>
        </ul>
      </div>
      <div id="content" class="box">
        <div id="listdiv">
        	<h2>받은 메세지함</h2><br>
        	<form name = "detailform">
        		<input type="hidden" id="msgno" name="msgno"/>
        		<input type="hidden" name="recive" value="true"/>
        	</form>
        	<input type="hidden" id="selectid" value="${select}"/>
        	<div id="tablemenu">
        	<form name = "chkform">
				<input type="hidden" name="check_no"/>
        	</form>        	
        	<form id="seachform" action="msgspamlist.j">
        		<input type="button" value="삭제" onclick="recive_del()"/>
        		<input type="hidden" name="loginid" value="${loginUser.userId }"/>
        		<input type="hidden" id="page" name="page" value="1"/>
        		<select id="select" name="select">
			    	<option value="id">아이디 </option>
		       		<option value="name">이름</option>
		       		<option value="cont">내용</option>
		    	</select>
		    	<input type="search" id="seach" name="seach" value="${seach}"/>
        		<input type="submit" value="찾기"/>
	        	${currentPage } / ${maxPage } page
        	</form>
        	</div> 
     	
	        <table id="listtable" align="center">
	        	<tr><th id="chkth"><input type="checkbox" id="msgallchk"></th><th id="userth">보낸사람</th><th id="contentth">내용</th><th id="dateth">보낸날자</th><th id="fileth">첨부파일</th><th id="readth">수신여부</th></tr>
	        	<c:forEach var="msg" items="${msgspamlist }">
	        		<tr><td><input type="checkbox" class="msgchkbox" name="msg_no" value="${msg.message_no}"></td>
		        	<td><a href="#" class="atagname" onmouseover="view('${msg.send_id}')" onclick="userpage(${msg.send_id})">${msg.user_name }</a></td>
		        	
		        	<td class="content">
		        	<a href="#" onclick="msgdetail(${msg.message_no})">${msg.content}</a>
		        
		        	</td>
		        	<td>${msg.message_date }</td>
		        	<td><c:if test="${empty msg.filepath }"> 파일없음 </c:if>
		        	<c:if test="${not empty msg.filepath }">${msg.filepath }  </c:if>
		        	</td>
		        	<td>${msg.read_check }
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