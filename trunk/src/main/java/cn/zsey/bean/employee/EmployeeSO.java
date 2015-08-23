package cn.zsey.bean.employee;

import java.sql.Date;

import cn.zsey.bean.system.Area;
import cn.zsey.bean.system.Dictionary;
import cn.zsey.common.SOSupport;

/**
 * 员工
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
public class EmployeeSO extends SOSupport {
	private static final long serialVersionUID = 6807621298641539071L;
	private Department department;// 部门
	private String username;// 用户
	private String password;// 密码
	private String realname;// 姓名
	private String code;// 编号
	private Dictionary duty;// 职务
	private String idcard;// 编号
	private Date born;// 出生日期
	private Dictionary nation;// 民族
	private String phone;// 电话
	private String mobile;// 手机
	private Area province;// 省
	private Area city;// 市
	private Area town;// 区
	private String address;// 地址
	private String zip;// 邮编

	public EmployeeSO() {
		super();
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Dictionary getDuty() {
		return duty;
	}

	public void setDuty(Dictionary duty) {
		this.duty = duty;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public Date getBorn() {
		return born;
	}

	public void setBorn(Date born) {
		this.born = born;
	}

	public Dictionary getNation() {
		return nation;
	}

	public void setNation(Dictionary nation) {
		this.nation = nation;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Area getProvince() {
		return province;
	}

	public void setProvince(Area province) {
		this.province = province;
	}

	public Area getCity() {
		return city;
	}

	public void setCity(Area city) {
		this.city = city;
	}

	public Area getTown() {
		return town;
	}

	public void setTown(Area town) {
		this.town = town;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

}
