package com.web.badminton.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.web.badminton.model.Changdi;
import com.web.badminton.service.ChangdiService;

@Controller
@RequestMapping("changdi")
public class ChangdiController {

	private String localPath;
	
	@Autowired
	private ChangdiService changdiService;
	
	@ResponseBody
	@RequestMapping("/upload")
	public Map<String, Object> upload(HttpServletRequest request) throws IOException {
		String path = "E:/javawp/BadmintonOrder/WebContent/img/";
		String p = request.getContextPath()+"/img/";
		Map<String, Object> map = new HashMap<String, Object>();
		//获取解析器  
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        //判断是否是文件  
        if(resolver.isMultipart(request)){  
            //进行转换  
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)(request);  
            //获取所有文件名称  
            Iterator<String> it = multiRequest.getFileNames();  
            while(it.hasNext()){  
                //根据文件名称取文件  
                MultipartFile file = multiRequest.getFile(it.next());  
                String fileName = file.getOriginalFilename();  
                localPath = path + fileName;  
                System.out.println(localPath);
                File newFile = new File(localPath);  
                //上传的文件写入到指定的文件中  
                file.transferTo(newFile); 
                localPath = p + fileName;
                map.put("path", localPath);
            }  
        }
		return map;  
	}
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Changdi changdi){
		changdi.setPic(localPath);
		return changdiService.add(changdi);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(Changdi changdi, int currentPage, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = changdiService.count(changdi);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<Changdi> changdiList = new ArrayList<Changdi>();
		changdiList = changdiService.selectList(changdi, start, pageSize);
		map.put("data", changdiList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Changdi changdi){
		return changdiService.delete(changdi);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Changdi changdi){
		System.out.println("1111111111111111");
		changdi.setPic(localPath);
		return changdiService.update(changdi);
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Changdi select(Changdi changdi){
		int start = 0;
		int pageSize = 5;
		List<Changdi> changdiList = new ArrayList<Changdi>();
		changdiList = changdiService.selectList(changdi, start, pageSize);
		if(changdiList.size() > 0){
			return changdiList.get(0);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("selectbyid")
	public Changdi selectbyid(Changdi changdi){
		return changdiService.selectbyid(changdi);
	}
}
