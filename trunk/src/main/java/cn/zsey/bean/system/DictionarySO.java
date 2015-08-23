package cn.zsey.bean.system;

import cn.zsey.common.PublicType.Sort;
import cn.zsey.common.SOSupport;

/**
 * 数字字典
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
public class DictionarySO extends SOSupport {
	private static final long serialVersionUID = -6511695787066994254L;
	private Sort sort;// 分类
	private String code;// 编号
	private String name;// 名称
	private String caption;// 备注

	public DictionarySO() {
		super();
	}

	public DictionarySO(Sort sort, String code, String name) {
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
