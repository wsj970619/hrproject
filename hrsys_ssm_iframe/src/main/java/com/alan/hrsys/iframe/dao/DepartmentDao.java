package com.alan.hrsys.iframe.dao;

import com.alan.hrsys.iframe.entity.Department;

import java.util.List;

public interface DepartmentDao {

    public List<Department> search();

    public Department searchById(Integer id);

    public int add(Department dep);

    public int update(Department dep);

    public int delete(int id);

}
