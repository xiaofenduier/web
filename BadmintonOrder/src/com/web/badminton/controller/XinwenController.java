package com.web.badminton.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.web.badminton.model.Xinwen;
import com.web.badminton.service.XinwenService;

@Controller
@RequestMapping("xinwen")
public class XinwenController {

	private String localPath;
	
	@Autowired
	private XinwenService xinwenService;
	
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
	public int add(Xinwen xinwen){
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String time = formatter.format(now);
		xinwen.setTime(time);
		xinwen.setPic(localPath);
		return xinwenService.add(xinwen);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(Xinwen xinwen, int currentPage, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = xinwenService.count(xinwen);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<Xinwen> xinwenList = new ArrayList<Xinwen>();
		xinwenList = xinwenService.selectList(xinwen, start, pageSize);
		map.put("data", xinwenList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Xinwen xinwen){
		return xinwenService.delete(xinwen);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Xinwen xinwen){
		xinwen.setPic(localPath);
		return xinwenService.update(xinwen);
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Xinwen select(Xinwen xinwen){
		int start = 0;
		int pageSize = 5;
		List<Xinwen> xinwenList = new ArrayList<Xinwen>();
		xinwenList = xinwenService.selectList(xinwen, start, pageSize);
		if(xinwenList.size() > 0){
			return xinwenList.get(0);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("selectbyid")
	public Xinwen selectbyid(Xinwen xinwen){
		return xinwenService.selectbyid(xinwen);
	}
}
