package com.seven.sins.group.vo;

@SuppressWarnings("serial")
public class GroupMemberVO implements java.io.Serializable {
	
	private int groupNo;
	private String userId;
	private int grade;
	private String classfy;
	private char groupAccept;
	
	public GroupMemberVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupMemberVO(int groupNo, String userId, int grade, String classfy, char groupAccept) {
		super();
		this.groupNo = groupNo;
		this.userId = userId;
		this.grade = grade;
		this.classfy = classfy;
		this.groupAccept = groupAccept;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	public char getGroupAccept() {
		return groupAccept;
	}

	public void setGroupAccept(char groupAccept) {
		this.groupAccept = groupAccept;
	}

	@Override
	public String toString() {
		return "GroupMemberVO [groupNo=" + groupNo + ", userId=" + userId + ", grade=" + grade + ", classfy=" + classfy
				+ ", groupAccept=" + groupAccept + "]";
	}
}
