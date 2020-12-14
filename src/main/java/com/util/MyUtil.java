package com.util;
<<<<<<< HEAD
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import com.po.Buser;
=======

import java.text.SimpleDateFormat;
import java.util.Date;

>>>>>>> branch 'master' of https://github.com/ch20test/ch20.git
public class MyUtil {
<<<<<<< HEAD
	/**
	 * 获得时间字符串
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	/**
	 * 获得用户ID
	 */
	public static Integer getUserId(HttpSession session) {
		Buser ruser = (Buser)session.getAttribute("bruser");
		return ruser.getId();
	}
=======

	/**
	 * 获得时间字符串
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	

>>>>>>> branch 'master' of https://github.com/ch20test/ch20.git
}
