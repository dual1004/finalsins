package com.seven.sins.common.alert.alerthandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.seven.sins.common.alertvo.AlertVO;



@ServerEndpoint("/alert-ws")
public class AlertHandler{
	private static Map<String, Session> alluser = new HashMap<String, Session>();
	private Session user;
	@OnOpen
	public void alertOpen(Session session) throws IOException{
		System.out.println(session+"접속");
		user = session;
	}
	
	@OnMessage
	public void alertOnMessage(String message) throws IOException{
		System.out.println("서비스로직");
		AlertVO alertvo = convert(message);
		System.out.println(message);
		System.out.println(alertvo.getUser_id());
		if(alluser.containsValue(user)){
			Set<String> key = alluser.keySet();
			Iterator<String> iter = key.iterator();
			while(iter.hasNext()){
				String userkey = iter.next();
				if(alluser.containsKey(user)){
					alluser.get(userkey).getBasicRemote().sendText(JSONConverter(alertvo,"alert"));
				}
			}
		}else{
			alluser.put(alertvo.getUser_id(), user);
		}
	}
	
	private AlertVO convert(String message) {
		Gson gson = new Gson();
		AlertVO alertvo = gson.fromJson(message, AlertVO.class);
		return alertvo;
	}

	@OnClose
	public void alsertOnClose(Session session) throws Exception{
		System.out.println("나가기");
	}
	
	public String JSONConverter(AlertVO alertvo,String type) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("user_id", alertvo.getUser_id());
		jsonObject.put("classify", alertvo.getClassify());
		jsonObject.put("content_no", alertvo.getContent_no());
		jsonObject.put("type", type);
		return jsonObject.toString();
	}
}
