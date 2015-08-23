package cn.zsey.bean.employee;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.zsey.bean.EntitySupport;

/**
 * 部门
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
@Entity
@Table(name = "department")
public class Department extends EntitySupport {
	private static final long serialVersionUID = 1316184441132050274L;
	@Column(name = "code", nullable = false, length = 4)
	private String code;//编号
	@Column(name = "name", nullable = false, length = 20)
	private String name;//名称

	public Department() {
		super();
	}

	public Department(String code, String name) {
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
