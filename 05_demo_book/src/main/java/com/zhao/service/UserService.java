package com.zhao.service;

import com.zhao.bean.User;
import com.zhao.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public User logincheck(String username, String password) {
      return userMapper.logincheck(username,password);
    }

    public User checkname(String username) {
       return userMapper.logincheck(username,null);
    }

    public void register(String username, String password) {
        userMapper.register(username,password);
    }
}
