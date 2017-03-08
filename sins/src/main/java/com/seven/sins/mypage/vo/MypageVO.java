package com.seven.sins.mypage.vo;

import java.sql.Date;
@SuppressWarnings("serial")
public class MypageVO {
	
	private int writeno;
	private String userid;
	private String filepath;
	private String comment;
	private String keyword;
	private Date writedate;
	private int writelink;
	private String backupid;
	private String classfy;
	private String createid;
	private int report;
	
	
	public MypageVO() {
		super();
	}

    //MY_PAGE 용
	public MypageVO(int writeno, String userid, String filepath, String comment, String keyword, Date writedate,
			int writelink, String backupid, String classfy, String createid, int report) {
		super();
		this.writeno = writeno;
		this.userid = userid;
		this.filepath = filepath;
		this.comment = comment;
		this.keyword = keyword;
		this.writedate = writedate;
		this.writelink = writelink;
		this.backupid = backupid;
		this.classfy = classfy;
		this.createid = createid;
		this.report = report;
	}
	
	

    //MYPAGE_LIKE 용
	public MypageVO(int writeno, String userid, String classfy) {
		super();
		this.writeno = writeno;
		this.userid = userid;
		this.classfy = classfy;
	}


	public int getWriteno() {
		return writeno;
	}


	public void setWriteno(int writeno) {
		this.writeno = writeno;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public Date getWritedate() {
		return writedate;
	}


	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}


	public int getWritelink() {
		return writelink;
	}


	public void setWritelink(int writelink) {
		this.writelink = writelink;
	}


	public String getBackupid() {
		return backupid;
	}


	public void setBackupid(String backupid) {
		this.backupid = backupid;
	}


	public String getClassfy() {
		return classfy;
	}


	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}


	public String getCreateid() {
		return createid;
	}


	public void setCreateid(String createid) {
		this.createid = createid;
	}
	
	public int getNumber() {
		return report;
	}

	public void setNumber(int report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return writeno + ", " + userid + ", " + filepath + ", " + comment
				+ ", " + keyword + ", " + writedate + ", " + writelink + ", "
				+ backupid + ", " + classfy + ", " + createid + ", " + report;
	}
	
	

}
