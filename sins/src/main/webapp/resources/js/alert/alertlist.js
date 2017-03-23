/**
 * 
 */
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
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice").click(function(){
 		if(noticeMenuStatus == 0){
 			noticeMenuStatus = 1;
 			$(".notice").slideDown("slow");
 		}
 		else {
 			noticeMenuStatus = 0;
 			$(".notice").slideUp("slow");
 		}
 		
 	});
});
$(function(){
	   $("#content").scroll( function() {
	        var elem = $("#content");
	       
	        if ( elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight())
	          {
	              setTimeout(function(){
	            	  appendalert();  
	              },300);
	              
	          }
	      });
	   
	});

function visit(userid,user_id,classify,content_no) {
	$('#user_id').val(user_id);
	$('#classify').val(classify);
	$('#content_no').val(content_no);
	$('#userid').val(userid);
	console.log(userid);
	var form = document.alertdelet;
	 form. action =  'alertdelet.j';
	 form.method = "post";
	 form.submit();
	
}
function appendalert() {
	var count = $('#count').val();
	var limit = $('#limit').val();
	if(limit < count){
		$.ajax({
			url : "alertlistajax.j",
			type : "post",
			data : {"limit" : limit},
			success : function(data) {
				for(var i =0;i<data.length;i++){
					var tag = "<tr><td class='alertid' style='width:20%'><img class='curs' src="+
					"${pageContext.request.contextPath}/resources/file/"+
					data[i].send_id+"/"+data[i].filepath+
					"' style='width: 80px; height: 90px;' /></td>"+
					"<td class='content style='width:40%; text-align:left;'><label class='curs'>"+
					data[i].classify+"</label><br><label class='grayc'>"+
					"</label></td>";
					$("#alertTable > tbody:last").append(tag);
					
				}
		}
		})
		$('#count').val(count);
		$('#limit').val(limit);
	}
}