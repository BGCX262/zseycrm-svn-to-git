package cn.zsey.dao.system;

import cn.zsey.bean.employee.Employee;
import cn.zsey.bean.employee.EmployeeSO;
import cn.zsey.dao.BaseDAO;

public interface EmployeeDAO extends BaseDAO<Employee, EmployeeSO> {
	public Employee login(String username, String password);

}
