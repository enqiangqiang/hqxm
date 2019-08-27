package com.baizhi.dao;

import com.baizhi.DTO.UserDTO;
import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UsreDao {
    //1.查询用户所有信息
    List<User> selectAllUser(@Param("begin") Integer begin, @Param("rows") Integer rows);

    //2.查询总条数
    Integer totalRows();

    //3.修改用户状态
    void updateUser(User user);

    //4.不分页查询所有用户
    List<User> selectAllUserNoPage();

    //5.查询用户注册趋势
    Integer getCountByDate(Integer day);

    //6.查询用户地区分布
    List<UserDTO> queryUserByProvince();


}
