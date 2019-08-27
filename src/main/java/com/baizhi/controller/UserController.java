package com.baizhi.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.baizhi.DTO.UserDTO;
import com.baizhi.entity.EchartsMap;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/userController")
public class UserController {
    @Autowired
    private UserService userService;

    //1.查询所有用户
    @RequestMapping("/qureyAlluser")
    @ResponseBody
    public Map<String, Object> qureyAlluser(Integer page, Integer rows) {
        //查询数据
        List<User> us = userService.findAllUser(page, rows);
        //查询总条数
        Integer records = userService.allRows();
        //计算总页数
        Integer total = null;
        if (records % rows == 0) {
            total = records / rows;
        } else {
            total = records / rows + 1;
        }
        //按照远程加载数据的要求
        Map<String, Object> map = new HashMap<>();
        map.put("page", page);//当前页码
        map.put("total", total);//总页数
        map.put("records", records);//总条数
        map.put("rows", us);//数据

        return map;
    }

    //2.修改用户状态
    @RequestMapping("/editUser")
    @ResponseBody
    public Map<String, String> editUser(String oper, User user) {
        //创建一个表状态的map
        HashMap<String, String> map = new HashMap<>();

        if ("edit".equals(oper)) {//编辑
            userService.changeUser(user);
            map.put("status", "ok");
        }
        return map;
    }

    //3.导出用户信息
    @RequestMapping("/outUser")
    public void outUser(HttpServletRequest request, HttpServletResponse resp) throws IOException {
        List<User> users = userService.findAllUserNoPage();

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("用户信息表", "用户"),
                User.class, users);

        String fileName = "用户报表(" + new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + ").xls";
        fileName = new String(fileName.getBytes("gbk"), "iso-8859-1");
        resp.setContentType("application/vnd.ms-excel");
        resp.setHeader("content-disposition", "attachment;filename=" + fileName);
        workbook.write(resp.getOutputStream());
    }

    //5.查询用户注册趋势
    @RequestMapping("testline")
    @ResponseBody
    public List<Integer> testline() {
        List<Integer> list = new ArrayList<>();

        int a = 5;
        for (int i = 1; i <= a; i++) {
            if (i == 1) {
                Integer integer = userService.countByDate(i);
                list.add(integer);
            } else {
                Integer integer1 = userService.countByDate(i - 1);
                Integer integer2 = userService.countByDate(i);
                Integer integer3 = integer2 - integer1;
                list.add(integer3);
            }
        }
        return list;
    }

    //6.查询用户地区分布
    @RequestMapping("testMap")
    @ResponseBody
    public List<EchartsMap> testmap() {
        List<EchartsMap> list = new ArrayList<>();

        List<UserDTO> users = userService.userByProvince();
        for (UserDTO user : users) {
            EchartsMap echartsMap = new EchartsMap(user.getProvince(), user.getCounts());
            list.add(echartsMap);
        }
        return list;
    }

}
