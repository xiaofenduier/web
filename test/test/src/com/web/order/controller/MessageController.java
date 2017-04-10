package com.web.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.order.model.Message;
import com.web.order.service.MessageService;

@Controller
@RequestMapping("message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Message message){
		return messageService.insert(message);
	}
	
	@ResponseBody
	@RequestMapping("count")
	public long count(Message message){
		return messageService.count(message);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Message message){
		return messageService.delete(message);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Message message){
		return messageService.update(message);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithpage(int currentPage, int pageSize, Message message){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = messageService.count(message);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		System.out.println(start);
		System.out.println(pageSize);
		List<Message> messageList = messageService.selectwithpage(message, start, pageSize);
		map.put("data", messageList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(Message message){
		Map<String, Object> map = new HashMap<String, Object>();
		Message message2 = messageService.select(message);
		map.put("data", message2);
		return map;
	}
}
