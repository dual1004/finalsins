/**
 * 
 */

$(function(){
	var wsuri = "ws://192.168.20.89:9999/sins/alert-ws";
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		sendAlert();	
	}
	/*onalert();*/
	$('#aldi').slideUp(0);
	
})
function alertslriderdown(message) {
	$('#aldi').text(message);
	$('#aldi').slideDown(2000);
	setTimeout("alertsliderup()",5000);
	
}
function alertsliderup() {
	$('#aldi').slideUp(2000);
}
function onalert() {
	websocket.onmessage = function(evnet) {
		alert = JSON.parse(event.data);
		if(alert.type == "alert"){
			console.log('메시지받음');	
			/*child.alertslriderdown(alert.classify);*/
			alertslriderdown(alert.classify);
		}
	}
}
function sendAlert() {
	var user ={
		user_id : $('#userid').val(),
		type : "login"
	}
	websocket.send(JSON.stringify(user));
}
function alertto(userid, classify,send_id) {
	console.log('알러트 메시지보냄');
	var alvo = {
		user_id : userid,
		classify : classify,
		send_id : send_id,
		type : "alert"
	}
	websocket.send(JSON.stringify(alvo));
}
