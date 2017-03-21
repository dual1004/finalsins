/**
 * 
 */
$(function() {
	$('#msglist').mouseleave(function() {
		$('#msglist').hide();
		$('#msglist').text("");
	})
	$(document).on("mouseleave",".msglistajax", function() {
		$(this).css("background","white");
	})
})
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
	function msgover() {
		$('#msglist').text("");
		var msgdiv = $('#msglist');
		$.ajax({
			url : "headmsglist.j",
			success : function(list) {
				for(var i = 0  ; i < list.length; i++){
					var x = 
					"<div class='msglistajax'"+"onmouseover='mousepoint()' onclick='msgdetail("+
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
function removemsglist() {
	$('#msglist').hide();
}
function alertover() {
	$('#msglist').hide();
	
}
function msgdetail(msgno) {
	location.href="msgheaddetail.j?msgno="+msgno;		
}
function mousepoint() {
	$('.msglistajax').css({"background":"red", "cursor" : "pointer"});
	
}