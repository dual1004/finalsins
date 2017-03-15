<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  
  $(document).ready(function(){
	 
		$.ajax({

			
			url : 'selectFriendList.n',
					

			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {

				var tag = "";

				tag += "<br/><table>";

				for (var i = 0; i < result.friendList.length; i++) {

					tag += "<tr><td> <img src='"+result.friendList[i].userProfile+"' style='width:50px;height:50px;'>"+ 
							"</td><td>&nbsp;"+
							result.friendList[i].userName + "</td>";


				}

				tag += "</table>";

				$("#friends").html(tag);

				

			}

		});
	  
	  
  });
  
  </script>
  
<title></title>
</head>
<body>
<div id="page">
<br>

<h2 align="center">친구 목록</h2><br>
			
			
<hr>
<div id="friends" style='margin-left:20px;'></div>
			
</div>



</body>
</html>