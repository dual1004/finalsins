package com.seven.sins.qna.vo;

import java.sql.Date;

public class QnaContent implements java.io.Serializable{

	
	private int qnaNo;
	private String title;
	private String content;
	private String filepath;
	private Date writeDate;
	private int readCount;
	private String userId;
	
	
	public QnaContent(){}
	
	public QnaContent(int qnaNo, String title, String content, String filepath, Date writeDate, int readCount,
			String userId) {
		super();
		this.qnaNo = qnaNo;
		this.title = title;
		this.content = content;
		this.filepath = filepath;
		this.writeDate = writeDate;
		this.readCount = readCount;
		this.userId = userId;
	}
	
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
