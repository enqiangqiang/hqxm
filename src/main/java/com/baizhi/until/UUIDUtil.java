package com.baizhi.until;

import java.util.UUID;

public class UUIDUtil {
    public static String uuid() {
        String uid = UUID.randomUUID().toString();
        String uuid = uid.replace("-", "");
        return uuid;
    }
}
