package com.zhao.controol;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhao.bean.Employee;
import com.zhao.bean.Msg;
import com.zhao.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/*
*       处理员工的cred请求
*
* */
@Controller
public class EmpContorl {
    @Autowired
    EmployeeService employeeService;
    @RequestMapping("/emps")
    @ResponseBody
    //所有员工的查询（axjx）
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
            //引入PageHelper插件
            //在查询前调用,第一个参数表示第几页，第二个参数表示一页有多少条记录
            PageHelper.startPage(pn,5);
            //PageHelper后面紧跟的查询就是分页查询
            List<Employee>emp= employeeService.getall();
            //使用PageInfo包装查询后的结果，只需将pageinfo交给页面即可
            //5表示连续显示的页数
            PageInfo page=new PageInfo(emp,5);
            return Msg.success().add("pageinfo",page);
    }
    //员工的查询（jsp）
    @RequestMapping("/emp")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //引入PageHelper插件
        //在查询前调用,第一个参数表示第几页，第二个参数表示一页有多少条记录
        PageHelper.startPage(pn,5);
        //PageHelper后面紧跟的查询就是分页查询
       List<Employee>emp= employeeService.getall();
       //使用PageInfo包装查询后的结果，只需将pageinfo交给页面即可
        //5表示连续显示的页数
        PageInfo page=new PageInfo(emp,5);
        model.addAttribute("pageinfo",page);
        return "list";
    }
    //员工的添加
    @RequestMapping("/empsadd")
    @ResponseBody
    public Msg addemp(Employee employee){
        employeeService.add(employee);
        return Msg.success();
    }
    //检验是否有重名的存在
    @ResponseBody
    @RequestMapping("/check")
    public Msg checkName(String empname){
        //先判断是否符合用户名的规则
        String na="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u4e00-\\u9fa5_a-zA-Z0-9_]{2,7})";
        if(!empname.matches(na)){
            return Msg.defaul().add("va_msg","姓名必须是3到5位中文或6-16位英文");
        }
        //数据库用户名重复校验
        boolean b=employeeService.check(empname);
        if(b){
            return Msg.success();
        }else {
            return Msg.defaul().add("va_msg","用户名已存在");
        }
    }
    //单个员工信息查询
    @ResponseBody
    @RequestMapping("emp_find/{id}")
    //@PathVariable("id") 表示从路径中取出id
    public Msg empfind(@PathVariable("id") Integer id){
        Employee employee=employeeService.find(id);
        return Msg.success().add("emp",employee);
    }
    //员工数据跟新
    @ResponseBody
    @RequestMapping("update/{empId}")
    public Msg empUpdate(Employee employee){
        employeeService.update(employee);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping("emp_del/{id}")
    //@PathVariable("id") 表示从路径中取出id
    //删除单个员工
    public Msg empdel(@PathVariable("id") Integer id){
        employeeService.del(id);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping("emp_delete/{ids}")
    //@PathVariable("id") 表示从路径中取出id
    //删除多个员工
    public Msg empdelete(@PathVariable("ids") String ids){
        /*
            获取到的ids是1-2-3这种形式的
            所有先用split方法把它切割成string数组，再把数组加入到list集合中
         */
        List<Integer>list=new ArrayList<>();
        String[] str = ids.split("-");
        for(String id:str){
            list.add(Integer.valueOf(id));
        }
        employeeService.deleteall(list);
        return Msg.success();
    }
}
