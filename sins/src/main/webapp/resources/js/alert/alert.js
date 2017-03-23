/**
 * 
 */

$(function(){
	var wsuri = "ws://219.255.2.30:9999/sins/alert-ws";
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		sendAlert();	
	}
	onalert();
})
function onalert() {
	websocket.onmessage = function(evnet) {
		alert = JSON.parse(event.data);
		if(alert.type == "alert"){
			console.log(alert.classify);
		}
	}
}
function sendAlert() {
	var user ={
		user_id : $('#userid').val()
	}
	console.log('보내기');
	websocket.send(JSON.stringify(user));
}
function alertto(userid, classify, con_no) {
	var alvo = {
		user_id : userid,
		classify : classify,
		content_no : con_no,
		type : "alert"
	}
	websocket.send(JSON.stringify(alvo));
}
