package com.seven.sins.chat.handler;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.*;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.seven.sins.chat.vo.ChatVO;

@ServerEndpoint("/test-ws")
public class ChatHandler {

	private List<Session> sessionusers = Collections.synchronizedList(new ArrayList<Session>());
	private static Map<Integer,List<Session>> groupmap = Collections.synchronizedMap(new HashMap<Integer, List<Session>>());
	private Session usersession; 	
	
	public ChatHandler(){
	}
	
	@OnOpen
	public void handleOpen(Session usersession) throws IOException {
		System.out.println("웹소켓 접속" + usersession.getId());
		System.out.println(usersession);
		sessionusers.add(usersession);
	}
	
	@OnMessage
	public void handleMessage(String message)throws IOException{
		/*Iterator<Session> iterator = sessionusers.iterator();
		usersession = iterator.next();*/
		System.out.println("모두에게 메시지");
		ChatVO chatvo = this.msgTochatvo(message);
		this.groupDiv(chatvo,sessionusers.get(0));
		
		List<Session> list = groupmap.get(chatvo.getGroupno());
		if(list.size() > 0) {
			for(int i = 0 ; i < list.size(); i++){
				System.out.println(list.get(i));
				if(list.get(i).getId() == sessionusers.get(0).getId()){
					
				}else{
					list.get(i).getBasicRemote().sendText(JSONConverter(chatvo.getId(), chatvo.getText(), "message", "event"));
				}				
			}				
		} else {
			System.out.println("여긴 한명도없다");
		}
	}
	
	private void groupDiv(ChatVO chatvo, Session usersession2) {
		System.out.println("여기");
		System.out.println(usersession2);
		if(groupmap.containsKey(chatvo.getGroupno())){
			System.out.println("같은값 ");
			// 
			boolean flag = true;
			List<Session> list = groupmap.get(chatvo.getGroupno());
			for(int i =0;i<list.size();i++){
				System.out.println(list.get(i).getId());
				if(list.get(i).getId() == (usersession2.getId())){
					System.out.println("트루");
					flag = false;
				}
			}
			if(flag){
				groupmap.get(chatvo.getGroupno()).add(usersession2);
			}
		}else{
			System.out.println("처음");
			groupmap.put(chatvo.getGroupno(), sessionusers);
		}
	}

	private ChatVO msgTochatvo(String message) {
		Gson gson = new Gson();
		
		ChatVO chatvo = gson.fromJson(message, ChatVO.class);
		System.out.println(chatvo.getId());
		return chatvo;
	}

	@OnClose
	public void handleClose(Session session){
		System.out.println("나가기");
		sessionusers.remove(session);
	}
	
	public String JSONConverter(String id, String message, String command, String type) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("type", type);
		jsonObject.put("command", command);
		jsonObject.put("message", message);
		return jsonObject.toString();
	}
	
	
}
