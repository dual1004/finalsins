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
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/mypage/mypage-common.css" />
    
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
<style type="text/css">
.content2{
    width: 560px;
	padding: 20px;
	background-color: #E7E4F9;
	
}
@media screen and (max-width:500px) {
	.content2{
	overflow:hidden;
		float: none;
		width: auto;
		margin: auto;
		}
	}
	.tablef{
	width:540px;
	}
</style>
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
        
        <center>
        <h2>Mypage</h2>
        <img src="" style="width:160px; height:160px;">
        <h3>${ loginUser.userName } 님</h3><br>
        ${ loginUser.phone }<br>
        <h4><a href="mypage.b">MyPage</a></h4>
         <h4><a href="alink.do?path=mypage/mypageFriend">친구 목록 보기</a></h4>
        <h4><a href="mypagePoto.b">사진 보기</a></h4>
        <h4><a href="alink.do?path=mypage/mypageInfo">정보 보기</a></h4>
        </center>
      </div>
      <div id="content">
       <div class="content2">
        <input id="s" type="text" name="serch" placeholder="친구검색하기"/><button>검색하기</button></div>
        <br>
      <div class="content2">
        <h2>Friend</h2>
        <table class="tablef">
        <tr><td>
        <img src="" style="width:100px; height:100px;">
        </td><td><h3>${ loginUser.userName } 님</h3></td>
        <td>
        <img src="" style="width:100px; height:100px;">
        <td><td><h3>${ loginUser.userName } 님</h3></td></tr>
        </table>
        
        <table class="tablef">
        <tr><td>
        <img src="" style="width:100px; height:100px;">
        </td><td><h3>${ loginUser.userName } 님</h3></td>
        <td>
        <img src="" style="width:100px; height:100px;">
        <td><td><h3>${ loginUser.userName } 님</h3></td></tr>
        </table>
        
        <table class="tablef">
        <tr><td>
        <img src="" style="width:100px; height:100px;">
        </td><td><h3>${ loginUser.userName } 님</h3></td>
        <td>
        <img src="" style="width:100px; height:100px;">
        <td><td><h3>${ loginUser.userName } 님</h3></td></tr>
        </table>
        </div>
        <br>
        
       
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