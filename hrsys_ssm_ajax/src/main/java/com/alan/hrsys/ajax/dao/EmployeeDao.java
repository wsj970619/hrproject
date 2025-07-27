package com.alan.hrsys.ajax.dao;

import com.alan.hrsys.ajax.entity.Employee;

import java.util.List;

public interface EmployeeDao {
    List<Employee> search(Employee condition);
    Employee searchById(int id);
    int add(Employee emp);

    int update(Employee emp);

    int delete(int id);

    int updateByDep(int depId);

}
