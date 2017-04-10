package com.web.order.controller;

import java.io.File;
import java.io.IOException;
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

import com.web.order.model.Notice;
import com.web.order.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	private String localPath;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Notice notice){
		notice.setPic(localPath);
		return noticeService.insert(notice);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Notice notice){
		return noticeService.update(notice);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Notice notice){
		return noticeService.delete(notice);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithpage(int currentPage, int pageSize, Notice notice){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = noticeService.count(notice);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<Notice> noticeList = noticeService.selectwithpage(notice, start, pageSize);
		map.put("data", noticeList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(Notice notice){
		Map<String, Object> map = new HashMap<String, Object>();
		Notice notice2 = noticeService.select(notice);
		map.put("data", notice2);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/upload")
	public Map<String, Object> upload(HttpServletRequest request) throws IOException {
		String path = "C:/Users/lj/Desktop/1/test/test/test/WebContent/img/";
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
}
