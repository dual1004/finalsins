package com.seven.sins.group.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class GroupVO implements java.io.Serializable {
	
	private int groupNo;
	private String groupName;
	private String keyword;
	private int groupLike;
	private String filepath;
	private int category1;
	private Date createDate;
	private String classfy;
	private String userId;
	
	public GroupVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupVO(int groupNo, String groupName, String keyword, int groupLike, String filepath, int category1,
			Date createDate, String classfy, String userId) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.keyword = keyword;
		this.groupLike = groupLike;
		this.filepath = filepath;
		this.category1 = category1;
		this.createDate = createDate;
		this.classfy = classfy;
		this.userId = userId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getGroupLike() {
		return groupLike;
	}

	public void setGroupLike(int groupLike) {
		this.groupLike = groupLike;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getCategory1() {
		return category1;
	}

	public void setCategory1(int category1) {
		this.category1 = category1;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "GroupVO [groupNo=" + groupNo + ", groupName=" + groupName + ", keyword=" + keyword + ", groupLike="
				+ groupLike + ", filepath=" + filepath + ", category1=" + category1 + ", createDate=" + createDate
				+ ", classfy=" + classfy + ", userId=" + userId + "]";
	}
}
