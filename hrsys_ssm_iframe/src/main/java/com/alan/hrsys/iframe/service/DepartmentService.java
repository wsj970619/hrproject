package com.alan.hrsys.iframe.service;


import com.alan.hrsys.iframe.entity.Department;

import java.util.List;

public interface DepartmentService {

	public List<Department> search();

	public Department searchById(Integer id);

	public boolean add(Department dep);

	public boolean update(Department dep);

	public boolean delete(Integer id);
}
