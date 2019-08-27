package com.baizhi.service;

import com.baizhi.DTO.UserDTO;
import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    //1.查询轮用户所有信息
    List<User> findAllUser(Integer page, Integer rows);

    //2.查询总条数
    Integer allRows();

    //3.修改用户状态
    void changeUser(User user);

    //4.不分页查询所有用户
    List<User> findAllUserNoPage();

    //5.查询用户注册趋势
    Integer countByDate(Integer day);

    //6.查询用户地区分布
    List<UserDTO> userByProvince();
}
