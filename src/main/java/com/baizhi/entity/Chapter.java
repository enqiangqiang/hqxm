package com.baizhi.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chapter implements Serializable {
    @Id
    private String id;
    private String title;
    private String size;
    private String duration;
    private String name;
    private Date createDate;
    private String albumId;
    private String status;


}
