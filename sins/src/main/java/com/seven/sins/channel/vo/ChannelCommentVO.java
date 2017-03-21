package com.seven.sins.channel.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class ChannelCommentVO implements java.io.Serializable {
	
	private int channel_no;
	private String chan_article_content;
	private Date comment_date;
	private int rev;
	private int ref;
	private String chan_article_filepath;
	private String delete_yn;
	private String user_id_bak;
	private int chan_article_no;
	private String user_id;
	private String classify;
	private int report;
	public int getChannel_no() {
		return channel_no;
	}
	public void setChannel_no(int channel_no) {
		this.channel_no = channel_no;
	}
	public String getChan_article_content() {
		return chan_article_content;
	}
	public void setChan_article_content(String chan_article_content) {
		this.chan_article_content = chan_article_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getRev() {
		return rev;
	}
	public void setRev(int rev) {
		this.rev = rev;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getChan_article_filepath() {
		return chan_article_filepath;
	}
	public void setChan_article_filepath(String chan_article_filepath) {
		this.chan_article_filepath = chan_article_filepath;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public String getUser_id_bak() {
		return user_id_bak;
	}
	public void setUser_id_bak(String user_id_bak) {
		this.user_id_bak = user_id_bak;
	}
	public int getChan_article_no() {
		return chan_article_no;
	}
	public void setChan_article_no(int chan_article_no) {
		this.chan_article_no = chan_article_no;
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
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public ChannelCommentVO(int channel_no, String chan_article_content, Date comment_date, int rev, int ref,
			String chan_article_filepath, String delete_yn, String user_id_bak, int chan_article_no, String user_id,
			String classify, int report) {
		super();
		this.channel_no = channel_no;
		this.chan_article_content = chan_article_content;
		this.comment_date = comment_date;
		this.rev = rev;
		this.ref = ref;
		this.chan_article_filepath = chan_article_filepath;
		this.delete_yn = delete_yn;
		this.user_id_bak = user_id_bak;
		this.chan_article_no = chan_article_no;
		this.user_id = user_id;
		this.classify = classify;
		this.report = report;
	}
	@Override
	public String toString() {
		return "ChannelCommentVO [channel_no=" + channel_no + ", chan_article_content=" + chan_article_content
				+ ", comment_date=" + comment_date + ", rev=" + rev + ", ref=" + ref + ", chan_article_filepath="
				+ chan_article_filepath + ", delete_yn=" + delete_yn + ", user_id_bak=" + user_id_bak
				+ ", chan_article_no=" + chan_article_no + ", user_id=" + user_id + ", classify=" + classify
				+ ", report=" + report + "]";
	}
	
	
	
	

}
