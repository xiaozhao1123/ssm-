package com.zhao.dao;

import com.zhao.bean.User;
import com.zhao.bean.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);


    User logincheck(@Param("username") String username,@Param("password") String password);

    Integer registcheck(@Param("username") String username);

    void register(@Param("username") String username,@Param("password") String password);
}