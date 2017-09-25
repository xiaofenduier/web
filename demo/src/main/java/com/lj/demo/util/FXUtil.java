package com.lj.demo.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.lj.demo.model.User;

/** 
* @author liujie 
* @version 创建时间：2017年9月19日 下午6:35:49 
* 类说明 
*/
public class FXUtil<T> {

	private T obj;
	
	public T getObj() {
		return obj;
	}

	public void setObj(T obj) {
		this.obj = obj;
	}
	
	public String getType(T obj){
		System.out.println(obj.getClass().getName());
		return obj.getClass().getName();
	}
	
	
	public void export(List<T> obList){
		for(Iterator<T> it = obList.iterator(); it.hasNext();){
			T obj = it.next();
			Field fieldArr[] = obj.getClass().getDeclaredFields();
			for(int i = 0; i < fieldArr.length; i++){
				System.out.println(fieldArr[i].getName());
			}
		}
	}
	
	public static void main(String args[]){
		FXUtil<User> util = new FXUtil<User>();
		List<User> userList = new ArrayList<User>();
		User user = new User();
		userList.add(user);
		util.getType(user);
		util.export(userList);
	}
}
