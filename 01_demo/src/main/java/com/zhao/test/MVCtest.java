package com.zhao.test;

import com.github.pagehelper.PageInfo;
import com.zhao.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:conf/Spring.xml","classpath:conf/springmvc.xml"})
public class MVCtest {
    //传入springmvc的ioc
    @Autowired
    WebApplicationContext webApplicationContext;
    //虚拟mvc请求，获取处理结果
    MockMvc mockMvc;

    @Before
    public void initMok(){
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Test
    public  void testHage() throws Exception {
            //模拟请求拿到返回值
            MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
            //请求成功以后，我们拿出pageinfo进行验证
            MockHttpServletRequest request = result.getRequest();
            PageInfo pi = (PageInfo) request.getAttribute("pageinfo");
            System.out.println(pi);
//        System.out.println("当前页码"+pi.getPageNum());
//        System.out.println("总页码"+pi.getPages());
//        System.out.println("总记录数"+pi.getTotal());
//        System.out.println("连续显示的页面");
//        int[] navigatepageNums = pi.getNavigatepageNums();
//        for(int i:navigatepageNums){
//            System.out.println(" "+i);
//        }
//        System.out.println("获取员工信息");
//        List<Employee> list = pi.getList();
//        for(Employee i:list){
//            System.out.println("ID="+i.getEmpId()+"==》姓名"+i.getEmpName());
//        }

    }
}
