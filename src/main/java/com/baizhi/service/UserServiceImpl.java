package com.baizhi.service;

import com.baizhi.DTO.UserDTO;
import com.baizhi.dao.UsreDao;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UsreDao usreDao;

    //1.查询轮用户所有信息
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<User> findAllUser(Integer page, Integer rows) {
        //计算开始下标
        Integer begin = (page - 1) * rows;
        List<User> users = usreDao.selectAllUser(begin, rows);
        return users;
    }

    //2.查询总条数
    @Override
    public Integer allRows() {
        Integer allrows = usreDao.totalRows();
        return allrows;
    }

    //3.修改用户状态
    @Override
    public void changeUser(User user) {
        usreDao.updateUser(user);
    }

    //4.不分页查询所有用户
    @Override
    public List<User> findAllUserNoPage() {
        List<User> users = usreDao.selectAllUserNoPage();
        return users;
    }

    //5.查询用户注册趋势
    @Override
    public Integer countByDate(Integer day) {
        Integer count = usreDao.getCountByDate(day);
        return count;
    }

    //6.查询用户地区分布
    @Override
    public List<UserDTO> userByProvince() {
        List<UserDTO> us = usreDao.queryUserByProvince();
        return us;
    }


}
