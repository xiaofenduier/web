package com.web.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.order.model.Notice;
import com.web.order.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Notice notice){
		Date now = new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH");
		String time=formatter.format(now);
		notice.setIntime(time);
		return noticeService.insert(notice);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Notice notice){
		Date now = new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH");
		String time=formatter.format(now);
		notice.setIntime(time);
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
}
