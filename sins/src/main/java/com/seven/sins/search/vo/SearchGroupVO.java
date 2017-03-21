package com.seven.sins.search.vo;

@SuppressWarnings("serial")
public class SearchGroupVO implements java.io.Serializable{

	private String groupNo;
	private String groupName;
	private String category;
	private int joinNum;
	private boolean isJoin;
	
	public SearchGroupVO(){}
	
	public SearchGroupVO(String groupNo, String groupName, String category, int joinNum, boolean isJoin) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.category = category;
		this.joinNum = joinNum;
		this.isJoin = isJoin;
	}
	
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
	}
	public boolean isJoin() {
		return isJoin;
	}
	public void setJoin(boolean isJoin) {
		this.isJoin = isJoin;
	}
	
	
}
