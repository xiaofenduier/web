package com.hospital.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Time {
	
	public List<String> getTime(){
		List<String> list = new ArrayList<String>();
		Calendar c = Calendar.getInstance();
		c.setTime(new Date(System.currentTimeMillis()));
		c.add(Calendar.DAY_OF_YEAR, +1);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		switch (dayOfWeek) {
		  case 1:
		   System.out.println("星期日");
		   break;
		  case 2:
		   System.out.println("星期一");
		   break;
		  case 3:
		   System.out.println("星期二");
		   break;
		  case 4:
		   System.out.println("星期三");
		   break;
		  case 5:
		   System.out.println("星期四");
		   break;
		  case 6:
		   System.out.println("星期五");
		   break;
		  case 7:
		   System.out.println("星期六");
		   break;
		  }
		return list;
	}
}
