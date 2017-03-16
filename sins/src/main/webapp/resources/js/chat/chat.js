/**
 * 
 */
function online() {
	var userid = $('#userid').val();
	var wsuri = "ws://192.168.20.89:9999/sins/test-ws";
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		sendText();	
	}
	websocket.onmessage = function(event) {
		msg = JSON.parse(event.data);
		if(msg.command == "message"){
			switch(msg.type){
				case "event":{
					console.log("가져온값");
					console.log(msg);
					console.log(msg.message);
					writeToScreen(msg.id + " : " + msg.message);
					break;
				}
			}
		}
	}
}   
	
//Send text to all users through the server
function sendText() {
  // Construct a msg object containing the data the server needs to process the message from the chat client.
	var id = $('#userid').val() +" : " + $('#message').val();
	writeToScreen(id);
	
  var msg = {
	groupno : $('#groupno').val(),
    type: "message",
    text: $('#message').val(),
    id:   $('#userid').val(),
    date: Date.now()
  };
  console.log($('#userid').val());
  // Send the msg object as a JSON-formatted string.
  websocket.send(JSON.stringify(msg));
  console.log('서버로 메시지 전송');
  // Blank the text input element, ready to receive the next line of text from the user.
  /*$('#text').val("");*/
}

function writeToScreen(message) {
    var pre = document.createElement("p");
    pre.style.wordWrap = "break-word";
    pre.innerHTML = message;
    
    text.appendChild(pre);
}
function exitchat() {
	console.log('나가기');
	websocket.close();
}
