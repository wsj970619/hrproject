package com.alan.hrsys.ajax.service.impl;

import com.alan.hrsys.ajax.dao.DepartmentDao;
import com.alan.hrsys.ajax.dao.EmployeeDao;
import com.alan.hrsys.ajax.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alan.hrsys.ajax.service.DepartmentService;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	DepartmentDao depDao;
	@Autowired
	EmployeeDao empDao;

	@Override
	public List<Department> search() {
		List<Department> list = depDao.search();
		return list;
	}

	@Override
	public Department searchById(Integer id) {
		Department dep = depDao.searchById(id);
		return dep;
	}

	@Override
	public boolean add(Department dep) {
		int rs = depDao.add(dep);
		return rs > 0;
	}

	@Override
	public boolean update(Department dep) {
		int rs = depDao.update(dep);
		return rs > 0;
	}

	@Override
	public boolean delete(Integer id) {
		int rs = depDao.delete(id);
		rs = empDao.updateByDep(id);
		return rs > 0;
	}

}
