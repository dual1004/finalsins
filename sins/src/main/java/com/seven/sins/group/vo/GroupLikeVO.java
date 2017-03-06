package com.seven.sins.group.vo;

@SuppressWarnings("serial")
public class GroupLikeVO implements java.io.Serializable {

	private int writeNo;
	private String userId;
	private String classfy;

	public GroupLikeVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupLikeVO(int writeNo, String userId, String classfy) {
		super();
		this.writeNo = writeNo;
		this.userId = userId;
		this.classfy = classfy;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	@Override
	public String toString() {
		return "GroupLikeVO [writeNo=" + writeNo + ", userId=" + userId + ", classfy=" + classfy + "]";
	}
}
