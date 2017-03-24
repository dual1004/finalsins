<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML> 
<html>
<head>
<meta charset="UTF-8">
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/search/search-common.css" />
<style>
.no_underline {
	text-decoration: none;
}
.link{

	color:blue;
	font-size:8pt;
}

.link:hover{
	text-decoration:under_line;
}


#left{
width: 200px;
}

#container {
width:1120px;
}


#contentDiv{
	width: 500px;
	min-height: 300px;
	padding: 20px;
	height:auto;
	margin-left:20px;
	float: left;
	background-color: white;
	overflow: auto;
	
	
}

#tab{
position:relative;
width:100%;

}

.tabtd{
padding-left:20px;
padding-right:20px;
border-spacing:0px;
color:#9581BF;
cursor:pointer;
}

.grayc{
font-size:8pt;
color:gray;
font-weight:bold;
}


.addbtn{
background:white;

}

#channelTable{
width:100%;
border-spacing:0px;

}

.channelTd{
padding-top:10px;
padding-bottom:10px;
color:#9581BF;
border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;

}

.curs{
cursor:pointer;
}
.curs:hover{

text-decoration:underline;

}
.tabtd{
cursor:pointer;
}

</style>
<script type="text/javascript">


page=1;



$(function(){
	$("#content").scroll( function() {
		  var elem = $("#content");
		 
		  if ( elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight())
		    {
			 
		        setTimeout(function(){
		        	appender();	
		        },300);
		        
		    }
		});
	
});


	
		
	


	function appender(){
		
		var word='${word}';
		var p= ++page;
		
		$.ajax({
			url : 'appendChannel.n?word='+word+'&page='+p,

			
			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {
				
				
				for(var i=0; i<result.clist.length; i++){
				 
					var tag="<tr><td class='channelTd' style='width:20%' onclick="+
					"location.href='selectChannelList.l?channel_no="+result.clist[i].channelNo+"'> <img class='curs' src='"+
					"${pageContext.request.contextPath}/resources/file/"+result.clist[i].userId+"/"+result.clist[i].filePath+"' style='width: 80px; height: 90px;' /></td>"+
					"<td class='channelTd' style='width:80%; text-align:left;'>"+
					"<label onclick=location.href='selectChannelList.l?channel_no="+result.clist[i].channelNo+"' class='curs'>"+
					result.clist[i].channelName+"</label><br><label class='grayc'>";
					
					if( result.clist[i].isFollow == 'Y')
						tag+="팔로우 중";
					
					tag+= "<br> 카테고리- "+result.clist[i].category+
						" · "+result.clist[i].like+"명이 좋아합니다";
					
					
					if(result.clist[i].info!=null)
						tag+="<br>"+result.clist[i].info;
					
					tag+="</label></td>";
					
					
					
					$("#channelTable > tbody:last").append(tag);
				
				}
				
			
			}
		
		
		});
		
	}

	
	
	
</script>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
 		<div id="top"></div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box" >
		
			
			 <%@include file="/WEB-INF/views/friend/friendFind.jsp" %> 
			
		</div>
		<div id="content">


			<div id="contentDiv" class="box">
				<div id="tab">
				<table>
				<tr><td class="tabtd" onclick="location.href='searchMember.n?word=${word}'" >사람</td>
				<td class="tabtd" onclick="location.href='searchChannel.n?word=${word}'" style='background:#9581BF; color:white;'>채널</td>
				<td class="tabtd" onclick="location.href='searchGroup.n?word=${word}'">그룹</td></tr>
				</table>
				</div>
				
				<hr>
			
			
			<c:if test="${not empty clist }">
			<table id="channelTable">	
			
			<tbody>
			
			 <c:forEach var="channel" items="${clist }">
			
				
				<tr>
				<td class='channelTd' style='width:20%' onclick="location.href='selectChannelList.l?channel_no=${channel.channelNo}'"><img class='curs' src="${pageContext.request.contextPath}/resources/file/${channel.userId}/${channel.filePath }" style='width: 80px; height: 90px;' /></td>
				<td class='channelTd' style='width:80%; text-align:left;'><label class='curs' onclick="location.href='selectChannelList.l?channel_no=${channel.channelNo}'">${channel.channelName }</label><br><label class="grayc">
				<c:if test="${channel.isFollow eq 'Y'}">
				팔로우 중
				</c:if>
				<br>카테고리- ${channel.category } · ${channel.like }명이 좋아합니다
				<c:if test="${not empty channel.info }">
				<br>${channel.info }
				</c:if>
				</label></td>
				
				
				</tr>
				
				
				
					
					
				
				
				
					
					
			
			</c:forEach> 
			
			</tbody>
			</table>	
	</c:if>
	
	<c:if test="${empty clist }">
		<br><br><label class="font10pt" style='margin-left:170px;'>검색결과가 없습니다.</label>
	</c:if>
				

				


				
				

			</div>




		</div>











		<div id="right" class="box">
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp"%>


		</div>
	</div>

	<div id="spot1"></div>
	<div id="spot2"></div>
	<div id="spot">
	<div id="spot3"></div>
	<div id="spot4"> <%@include
			file="/WEB-INF/views/common/top.jsp"%></div>
	<div id="spot5"></div>
	</div>
</body>

<footer>
 <%@include file="/WEB-INF/views/common/footer.jsp"%>
</footer>
</html>