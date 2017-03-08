package com.seven.sins.mypage.vo;

import java.sql.Date;

public class MypageCommentVO {

	private int writeno;
	private String userid;
	private String comment;
	private Date commentdate;
	private int lev;
	private int ref;
	private String photopath;
	private String backupid;
	private int contentno;
	private String classfy;
	
	
	public MypageCommentVO() {
		super();
	}

	//MYPAGE_COMMENT 용
	public MypageCommentVO(int writeno, String userid, String comment, Date commentdate, int lev, int ref,
			String photopath, String backupid, int contentno, String classfy) {
		super();
		this.writeno = writeno;
		this.userid = userid;
		this.comment = comment;
		this.commentdate = commentdate;
		this.lev = lev;
		this.ref = ref;
		this.photopath = photopath;
		this.backupid = backupid;
		this.contentno = contentno;
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
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

	public String getBackupid() {
		return backupid;
	}

	public void setBackupid(String backupid) {
		this.backupid = backupid;
	}

	public int getContentno() {
		return contentno;
	}

	public void setContentno(int contentno) {
		this.contentno = contentno;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	@Override
	public String toString() {
		return  writeno + ", " + userid + ", " + comment + ", "
				+ commentdate + ", " + lev + ", " + ref + ", " + photopath + ", " + backupid
				+ ", " + contentno + ", " + classfy;
	}
	
	
}
