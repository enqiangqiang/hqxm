package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface AdminDao {
    //1.根据用户名查找
    Admin selectByUsername(@Param("username") String username);

}
