package com.seven.sins.chat.handler;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.handler.TextWebSocketHandler;

@ServerEndpoint("/test-ws")
public class ChatHandler extends TextWebSocketHandler{
	private Set<Session> sessionusers = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void handleOpen(Session usersession){
		System.out.println("웹소켓 접속" + usersession.getId());
		
		sessionusers.add(usersession);
	}
	
	@OnMessage
	public void handleMessage(String message)throws Exception{
		Iterator<Session> iterator = sessionusers.iterator();
		System.out.println("모두에게 메시지");
		if(sessionusers.size() > 0) {
			while(iterator.hasNext()) {
				iterator.next().getBasicRemote().
	                   sendText(JSONConverter(message, "message", "event"));
			}	
		} else {
			System.out.println("여긴 한명도없다");
		}
	}
	
	@OnClose
	public void handleClose(Session session){
		System.out.println("나가기");
		sessionusers.remove(session);
	}
	
	public String JSONConverter(String message, String command, String type) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("type", type);
		jsonObject.put("command", command);
		jsonObject.put("message", message);
		return jsonObject.toString();
	}
	}


	
}
