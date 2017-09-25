package com.lj.demo.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/** 
* @author liujie 
* @version 创建时间：2017年9月20日 上午11:02:44 
* 类说明 
*/
public class ExcelUtil<T> {
	
	private T obj;
	
	public T getObj() {
		return obj;
	}

	public void setObj(T obj) {
		this.obj = obj;
	}

	@SuppressWarnings("unchecked")
	public void export(Map<String, Object> map, String path){
		List<String> headerList = new ArrayList<String>();
		List<T> dataList = new ArrayList<T>();
		List<String> sortList = new ArrayList<String>();
		headerList = (List<String>) map.get("header");
		dataList = (List<T>) map.get("data");
		sortList = (List<String>) map.get("sort");
		XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sh = wb.createSheet("sheet1");
        XSSFRow roHeader = sh.createRow(0);
        for(int i = 0; i < headerList.size(); i++){
        	XSSFCell cell = roHeader.createCell(i);
        	cell.setCellType(XSSFCell.CELL_TYPE_STRING);
        	cell.setCellValue(headerList.get(i));
        }
        
        for(int j = 0; j < dataList.size(); j++){
        	XSSFRow ro = sh.createRow(j+1);
        	T obj = dataList.get(j);
        	Method[] methodArr = obj.getClass().getMethods();
        	for(int k = 0; k < methodArr.length; k++){
    			Method method = methodArr[k];
    			if(method.getName().startsWith("get") && !method.getName().equals("getClass")){
    				try {
    					for(int index = 0; index < sortList.size(); index++){
    						if(method.getName().contains(sortList.get(index))){
    							XSSFCell cell = ro.createCell(index);
    			        		cell.setCellType(XSSFCell.CELL_TYPE_STRING);
    			        		cell.setCellValue(method.invoke(obj).toString());
    						}
    					}
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
    			}
        	}
        }
        File xlsFile = new File(path);
        FileOutputStream xlsStream = null;
		try {
			xlsStream = new FileOutputStream(xlsFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			wb.write(xlsStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
