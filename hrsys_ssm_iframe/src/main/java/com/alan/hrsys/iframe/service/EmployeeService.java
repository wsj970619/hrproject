package com.alan.hrsys.iframe.service;

import com.alan.hrsys.iframe.entity.Employee;

import java.util.List;

public interface EmployeeService {

	List<Employee> search(Employee condition);

	Employee searchById(Integer id);

	boolean add(Employee emp);

	boolean update(Employee emp);

	boolean delete(Integer id);


}
