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
		
		$(this).css("background","red");
	})
	
	$(document).on("mouseleave",".msglistajax", function() {
		$(this).css("background","white");
	})
	parent.onalert();
	$('#alertdiv').slideUp(0);
})
function alertslriderdown(message) {
	$('#alertdiv').text(message);
	$('#alertdiv').slideDown(2000);
	setTimeout("alertsliderup()",5000);
	
}
function alertsliderup() {
	$('#alertdiv').slideUp(2000)
}
function message() {
		location.href="msgreadlist.j";
	}
	
	function goHome() {
		location.href="alink.do?path=common/newsfeed";
	}
	
	function goMyInfo() {
		location.href="alink.do?path=member/myInfo";
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
					"<img class='msgajaximg' src="+list[i].profil+">"+
					/*"<a class='ataglist' href='msgdetail.j?msgno="
					+list[i].message_no+
					"&recive="
					+list[i].receivie_id+"'>"+*/
					list[i].content+"</div>";
					msgdiv.append(x);
					msgdiv.show();
				}
			}
		})
		
	}
	
function alert() {
	location.href="alertlist.j";
}

function removemsglist() {
	$('#msglist').hide();
}
function alertover() {
	$('#msglist').hide();
	console.log("여기여기");
	var aldiv = $('#alertlist');
	aldiv.text("");
	$.ajax({
		url : "alertlistajaxtop.j",
		success : function(list) {
			for(var i = 0  ; i < list.length; i++){
			var x = 
				"<div class='msglistajax'"+"onclick='alert("+
				")'>" +
				"<img class='msgajaximg' src="+"${pageContext.request.contextPath}/resources/file/"+
				list[i].send_id+"/"+list[i].filepath+">"+
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


