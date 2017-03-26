/**
 * 
 */
$(function() {
	$('#msglist').mouseleave(function() {
		$('#msglist').hide();
		$('#msglist').text("");
	})
	$('#alertlist').mouseleave(function() {
		$('#alertlist').hide();
		$('#alertlist').text("");
	})
	
	$(document).on("mouseenter",".msglistajax",function(){
		
		$(this).css("background","#E7E4F9");
	})
	
	$(document).on("mouseleave",".msglistajax", function() {
		$(this).css("background","white");
	})
	parent.onalert();
	$('#aldi').slideUp(0);
})


function message() {
		location.href="msgreadlist.j";
	}
	
	function goHome() {
		location.href="newsfeed.b";
	}
	
	function goMyInfo() {
		location.href="alink.do?path=member/myInfoCheck";
	}
	
	function logout(){
		location.href="logout.k";
	}
	function removealertlist() {
		$('#alertlist').hide();
	}
	function msgover() {
		$('#alertlist').hide();
		$('#msglist').text("");
		var msgdiv = $('#msglist');
		$.ajax({
			url : "headmsglist.j",
			success : function(list) {
				for(var i = 0  ; i < list.length; i++){
					var x = 
					"<div class='msglistajax'"+"onclick='msgdetail("+
					list[i].message_no+")'>" +
					"<img class='msgajaximg' src='/sins/resources/file/"+list[i].send_id+"/"+list[i].profile+"'>"+
					list[i].content+"</div>";
					msgdiv.append(x);
					msgdiv.show();
				}
			}
		})
		
	}
	
function alert1() {
	location.href="alertlist.j";
}

function alertover() {
	$('#msglist').hide();
	var aldiv = $('#alertlist');
	aldiv.text("");
	$.ajax({
		url : "alertlistajaxtop.j",
		success : function(list) {
			for(var i = 0  ; i < list.length; i++){
			var x = 
				"<div class='msglistajax'"+"onclick='alert1("+
				")'>" +
				"<img class='msgajaximg' src='/sins/resources/file/"+list[i].send_id+"/"+list[i].filepath+"'>"+
				list[i].classify+"</div>";
			aldiv.append(x);
			aldiv.show();
			}
		}
	})
	
}
function msgdetail(msgno) {
	location.href="msgheaddetail.j?msgno="+msgno;		
}




//이쪽부터 친구쪽
function loadRequest(userId, option){
	
	
	 $.ajax({
		 
	 
			url : 'friendAccept.n',

			data : {"userId" : userId, "option" : option},
			
			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {
				var tag="";
				
				if(result.resList.length > 0){

					tag+="<label style='text-align:left;font-weight:bold; font-size:10pt;'>친구 요청</label><hr><table style='width:100%;border-spacing:0px;' >";
				for(var i=0; i<result.resList.length; i++){
			
					
					
					tag+= "<tr><td style='cursor:pointer; padding-left:5%;text-align:left;width:15%;font-size:9pt;border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;' onclick=location.href='mypage2.b?userId="+result.resList[i].userId+"'>"+ 
					"<img src='" +"/sins/resources/file/"+result.resList[i].userId+"/"+result.resList[i].userProfile+"' style='width: 40px; height: 40px;' /></td>"+ 
						"<td style='padding-left:5%; border-width:0px; border-bottom-width:2px; height:1px; border-style:groove; color:#9581BF; text-align:left;width:35%;font-size:9pt;'><label style='cursor:pointer;' onclick=location.href='mypage2.b?userId="+result.resList[i].userId+"'>"+result.resList[i].userName +"</td>"+
						"<td style='padding-left:5%; border-width:0px; border-bottom-width:2px; height:1px; border-style:groove; text-align:left;width:35%;font-size:9pt;'><button id = 'accept' value='"+result.resList[i].userId+"' style='font-size:9pt; background:#9581BF; color:white;'>수락</button>"+
						"<button id='reject' value='"+result.resList[i].userId+"' style='font-size:9pt; background:white; color:#9581BF;'>거절</button></td></tr>";
				
				}
				
			}else{
				$('#friendlist').text("");
				tag+="<label style='margin-left:25%;font-weight:bold; font-size:8pt;'>받은 요청이 없습니다 </label>";
				
			}
			
				
				$('#friendlist').html(tag);
			} 
}); 
	
}


$(document).on("mouseleave","#friendTab", function(){
	
		$('#friendlist').css("display", "none");
	
});


$(document).on("mouseenter", "#friendTab" , function(){
	$('#msglist').hide();
		$('#friendlist').css("display", "block");
		loadRequest(null, 0);
	
});


$(document).on("click", "#accept", function(){
	
	var userId= $(this).val();
	$('#friendlist').text("");
	loadRequest(userId, 1);
	
});


$(document).on("click", "#reject", function(){
	
	var userId = $(this).val();
	$('#friendlist').text("");

	loadRequest(userId, 2);
});
	
$(document).on("click", "#friendTab", function(){
	location.href="friendMain.n";
});

$(document).on("click", "#friendlist", function(e){
	e.stopPropagation();
	
});

