package com.alan.hrsys.springboot.dao;

import com.alan.hrsys.springboot.entity.Department;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DepartmentDao {

    public List<Department> search();

    public Department searchById(Integer id);

    public int add(Department dep);

    public int update(Department dep);

    public int delete(int id);

}
