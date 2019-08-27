package com.baizhi.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {
    @Excel(name = "用户id")
    private String id;
    @Excel(name = "用户电话")
    private String phone;
    @Excel(name = "用户名")
    private String username;
    @Excel(name = "用户密码")
    private String password;
    @Excel(name = "用户性别", replace = {"男_1", "女_0"}, suffix = "生")
    private String sex;
    private String head_pic;
    @Excel(name = "法师名")
    private String dharma;
    @Excel(name = "省份")
    private String province;
    @Excel(name = "城市")
    private String city;
    @Excel(name = "签名")
    private String sign;
    @Excel(name = "状态", replace = {"正常_y", "冻结_n"})
    private String status;
    @Excel(name = "创建日期", format = "yyyy-MM-dd", width = 30)
    private Date create_date;


}
