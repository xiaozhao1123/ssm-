package com.zhao.control;

import com.zhao.bean.Msg;
import com.zhao.bean.User;
import com.zhao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Usercontrol {


        @Autowired
        private UserService userService;
        //进行登录验证-判断密码是否正确
        @RequestMapping(value = "/login1")
        @ResponseBody
        public Msg form1(@RequestParam("username") String username, @RequestParam("password") String password) {
            User user = userService.logincheck(username, password);
            if(user==null){
                return Msg.error().add("msg","密码错误");
            }
            else{
                return Msg.success().add("msg","");
            }
        }
        //进行登录验证-判断用名是否正确
        @RequestMapping(value = "/login2")
        @ResponseBody
        public Msg form2(@RequestParam("username") String username) {
        //先判断用户名是否存在
        User isLogin = userService.logincheck(username,null);
        if (isLogin==null){
            return Msg.error().add("msg","用户名不存在");
        }
        else{
            return Msg.success().add("msg","");
        }
    }
        //进行注册
        @RequestMapping(value = "/register")
        @ResponseBody
        public Msg register(@RequestParam(value = "username") String username, @RequestParam(value = "password",defaultValue = "123") String password) {
            //先用登录来判断用户名是否存在
            User logincheck = userService.logincheck(username, null);
            if(logincheck==null){
                userService.register(username,password);
                System.out.println("注册成功");
                return Msg.success().add("msg","恭喜你，用户"+username+"注册成功");
            }
            else {
                Msg.error().setFlag(false);
                return Msg.error().add("msg","对不起，用户"+username+"已存在,请重新注册");
            }
        }

        //进行注册验证
        @RequestMapping(value = "/checkname")
        @ResponseBody
        public Msg checkname(@RequestParam("username")String username){
            //先判断用户名是否符合格式
            String name="(^[a-zA-Z0-9_-]{3,10}$)";
            System.out.println("username=="+username);
            if(!username.matches(name)){
                return Msg.error().add("msg","用户名必须是3到16位的英文");
            }
            //再判断用户名是否重复
            User user = userService.checkname(username);
            if(user==null){
                return Msg.success().add("msg","用户名可用");
            }
            else{
                return Msg.error().add("msg","用户名已存在");
            }
        }


        //进行页面跳转
        @RequestMapping(value = "toRegister")
        public String register() {
            return "/register";
        }
}
