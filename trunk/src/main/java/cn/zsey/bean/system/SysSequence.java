package cn.zsey.bean.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.zsey.bean.EntitySupport;

/**
 * 系统流水号
 * 
 * @author 杜永生
 * 
 */
@Entity
@Table(name = "sys_sequence")
public class SysSequence extends EntitySupport {
	private static final long serialVersionUID = -7016232977221949245L;
	@Column(name = "seq_name", nullable = false, unique = true)
	private String seqName;// 流水号名称
	@Column(name = "seq_value", nullable = false, length = 22)
	private Integer seqValue;// 流水号值
	@Column(name = "caption")
	private String caption;// 流水号备注

	public SysSequence() {
		super();
	}

	public String getSeqName() {
		return seqName;
	}

	public void setSeqName(String seqName) {
		this.seqName = seqName;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public Integer getSeqValue() {
		return seqValue;
	}

	public void setSeqValue(Integer seqValue) {
		this.seqValue = seqValue;
	}

}
