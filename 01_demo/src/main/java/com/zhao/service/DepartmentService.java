package com.zhao.service;

import com.zhao.bean.Department;
import com.zhao.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;
    public List<Department> findall() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
