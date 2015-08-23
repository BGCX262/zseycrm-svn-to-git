package cn.zsey.bean.employee;

import cn.zsey.common.SOSupport;

/**
 * 部门
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
public class DepartmentSO extends SOSupport {
	private static final long serialVersionUID = 1316184441132050274L;
	private String code;// 编号
	private String name;// 名称

	public DepartmentSO() {
		super();
	}

	public DepartmentSO(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
