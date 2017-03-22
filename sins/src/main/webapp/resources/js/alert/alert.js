/**
 * 
 */

$(function(){
	var wsuri = "ws://192.168.20.89:9999/sins/alert-ws";
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		sendAlert();	
	}
	websocket.onmessage = function(evnet) {
		alert = JSON.parse(event.data);
		if(alert.type == "alert"){
			console.log(alert);
		}
	}
})
function sendAlert() {
	var user ={
		user_id : $('#userid').val()
	}
	console.log('보내기');
	websocket.send(JSON.stringify(user));
}
