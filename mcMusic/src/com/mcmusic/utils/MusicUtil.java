package com.mcmusic.utils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

/**
 * 音乐歌词解析工具类
 * @author momolela
 * 
 */
public class MusicUtil{

	/**
	 * 获取音乐歌词
	 * @param request 服务器请求
	 * @return String 歌词
	 *  
	 */
	public static String getLrc(HttpServletRequest request){
		
		// 存储歌词的容器
		StringBuffer buffer = new StringBuffer();
		
		// 获取音乐名称
		String name = request.getParameter("name");
		// 获取音乐对应的歌词路径
		String filePath = request.getSession().getServletContext().getRealPath("/music/lrc")+"/"+name+".lrc";
		
		FileInputStream ins = null;
		InputStreamReader isr = null;
		BufferedReader bf = null;
		
		try{
			// 开始读取歌词文件
			ins = new FileInputStream(filePath);
			isr = new InputStreamReader(ins, "utf-8");
			// 获取歌词缓冲流，进行读取
			bf = new BufferedReader(isr);
			String temp = null;
			while((temp = bf.readLine()) != null){
				buffer.append(temp+"\n");
			}
			
		}catch(Exception e){
			return "null";
		} finally{
			if(bf != null){
				try {
					bf.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(ins != null){
				try {
					ins.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		return buffer.toString();
	}
}
