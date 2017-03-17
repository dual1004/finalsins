<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

 #searchResult{
 	display:none;
	position:relative; border:1px solid; min-height:100px;
	height:auto;
	width:70%;
	margin-left:14.5%;
	background:white;
	font-size:10pt;
	color:#9581BF;
	font-weight:bold;
	z-index:101;
	}
	
	#page{
	
	position:relative; 
	min-height:100px;
	height:auto;
	width:100%;
	float:left;
	text-align:center;
	
	z-index:101;
	}
	
	@media screen and (max-width:900px) {
		#searchResult{
		width:80%;
		
		}
	
	}
	
	@media screen and (max-width:500px) {
	
	#searchResult{
		width:90%;
		}
	}
	
	
	
	
	.trs{
	cursor:pointer;
	
	}
	</style>
<script>





$( function() {
	
	
  $('#s').keyup(function() {
	  
	  if($('#s').val().length == 0){
		  $("#searchResult").css("display", "none");
		  return;
		  
	  }
	
	  $("#searchResult").css("display", "block");
   $.ajax({
      url : "totalSearch.n",
      type : "post",
      data : {"word" : $(this).val()},
           
      success : function(result) {
    	 
    	  if(result.mlist.length>0){
    	  	tag="사람<br><table class='resultTable'>";
	    	  for(var i=0;i<result.mlist.length;i++){
	    	 
	    		
	    	  
				tag+="<tr onClick="+"location.href=mypage2.b?userId="+result.mlist[i].userId+" class='trs'><td>"+
				"<img src=" +result.mlist[i].userProfile+" style='width: 50px; height: 50px;' />"+
				"</td><td>"+result.mlist[i].userName+"</td></tr>";
					
	    	  }
	    	  
	    	  tag+="</table> <a href='searchMember.n?word='더보기";
    	  }
	    	  
	    	  
	    	  
	    	  
	    	  
	    	
	    	  $("#searchResult").html(tag);
	      
      }
      
   });
});
  
  
 	
});


$(document).on("blur", "#s", function(){
	 $("#searchResult").css("display", "none");
});


$(document).on("mouseenter",".trs", function(){
	$(this).css("background","#9581BF");
	$(this).css("color","white");
	$(this).css("cursor","hand");
	
});

$(document).on("mouseleave",".trs", function(){
	$(this).css("background","white");
	$(this).css("color","#9581BF");
	$(this).css("cursor","pointer");
	
});

/* $(window).resize(function(){
	var obj = $("#s").offset();
	var element = $("#s");//길이 알아내기
	//#div의 현재 위치

	//#div의 현재 위치에서 특정치(50px)만큼 이동
	$("#searchResult").css("left", obj.left);
	$("#searchResult").css("top", obj.top + 30);

	
	$("#searchResult").css("width", element.outerWidth(true));  
}).resize(); */



</script>
</head>
<body>


<input type="text" id="s" placeholder="검색하기"/>

<div id="page">
<div id="searchResult" >

</div>
</div>



</body>
</html>