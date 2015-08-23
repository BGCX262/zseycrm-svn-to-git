package cn.zsey.bean.employee;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.zsey.bean.EntitySupport;
import cn.zsey.bean.system.Area;
import cn.zsey.bean.system.Dictionary;

/**
 * 员工
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
@Entity
@Table(name = "employee")
public class Employee extends EntitySupport {
	private static final long serialVersionUID = 6807621298641539071L;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_department_id")
	private Department department;// 部门
	@Column(name = "username", unique = true, length = 20)
	private String username;// 用户
	@Column(name = "password", length = 32)
	private String password;// 密码
	@Column(name = "realname", length = 10)
	private String realname;// 姓名
	@Column(name = "code", unique = true, length = 10)
	private String code;// 编号
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_duty_id")
	private Dictionary duty;// 职务
	@Column(name = "idcard", unique = true, length = 18)
	private String idcard;// 编号
	@Column(name = "born")
	private Date born;// 出生日期
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_nation_id")
	private Dictionary nation;// 民族
	@Column(name = "phone", length = 20)
	private String phone;// 电话
	@Column(name = "mobile", length = 11)
	private String mobile;// 手机
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_province_id")
	private Area province;// 省
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_city_id")
	private Area city;// 市
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_town_id")
	private Area town;// 区
	@Column(name = "address", length = 50)
	private String address;// 地址
	@Column(name = "zip", length = 6)
	private String zip;// 邮编

	public Employee() {
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
