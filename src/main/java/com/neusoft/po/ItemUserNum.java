package com.neusoft.po;

//猜你喜欢-推荐商品model封装
public class ItemUserNum {
	
	private Integer userId;//用户ID
	private Integer num;//购买商品数量
	private Integer itemId;//商品ID
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	@Override
	public String toString() {
		return "ItemUserNum [userId=" + userId + ", num=" + num + ", itemId=" + itemId + "]";
	}
	
	

}
