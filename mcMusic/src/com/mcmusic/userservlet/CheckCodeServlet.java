package com.mcmusic.userservlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自动生成二维码
 * @author Administrator
 *
 */
public class CheckCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private Font getFont()
	{
		Random random = new Random();
		Font[] font = new Font[5];
		font[0] = new Font("Ravie", Font.PLAIN, 24);  
        font[1] = new Font("Antique Olive Compact", Font.PLAIN, 24);  
        font[2] = new Font("Forte", Font.PLAIN, 24);  
        font[3] = new Font("Wide Latin", Font.PLAIN, 24);  
        font[4] = new Font("Gill Sans Ultra Bold", Font.PLAIN, 24);
		return font[random.nextInt(5)];
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("image/jpg");
		OutputStream os =  response.getOutputStream();
		response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "No-cache");  
        response.setDateHeader("Expires", 0);
        
        int width = 60,height = 30;
        BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_BGR);
        
        Graphics g = image.getGraphics();
        Color c = g.getColor(); // 保存当前画笔的颜色，用完画笔后要回复现场  
        g.fillRect(0, 0, width, height);
        
        Random random = new Random();
        char[] operate ={'+','-','*','/'}; 
        int oper2 =random.nextInt(4);
        int num1 = 1+random.nextInt(9);
        int num3 = 1+random.nextInt(9);
        int result=0;
        switch (oper2) {
		case 0:
			result = num1+num3;
			break;
		case 1:
			result = num1-num3;
			break;
		case 2:
			result = num1*num3;
			break;
		case 3:
			result = num1/num3;
			break;
		}
        String content = num1+""+operate[oper2]+""+num3+"=";
        // 设置字体  
        g.setFont(getFont());
        // 设置随机颜色  
        g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255))); 
        g.drawString(content, 5, 25);
        
        //产生随即干扰点  
        for (int i = 0; i < 20; i++) {  
            int x1 = random.nextInt(width);  
            int y1 = random.nextInt(height);  
            g.drawOval(x1, y1, 2, 2);  
        }  
        g.setColor(c); // 将画笔的颜色再设置回去  
        g.dispose();  
  
        //将验证码记录到session  
        request.getSession().setAttribute("result",result);  
        // 输出图像到页面  
        ImageIO.write(image, "JPEG", os);
	}
}
