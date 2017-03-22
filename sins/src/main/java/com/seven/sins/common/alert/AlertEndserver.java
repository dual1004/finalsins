package com.seven.sins.common.alert;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.seven.sins.chat.vo.ChatVO;

@ServerEndpoint("/alert-ws")
public class AlertEndserver {
	private static Logger logger = LoggerFactory.getLogger("sinsLog");
		  
	private static List<Session> sessionusers = Collections.synchronizedList(new ArrayList<Session>());
		
	@OnOpen
	public void handleOpen(Session usersession) throws IOException {
		sessionusers.add(usersession);
		logger.info(usersession + "접속");
	}
		
	@OnMessage
	public void handleMessage(String message)throws IOException{
		System.out.println("메시지");
	}	
	@OnClose
	public void handleClose(Session session) throws IOException{
		System.out.println("나가기");
		sessionusers.remove(session);	
	}
	
	public String JSONConverter(String id, String message, String command, String type) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("type", type);
		jsonObject.put("command", command);
		jsonObject.put("message", message);
		return jsonObject.toString();	}
		
	}
