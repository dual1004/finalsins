<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  
  $(document).ready(function(){
	 
		$.ajax({

			
			url : 'selectFriendList.n?userId=user01',
					

			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {

				var tag = "";

				tag += "<br/><table>";

				for (var i = 0; i < result.friendList.length; i++) {

					tag += "<tr><td> [사진]" 
							+ "</td><td>&nbsp;"
							+ result.friendList[i].userName + "</td>";


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
<div id="friends">



</div>


</body>
</html>