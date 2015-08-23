package cn.zsey.bean.system;

import cn.zsey.common.PublicType.Sort;
import cn.zsey.common.SOSupport;

/**
 * 系统附件
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
public class AccessorySO extends SOSupport {
	private static final long serialVersionUID = -8223572511591659039L;
	private Sort dataSort;// 数据分类
	private Long dataId;// 数据ID
	private Long dataName;// 附件名
	private Long path;// 路径

	public AccessorySO() {
		super();
	}

	public AccessorySO(Sort dataSort, Long dataId, Long dataName, Long path) {
		super();
		this.dataSort = dataSort;
		this.dataId = dataId;
		this.dataName = dataName;
		this.path = path;
	}

	public Sort getDataSort() {
		return dataSort;
	}

	public void setDataSort(Sort dataSort) {
		this.dataSort = dataSort;
	}

	public Long getDataId() {
		return dataId;
	}

	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}

	public Long getDataName() {
		return dataName;
	}

	public void setDataName(Long dataName) {
		this.dataName = dataName;
	}

	public Long getPath() {
		return path;
	}

	public void setPath(Long path) {
		this.path = path;
	}

}
