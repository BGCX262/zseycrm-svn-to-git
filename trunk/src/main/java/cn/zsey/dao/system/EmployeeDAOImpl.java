package cn.zsey.dao.system;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import cn.zsey.bean.employee.Employee;
import cn.zsey.bean.employee.EmployeeSO;
import cn.zsey.dao.BaseDAOImpl;

public class EmployeeDAOImpl extends BaseDAOImpl<Employee, EmployeeSO> implements EmployeeDAO {

	@Override
	public void switchVO2PO(Employee po, EmployeeSO so) {
	}

	@Override
	public void setCriteriaParams(Criteria criteria, EmployeeSO so) {
	}

	@Override
	public void setQueryParams(Query query, EmployeeSO so) {
	}

	@Override
	public String getHqlWhere(EmployeeSO so) {
		return null;
	}

	@Override
	public Employee login(String username, String password) {
		Session session=getSessionFactory().getCurrentSession();
		Criteria criteria=session.createCriteria(Employee.class);
		criteria.add(Restrictions.or(Restrictions.eq("username", username), Restrictions.eq("code", username)));
		criteria.add(Restrictions.eq("password", password));
		Object object = criteria.uniqueResult();
		return (Employee) object;
	}

}
