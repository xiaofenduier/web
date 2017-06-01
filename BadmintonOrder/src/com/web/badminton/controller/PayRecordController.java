package com.web.badminton.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.badminton.model.PayRecord;
import com.web.badminton.model.User;
import com.web.badminton.service.PayRecordService;
import com.web.badminton.service.UserService;

@Controller
@RequestMapping("/parRecord")
public class PayRecordController {

	@Autowired
	private PayRecordService payRecordService;
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("add")
	@Transactional
	public int add(PayRecord payRecord) {
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = formatter.format(now);
		payRecord.setTime(time);
		float money = payRecord.getMoney();
		int userid = payRecord.getUserid();
		User user = new User();
		user.setId(userid);
		user = userService.selectbyid(user);
		user.setMoney(money + user.getMoney());
		userService.update(user);
		return payRecordService.add(payRecord);
	}

	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(PayRecord payRecord, int currentPage, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		long count = payRecordService.count(payRecord);
		long pageCount = count / pageSize;
		long flag = count % pageSize;
		if (flag != 0) {
			pageCount = pageCount + 1;
		}
		int start = (currentPage - 1) * pageSize;
		List<PayRecord> payRecordList = new ArrayList<PayRecord>();
		payRecordList = payRecordService.selectList(payRecord, start, pageSize);
		map.put("data", payRecordList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
}
