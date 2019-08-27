package com.baizhi.captcha;

import com.baizhi.until.ImageCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.OutputStream;

@Controller
@RequestMapping("/cap")
public class Captcha {

    @RequestMapping("/execute")
    public void execute(HttpSession session, HttpServletResponse response) throws Exception {
        //1.获取验证码随机数
        String securityCode = ImageCodeUtil.getSecurityCode();
        /**
         * 将验证码随机数存入session作用域，以便后续做验证码验证
         */
        session.setAttribute("serverCode", securityCode);
        //2.获取验证码图片
        BufferedImage image = ImageCodeUtil.createImage(securityCode);

        //3.将验证码图片响应到客户端
        OutputStream out = response.getOutputStream();
        /**
         * 第一个参数：  指定验证码图片对象
         * 第二个参数： 指定图片的子类型
         * 第三个参数： 指定一个字节数出流对象
         */
        ImageIO.write(image, "png", out);


    }

}
