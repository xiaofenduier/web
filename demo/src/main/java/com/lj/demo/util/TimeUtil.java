package com.lj.demo.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

/** 
* @author liujie 
* @version 创建时间：2017年9月1日 下午3:27:06 
* 类说明 
*/
public class TimeUtil {

	public String Date2String(Date date){
		String result = StringUtils.EMPTY;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		result = simpleDateFormat.format(date);
		return result;
	}
	
	public String getCurrentDate(){
		Date date = new Date();
		String result = StringUtils.EMPTY;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		result = simpleDateFormat.format(date);
		return result;
	}
}
