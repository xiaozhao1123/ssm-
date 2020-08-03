package com.zhao.service;

import com.zhao.bean.Employee;
import com.zhao.bean.EmployeeExample;
import com.zhao.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     *  查询所有员工，要进行分页查询
     * @return
     */
    public List<Employee> getall() {
        return employeeMapper.selectByExamplewithdept(null);
    }
    //员工的添加
    public void add(Employee employee){
        employeeMapper.insertSelective(employee);

    }
    //查询是否有重名的员工
    public Boolean check(@RequestParam("empname") String empname) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria=employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empname);
        long f = employeeMapper.countByExample(employeeExample);
        return f==0;
    }
    //根据员工号查询员工
    public Employee find(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }
    //根据员工号更新员工
    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
    //根据员工号删除员工
    public void del(Integer id) {
          employeeMapper.deleteByPrimaryKey(id);
    }
    //根据员工号进行多个删除
    public void deleteall(List<Integer> ids) {
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        //删除变成delete xxx from xxx where emp_id in(1-2-3);
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
