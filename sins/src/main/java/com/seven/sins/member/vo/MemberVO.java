package com.seven.sins.member.vo;

import java.sql.Date;
@SuppressWarnings("serial")
public class MemberVO implements java.io.Serializable{

	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String address;
	private int manager;
	private Date enrollDate;
	private String userProfile;
	private String birth;
	private String gender;
	private int loginFailCheck;
	private String banTime;
	
	public MemberVO() {}

	public MemberVO(String userId, String userPwd, String userName, String phone, String gender) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.gender = gender;
	}

	public MemberVO(String userId, String userPwd, String userName, String phone, String address, int manager,
			Date enrollDate, String userProfile, String birth, String gender, int loginFailCheck, String banTime) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.manager = manager;
		this.enrollDate = enrollDate;
		this.userProfile = userProfile;
		this.birth = birth;
		this.gender = gender;
		this.loginFailCheck = loginFailCheck;
		this.banTime = banTime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getLoginFailCheck() {
		return loginFailCheck;
	}

	public void setLoginFailCheck(int loginFailCheck) {
		this.loginFailCheck = loginFailCheck;
	}

	public String getBanTime() {
		return banTime;
	}

	public void setBanTime(String banTime) {
		this.banTime = banTime;
	}


	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", phone=" + phone
				+ ", address=" + address + ", manager=" + manager + ", enrollDate=" + enrollDate + ", userProfile="
				+ userProfile + ", birth=" + birth + ", gender=" + gender + ", loginFailCheck="
				+ loginFailCheck + ", banTime=" + banTime + "]";
	}
	
	
}
