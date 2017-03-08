package com.seven.sins.group.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class GroupVO implements java.io.Serializable {
	
	private int groupNo;
	private String groupName;
	private String groupInfo;
	private String keyword;
	private int groupLike;
	private String filepath;
	private String category1;
	private Date createDate;
	private String classify;
	private String userId;
	private int memberCount;
	private String deleteYN;

	public GroupVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupVO(int groupNo, String groupName, String groupInfo, String keyword, int groupLike, String filepath,
			String category1, Date createDate, String classify, String userId, int memberCount, String deleteYN) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupInfo = groupInfo;
		this.keyword = keyword;
		this.groupLike = groupLike;
		this.filepath = filepath;
		this.category1 = category1;
		this.createDate = createDate;
		this.classify = classify;
		this.userId = userId;
		this.memberCount = memberCount;
		this.deleteYN = deleteYN;
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

	public String getGroupInfo() {
		return groupInfo;
	}

	public void setGroupInfo(String groupInfo) {
		this.groupInfo = groupInfo;
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

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}
}