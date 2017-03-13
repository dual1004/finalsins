/*package com.seven.sins.chat.handler;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.jasper.tagplugins.jstl.core.Set;
import org.json.JSONArray;
import org.json.JSONObject;

@ServerEndpoint(value = "/websocket/chat") // 클라이언트가 접속할 때 사용될 URI
public class WebSocketServer {
	private static JSONArray jsonArr = new JSONArray();
	private static Map<String, Session> sessionMap = new HashMap<>();
	private static final String GUEST_PREFIX = "Guest";
	// AtomicInteger 클래스는 getAndIncrement()를 호출할 때마다 카운터를 1씩 증가하는 기능을 가지고 있다
	private static final AtomicInteger connectionIds = new AtomicInteger(0);
	// CopyOnWriteArraySet 을 사용하면 컬렉션에 저장된 객체를 좀더 간편하게 추출할 수 있다
	// 예를 들어, toArray()메소드를 통해 쉽게 Object[] 형의 데이터를 추출할 수 있다.
	private static final Set<WebSocketServer> connections = new CopyOnWriteArraySet<WebSocketServer>();

	private final String nickname;
	// 클라이언트가 새로 접속할 때마다 한개의 Session 객체가 생성된다.
	// Session 객체를 컬렉션에 보관하여 두고 해당 클라이언트에게 데이터를 전송할 때마다 사용한다
	private Session session;
	private JSONParser jsonParser = new JSONParser();

	public WebSocketServer() { // 클라이언트가 새로 접속할 때마다 이 클래스의 인스턴스가 새로 생성됨
		// 클라이언트가 접속할 때마다 서버측에서는 Thread 가 새로 생성되는 것을 확인할 수 있다
		String threadName = "Thread-Name:" + Thread.currentThread().getName();
		// getAndIncrement()은 카운트를 1 증가하고 증가된 숫자를 리턴한다
		nickname = GUEST_PREFIX + connectionIds.getAndIncrement();
		System.out.println(threadName + ", " + nickname);
	}

	// 메소드명은 개발자가 지정할 수 있다.
	// 애노테이션에 따라 구분 된다.
	@SuppressWarnings("unchecked")
	@OnOpen
	public void start(Session session) {// 통신은 스트림으로 한다, 즉 세션에서 스트림을 얻을 수 있다.
		System.out.println("클라이언트 접속됨 " + session);
		// Session:접속자마다 한개의 세션이 생성되어 데이터 통신수단으로 사용됨, 즉 접속자 마다 구분됨
		// 한개의 브라우저에서 여러개의 탭을 사용해서 접속하면 Session은 서로 다르지만 HttpSession 은 동일함
		this.session = session;
		connections.add(this);// 사용자 세션이 저장된 객체를 connections Set객체에 저장
		sessionMap.put(nickname, session);// 사용자 nickname을 키값으로 하고 session을 value로 하는 맵객체에 추가
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("cmd", "start");// 클라이언트쪽에서 해당하는 작업을 하기 위해 명령어를 String으로 준다
		jsonObj.put("nickname", nickname);
		jsonObj.put("msg", "has joined");

		jsonArr.add(jsonObj);
		String jsonStr = jsonArr.toJSONString();
		this.sendGuestList(jsonStr);
	}

	@SuppressWarnings("unchecked")
	@OnClose
	public void end() {
		connections.remove(this);// 사용자가 접속을 중단하면 set에서 해당 사용자 객체를 삭제
		sessionMap.remove(nickname);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("cmd", "end");
		jsonObj.put("nickname", nickname);
		jsonObj.put("msg", "has disconnected.");
		
		JSONArray endArr = new JSONArray();
		endArr.add(jsonObj);
		
		try {
			for(int i = 0; i < jsonArr.size(); i++) {
				JSONObject obj = (JSONObject) jsonParser.parse(jsonArr.get(i).toString());
				
				if(obj.get("nickname").equals(nickname)) {
					jsonArr.remove(i);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = endArr.toJSONString();
		this.sendGuestList(jsonStr);
	}

	// 현재 세션과 연결된 클라이언트로부터 메시지가 도착할 때마다 새로운 쓰레드가 실행되어 incoming()을 호출함
	@OnMessage
	public void incoming(String json) {
		String threadName = "Thread-Name:" + Thread.currentThread().getName();
		System.out.println(threadName + ", " + nickname);
		if (json == null || json.trim().equals(""))
			return;
		
		JSONObject jsonObj;
		JSONArray arr;
		try {
			jsonObj = (JSONObject) jsonParser.parse(json);// 클라이언트쪽에서 문자열로 넘어온 json오브젝트를 jsonObject로 만들어준다
			System.out.println(jsonObj);
			arr = (JSONArray) jsonObj.get("nickArr");
			
			this.selectNickToMsg(arr, jsonObj);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private void selectNickToMsg(JSONArray arr, JSONObject jsonObj) {
		JSONArray jsonArr = new JSONArray();

		jsonObj.put("nickname", nickname);
		jsonArr.add(jsonObj);
		try {
			for (int i = 0; i < arr.size(); i++) {
				String sNick = (String) arr.get(i);
				if(!sNick.equals(nickname))
					sessionMap.get(sNick).getBasicRemote().sendText(jsonArr.toJSONString());
			}
			session.getBasicRemote().sendText(jsonArr.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Throwable t) throws Throwable {
		System.err.println("Chat Error: " + t.toString());
	}
	
	// 현재 세션으로부터 도착한 메시지를 모든 접속자에게 전송한다
	private void sendGuestList(String jsonStr) {
		Iterator<WebSocketServer> ss = connections.iterator();
		for (int i = 0; i < connections.size(); i++) {
			WebSocketServer client = ss.next();
			try {
				synchronized (client) {// 여러 사용자의 쓰레드에서 이 메소드에 접근하기 때문에 rock을 건다
					// 서버에 접속 중인 모든 이용자에게 메지지를 전송한다
					// getBasicRemote()로 사용자의 스트림을 얻는다

					client.session.getBasicRemote().sendText(jsonStr);
				}
			} catch (IllegalStateException ise) {
				// 특정 클라이언트에게 현재 메시지 보내기 작업 중인 경우에 동시에 쓰기작업을 요청하면 오류 발생함
				if (ise.getMessage().indexOf("[TEXT_FULL_WRITING]") != -1) {
					new Thread() {
						@Override
						public void run() {
							// 같은 에러가 발생하면 반복문을 통해서 다시 메세지를 전달하게 한다.
							while (true) {
								try {
									client.session.getBasicRemote().sendText(jsonStr);
									break;
								} catch (IllegalStateException _ise) {
									try {
										Thread.sleep(100); // 메시지 보내기 작업을 마치도록
															// 기다려준다
									} catch (InterruptedException e) {
									}
								} catch (IOException ioe) {
									ioe.printStackTrace();
								}
							}
						}
					}.start();
				}
			} catch (Exception e) {
				// 메시지 전송 중에 오류가 발생(클라이언트 퇴장을 의미함)하면 해당 클라이언트를 서버에서 제거한다
				System.err.println("Chat Error: Failed to send message to client:" + e);
				connections.remove(client);
				try {
					// 접속 종료
					client.session.close();
				} catch (IOException e1) {
					// Ignore
				}
				// 한 클라이언트의 퇴장을 모든 이용자에게 알린다
				String message = String.format("* %s %s", client.nickname, "has been disconnected.");
				this.sendGuestList(message);
			}
		}
	}
}*/