package com.neusoft.po;
import java.util.*;
import java.io.Serializable;

//用户帖子表
public class UserPost implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	private Integer id;
	private Integer userId;

	private String title;
	private String field0;
	private String field1;
	private String field2;
	private String content;
	private Date createTime;
	private Date updateTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getField0() {
		return field0;
	}
	public void setField0(String field0) {
		this.field0 = field0;
	}
	public String getField1() {
		return field1;
	}
	public void setField1(String field1) {
		this.field1 = field1;
	}
	public String getField2() {
		return field2;
	}
	public void setField2(String field2) {
		this.field2 = field2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "UserPost [id=" + id + ", userId=" + userId + ", title=" + title + ", field0=" + field0 + ", field1="
				+ field1 + ", field2=" + field2 + ", content=" + content + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + "]";
	}

}

