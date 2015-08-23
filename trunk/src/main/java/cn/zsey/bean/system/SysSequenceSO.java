package cn.zsey.bean.system;

import cn.zsey.common.SOSupport;

public class SysSequenceSO extends SOSupport {
	private static final long serialVersionUID = -1220706710102132700L;
	private String seqName;// 流水号名称
	private String seqValue;// 流水号值
	private String caption;// 流水号备注

	public SysSequenceSO() {
		super();
	}

	public String getSeqName() {
		return seqName;
	}

	public void setSeqName(String seqName) {
		this.seqName = seqName;
	}

	public String getSeqValue() {
		return seqValue;
	}

	public void setSeqValue(String seqValue) {
		this.seqValue = seqValue;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

}
