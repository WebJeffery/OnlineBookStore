package com.bookStore.goods.Utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class VerifyCode {
    private int w = 70;
    private int h = 35;
    private Random r = new Random();
    private String[] fontNames = new String[]{"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};//验证码可用字体
    private String codes = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";//去掉1，I，0,O易混淆的验证码
    private Color bgColor = new Color(255, 255, 255);//底层颜色
    private String text;//验证码的数据

    public VerifyCode() {
    }

    private Color randomColor() {//随机颜色
        int red = this.r.nextInt(150);
        int green = this.r.nextInt(150);
        int blue = this.r.nextInt(150);
        return new Color(red, green, blue);
    }

    private Font randomFont() {//随机字体
        int index = r.nextInt(fontNames.length);//随机数（小于字符串数组fontNames的长度）
        String fontName = fontNames[index];//从字符串数组中拿到特定字符串
        int style = r.nextInt(4);
        int size = r.nextInt(5) + 24;
        return new Font(fontName, style, size);
    }

    private void drawLine(BufferedImage image) {
        int num = 3;
        Graphics2D g2 = (Graphics2D)image.getGraphics();//Graphics2D：在 Java(tm) 平台上呈现二维形状、文本和图像的基础类
        for(int i = 0; i < num; ++i) {/*随机两点中划线，4次*/
            int x1 = r.nextInt(this.w);
            int y1 = r.nextInt(this.h);
            int x2 = r.nextInt(this.w);
            int y2 = r.nextInt(this.h);
            g2.setStroke(new BasicStroke(1.5F));//描边决定着图形或文字的轮廓。通过setStroke()方法定义描边：边缘即可以是粗细不等的实线，也可以是等宽点线。
            g2.setColor(Color.BLUE);
            g2.drawLine(x1, y1, x2, y2);
        }

    }

    private char randomChar() {
        int index = this.r.nextInt(this.codes.length());//随机数（小于字符串codes的长度）
        return this.codes.charAt(index);//从字符串中拿到特定字符
    }

    private BufferedImage createImage() {
        BufferedImage image = new BufferedImage(w, h, 1);
        Graphics2D g2 = (Graphics2D)image.getGraphics();
        g2.setColor(bgColor);//设置底层颜色
        g2.fillRect(0, 0, w, h);
        return image;
    }

    public BufferedImage getImage() {
        BufferedImage image = createImage();
        Graphics2D g2 = (Graphics2D)image.getGraphics();
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < 4; ++i) {
            String randomString = String.valueOf(randomChar());
            sb.append(randomString);
            float x = (float)i * 1.0F * (float)w / 4.0F;
            g2.setFont(randomFont());
            g2.setColor(randomColor());
            g2.drawString(randomString, x, (float)(h - 5));//后两参数为坐标
        }
        text = sb.toString();
        drawLine(image);//最后在图片里划线
        return image;
    }

    public String getText() {
        return this.text;
    }

    public static void output(BufferedImage image, OutputStream out) throws IOException {//将BufferedImage以JPEG写出到OutputStream中
        ImageIO.write(image, "JPEG", out);
    }
}
