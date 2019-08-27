package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    //1.登陆验证
    @RequestMapping("/loginCheck")
    @ResponseBody
    public Map<String, Object> loginCheck(String username, String password, String code, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        //根据用户名查找
        Admin admin = adminService.findByUsername(username);
        System.out.println(admin);
        if (admin != null) {
            //用户名存在，就判断密码
            if (password.equals(admin.getPassword())) {
                //密码相等就判断验证码
                String serverCode = (String) session.getAttribute("serverCode");
                if (serverCode.equals(code)) {
                    //验证码相等
                    session.setAttribute("admin", admin);
                    map.put("msg", "YY");
                } else {
                    map.put("msg", "CN");
                }
            } else {
                map.put("msg", "PN");
            }
        } else {
            map.put("msg", "UN");
        }
        return map;
    }

    //2.退出登陆
    @RequestMapping("/exit")
    public String exit(HttpSession session) {
        session.invalidate();
        return "redirect:/login/login.jsp";
    }


}
