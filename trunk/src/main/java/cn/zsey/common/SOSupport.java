package cn.zsey.common;

import java.util.Date;

public class SOSupport extends Pagination {
	private static final long serialVersionUID = -7800856537473769280L;
	private Long id;
	private Long creater;
	private Date createTime;
	private Long editer;
	private Date editTime;
	private Boolean flag;
	private Boolean status;
	private String keywords;
	private Boolean like;
	private String[] orders;

	public SOSupport() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCreater() {
		return creater;
	}

	public void setCreater(Long creater) {
		this.creater = creater;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getEditer() {
		return editer;
	}

	public void setEditer(Long editer) {
		this.editer = editer;
	}

	public Date getEditTime() {
		return editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Boolean getLike() {
		return like;
	}

	public void setLike(Boolean like) {
		this.like = like;
	}

	public String[] getOrders() {
		return orders;
	}

	public void setOrders(String[] orders) {
		this.orders = orders;
	}

}
