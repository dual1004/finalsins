/**
 * 
 */
$(function() {
	$('message').mouseleave(function() {
		
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
		var msgdiv = $('#msglist');
		$.ajax({
			url : "headmsglist.j",
			success : function(list) {
				for(var i = 0  ; i < list.length; i++){
					var x = "<p>" +
							"<a href='msgdetail.j?msgno="
					+list[i].message_no+
					"&recive="
					+list[i].receivie_id+
					"'>"+list[i].content+"<br/>";
					msgdiv.append(x);
				}
			}
		})
		
	}
	