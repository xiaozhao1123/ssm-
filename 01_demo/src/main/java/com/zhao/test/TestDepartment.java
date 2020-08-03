package com.zhao.test;


import com.zhao.bean.Department;
import com.zhao.bean.Employee;
import com.zhao.dao.DepartmentMapper;
import com.zhao.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;
/*
*   1、导入Spring-test依赖
*   2、使用ContextConfiguration注解来指定spring文件的位置
*
* */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:conf/Spring.xml")
public class TestDepartment {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper emp;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testdep_add(){
        departmentMapper.insertSelective(new Department(null,"研发部"));
        departmentMapper.insertSelective(new Department(null,"宣传部"));
    }
    @Test
    public void testemp_add(){
        //进行单个添加
//        emp.insertSelective(new Employee(null,"赵云","男","zhaoyun@123",1));
//        emp.insertSelective(new Employee(null,"张飞","男","zhaoyun@123",2));
        //进行批量添加
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<10;i++){
            String s = UUID.randomUUID().toString().substring(0, 4)+i;
            mapper.insert(new Employee(null,s,"男",s+"@123",1));
        }
        System.out.println("批量完成");
    }

}
