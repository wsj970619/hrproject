package com.alan.hrsys.iframe.dao;

import com.alan.hrsys.iframe.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
    List<Employee> search(Employee condition);
    Employee searchById(int id);
    int add(Employee emp);

    int update(Employee emp);

    int delete(int id);

    int updateByDep(int depId);

}
