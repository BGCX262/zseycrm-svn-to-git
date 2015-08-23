package cn.zsey.bean.system;

import cn.zsey.common.SOSupport;

/**
 * 地区
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
public class AreaSO extends SOSupport {
	private static final long serialVersionUID = -1072527781786168567L;
	private String code;// 编号
	private Long name;// 名称
	private AreaSO area;// 所属地区

	public AreaSO() {
		super();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getName() {
		return name;
	}

	public void setName(Long name) {
		this.name = name;
	}

	public AreaSO getArea() {
		return area;
	}

	public void setArea(AreaSO area) {
		this.area = area;
	}

}
