/**
 * 
 */
$(function(){
	var wsuri = "ws://localhost:9999/sins/alert-ws";
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		websocket.send('전송');
	}
	websocket.onmessage = function(event) {
		msg = JSON.parse(event.data);
		if(msg.command == "message"){
			switch(msg.type){
				case "event":{
					var text = "<div class='youtext'>"+
					msg.id + "<br/>" + msg.message +
					"<div>";
					writeToScreen(text);
					$('#text').scrollTop($('#text')[0].scrollHeight);
					break;
				}
			}
		}
	}
})