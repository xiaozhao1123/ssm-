package com.zhao.controol;

import com.zhao.bean.Department;
import com.zhao.bean.Msg;
import com.zhao.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptControl {

    @Autowired
    private DepartmentService departmentService;
    //查询员工信息
    @RequestMapping("/depts")
    @ResponseBody
    public Msg dept_find(){
           List<Department>list= departmentService.findall();
        return  Msg.success().add("depts",list);
    }
}
