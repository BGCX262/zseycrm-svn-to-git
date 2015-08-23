package cn.zsey.bean.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import cn.zsey.bean.EntitySupport;
import cn.zsey.common.PublicType.Sort;

/**
 * 数字字典
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
@Entity
@Table(name = "dictionary")
public class Dictionary extends EntitySupport {
	private static final long serialVersionUID = 2254936291866534019L;
	@Column(name = "sort", nullable = false, length = 20)
	@Enumerated(EnumType.STRING)
	private Sort sort;// 分类
	@Column(name = "code", nullable = false, length = 4)
	private String code;// 编号
	@Column(name = "name", nullable = false, length = 20)
	private String name;// 名称
	private String caption;// 备注

	public Dictionary() {
		super();
	}

	public Dictionary(Sort sort, String code, String name) {
		super();
		this.sort = sort;
		this.code = code;
		this.name = name;
	}

	public Sort getSort() {
		return sort;
	}

	public void setSort(Sort sort) {
		this.sort = sort;
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

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}
}
