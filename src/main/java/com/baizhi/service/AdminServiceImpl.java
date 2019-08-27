package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    //1.根据用户名查找
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Admin findByUsername(String username) {
        Admin admin = adminDao.selectByUsername(username);
        return admin;
    }
}
