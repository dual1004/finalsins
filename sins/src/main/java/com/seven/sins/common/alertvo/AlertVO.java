package com.seven.sins.common.alertvo;

import java.io.Serializable;
import java.sql.Date;

public class AlertVO implements Serializable{
	private String user_id;
	private String classify;
	private int content_no;
	private Date insert_date;
	private int lev;
	private int coment_no;
	public AlertVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AlertVO(String user_id, String classify, int content_no, Date insert_date, int lev, int coment_no) {
		super();
		this.user_id = user_id;
		this.classify = classify;
		this.content_no = content_no;
		this.insert_date = insert_date;
		this.lev = lev;
		this.coment_no = coment_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getComent_no() {
		return coment_no;
	}
	public void setComent_no(int coment_no) {
		this.coment_no = coment_no;
	}
	
}
