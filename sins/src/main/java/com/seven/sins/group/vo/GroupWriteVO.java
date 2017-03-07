package com.seven.sins.group.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class GroupWriteVO implements java.io.Serializable {

	private int groupNo;
	private int writeNo;
	private String content;
	private String userId;
	private String filepath;
	private int writeLike;
	private Date writeDate;
	private int groupNoBak;
	private String groupNameBak;
	private String userIdBak;
	private String classify;
	private int report;
	
	public GroupWriteVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupWriteVO(int groupNo, int writeNo, String content, String userId, String filepath, int writeLike,
			Date writeDate, int groupNoBak, String groupNameBak, String userIdBak, String classify, int report) {
		super();
		this.groupNo = groupNo;
		this.writeNo = writeNo;
		this.content = content;
		this.userId = userId;
		this.filepath = filepath;
		this.writeLike = writeLike;
		this.writeDate = writeDate;
		this.groupNoBak = groupNoBak;
		this.groupNameBak = groupNameBak;
		this.userIdBak = userIdBak;
		this.classify = classify;
		this.report = report;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getWriteLike() {
		return writeLike;
	}

	public void setWriteLike(int writeLike) {
		this.writeLike = writeLike;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getGroupNoBak() {
		return groupNoBak;
	}

	public void setGroupNoBak(int groupNoBak) {
		this.groupNoBak = groupNoBak;
	}

	public String getGroupNameBak() {
		return groupNameBak;
	}

	public void setGroupNameBak(String groupNameBak) {
		this.groupNameBak = groupNameBak;
	}

	public String getUserIdBak() {
		return userIdBak;
	}

	public void setUserIdBak(String userIdBak) {
		this.userIdBak = userIdBak;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "GroupWriteVO [groupNo=" + groupNo + ", writeNo=" + writeNo + ", content=" + content + ", userId="
				+ userId + ", filepath=" + filepath + ", writeLike=" + writeLike + ", writeDate=" + writeDate
				+ ", groupNoBak=" + groupNoBak + ", groupNameBak=" + groupNameBak + ", userIdBak=" + userIdBak
				+ ", classify=" + classify + ", report=" + report + "]";
	}
}