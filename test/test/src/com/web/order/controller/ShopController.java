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

import com.web.order.model.Shop;
import com.web.order.service.ShopService;

@Controller
@RequestMapping("shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	private String localPath;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Shop shop){
		shop.setPic(localPath);
		return shopService.insert(shop);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Shop shop){
		return shopService.update(shop);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Shop shop){
		return shopService.delete(shop);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithpage(int currentPage, int pageSize, Shop shop){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = shopService.count(shop);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<Shop> shopList = shopService.selectwithpage(shop, start, pageSize);
		map.put("data", shopList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
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
