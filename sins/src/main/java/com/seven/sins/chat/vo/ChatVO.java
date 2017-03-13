package com.seven.sins.chat.vo;

import com.google.gson.Gson;

public class ChatVO {
	private String message;
	private String type;
	private String to;
	
	public static ChatVO converMessage(String source){
		ChatVO message = new ChatVO();
		Gson gson = new Gson();
		message = gson.fromJson(source, ChatVO.class);
		return message;
	}

	public ChatVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatVO(String message, String type, String to) {
		super();
		this.message = message;
		this.type = type;
		this.to = to;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}
	
	
}
