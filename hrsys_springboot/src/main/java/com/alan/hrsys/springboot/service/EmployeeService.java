package com.alan.hrsys.springboot.service;

import com.alan.hrsys.springboot.entity.Employee;

import java.util.List;

public interface EmployeeService {

	List<Employee> search(Employee condition);

	Employee searchById(Integer id);

	boolean add(Employee emp);

	boolean update(Employee emp);

	boolean delete(Integer id);


}
