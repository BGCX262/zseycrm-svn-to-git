package cn.zsey.bean.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.zsey.bean.EntitySupport;
import cn.zsey.common.PublicType.Sort;

/**
 * 系统附件
 * 
 * @author 易友软件-杜永生
 * @version 2014-03-01
 * 
 */
@Entity
@Table(name = "accessory")
public class Accessory extends EntitySupport {
	private static final long serialVersionUID = -8223572511591659039L;
	@Column(name = "data_sort", nullable = false)
	private Sort dataSort;// 数据分类
	@Column(name = "data_id", nullable = false)
	private Long dataId;// 数据ID
	@Column(name = "data_name", nullable = false, length = 255)
	private String dataName;// 附件名
	@Column(name = "path", nullable = false, length = 255)
	private String path;// 路径

	public Accessory() {
		super();
	}

	public Accessory(Sort dataSort, Long dataId, String dataName, String path) {
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

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
