package com.seven.sins.chat.handler;

<<<<<<< HEAD
=======
import java.io.IOException;
import java.util.ArrayList;
>>>>>>> refs/remotes/origin/master
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
<<<<<<< HEAD
=======
import java.util.List;
>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD

=======
import org.junit.runners.Parameterized.Parameters;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.seven.sins.group.vo.GroupMemberVO;
>>>>>>> refs/remotes/origin/master

@ServerEndpoint("/test-ws")
public class ChatHandler {
<<<<<<< HEAD
	private static Set<Session> sessionusers = Collections.synchronizedSet(new HashSet<Session>());
	private static Map<Integer, Set<Session>> groupsession = Collections.synchronizedMap(new HashMap<Integer, Set<Session>>());
=======
>>>>>>> refs/remotes/origin/master
	
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
		
		
		/*sessionusers.add(usersession);*/
		
		groupsession.put(key, sessionusers.add(usersession));
		
		
	}
	
	@OnMessage
	public void handleMessage(String message)throws IOException{
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
	
	public int newgroup(){
		return 0;
	}
	
	
}
<<<<<<< HEAD

/*
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/test-ws")
public class ChatHandler {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
		System.out.println(clients.size());
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}*/
=======
>>>>>>> refs/remotes/origin/master
