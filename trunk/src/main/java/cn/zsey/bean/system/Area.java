package cn.zsey.bean.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.zsey.bean.EntitySupport;

/**
 * 地区
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
@Entity
@Table(name = "area")
public class Area extends EntitySupport {
	private static final long serialVersionUID = -1072527781786168567L;
	@Column(name = "code", nullable = false)
	private String code;// 编号
	@Column(name = "name", nullable = false)
	private Long name;// 名称
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_area_id")
	private Area area;// 所属地区

	public Area() {
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

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

}
