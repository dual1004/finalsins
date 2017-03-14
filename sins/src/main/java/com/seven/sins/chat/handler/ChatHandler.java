package com.seven.sins.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.Decoder;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.seven.sins.group.vo.GroupMemberVO;

@ServerEndpoint("/test-ws")
public class ChatHandler {
	
	private static List<Session> sessionusers = new ArrayList<Session>();
	
	public ChatHandler(){
		//디비가서 기존 그룹 리스트 가져와 맵에 만들기..
	}
	
	@OnOpen
	public void handleOpen(Session usersession) throws IOException {
		System.out.println("웹소켓 접속" + usersession.getId());
		System.out.println(usersession);
		
		//int key = groupvo.getGroupNo();
		//System.out.println(groupvo.toString());
		/*if(grouproom.containsKey(key)){
			grouproom.get(key).add(usersession);
		}else{
			grouproom.put(key, sessionusers);
		}*/
		
		
		sessionusers.add(usersession);
		
	}
	
	@OnMessage
	public void handleMessage(String message)throws IOException{
		Iterator<Session> iterator = sessionusers.iterator();
		System.out.println("모두에게 메시지");
		System.out.println(message);
		System.out.println(sessionusers.size());
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
	
	public int newgroup(){
		return 0;
	}
	
	
}
