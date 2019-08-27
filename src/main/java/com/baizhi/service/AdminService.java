package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    //1.根据用户名查找
    Admin findByUsername(String username);

}
