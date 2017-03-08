package com.seven.sins.friend.vo;


@SuppressWarnings("serial")
public class FriendVO implements java.io.Serializable{

	private String userId;
	private String userName;
	private String userProfile;
	
	
	
	public FriendVO() {
		
	}
	
	public FriendVO(String userId, String userName, String userProfile) {
		
		this.userId = userId;
		this.userName = userName;
		this.userProfile = userProfile;
	}
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	
	

}
