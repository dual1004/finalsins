/**
 * 
 */

$(function(){
	var wsuri = "ws://192.168.20.89:9999/sins/alert-ws";
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
			var alert = "<div id='alert'>"+alert.classify+"에서 새로운 아림이 있습니다."+"</div>"
			setInterval()
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
