package cn.zsey.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class EntitySupport implements Serializable {
	private static final long serialVersionUID = -482658751353768739L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "creater", nullable = false)
	private Long creater;
	@Column(name = "create_time", nullable = false)
	private Date createTime;
	@Column(name = "editer", nullable = false)
	private Long editer;
	@Column(name = "edit_time", nullable = false)
	private Date editTime;
	@Column(nullable = false)
	private Boolean flag;
	@Column(nullable = false)
	private Boolean status;

	public EntitySupport() {
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

}
