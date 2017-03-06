package com.seven.sins.group.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class GroupCommentVO implements java.io.Serializable {

	private int commentNo;
	private String userId;
	private String content;
	private Date commentDate;
	private int lev;
	private int ref;
	private String photopath;
	private String backupId;
	private int writeNo;
	private String classfy;
	private int report;

	public GroupCommentVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupCommentVO(int commentNo, String userId, String content, Date commentDate, int lev, int ref,
			String photopath, String backupId, int writeNo, String classfy, int report) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.content = content;
		this.commentDate = commentDate;
		this.lev = lev;
		this.ref = ref;
		this.photopath = photopath;
		this.backupId = backupId;
		this.writeNo = writeNo;
		this.classfy = classfy;
		this.report = report;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	public String getBackupId() {
		return backupId;
	}

	public void setBackupId(String backupId) {
		this.backupId = backupId;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "GroupCommentVO [commentNo=" + commentNo + ", userId=" + userId + ", content=" + content
				+ ", commentDate=" + commentDate + ", lev=" + lev + ", ref=" + ref + ", photopath=" + photopath
				+ ", backupId=" + backupId + ", writeNo=" + writeNo + ", classfy=" + classfy + ", report=" + report
				+ "]";
	}
}
