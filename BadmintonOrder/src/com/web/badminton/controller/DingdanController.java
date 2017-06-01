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

import com.web.badminton.model.Changdi;
import com.web.badminton.model.Dingdan;
import com.web.badminton.model.User;
import com.web.badminton.service.ChangdiService;
import com.web.badminton.service.DingdanService;
import com.web.badminton.service.UserService;

@Controller
@RequestMapping("/dingdan")
public class DingdanController {

	@Autowired
	private DingdanService dingdanService;
	@Autowired
	private ChangdiService changdiService;
	@Autowired
	private UserService userService;


	@ResponseBody
	@RequestMapping("select")
	public Dingdan select(Dingdan dingdan) {
		int start = 0;
		int pageSize = 5;
		List<Dingdan> dingdanList = new ArrayList<Dingdan>();
		dingdanList = dingdanService.selectList(dingdan, start, pageSize);
		if (dingdanList.size() > 0) {
			return dingdanList.get(0);
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("add")
	@Transactional
	public int add(Dingdan dingdan) throws Exception {
		int result = 0;
		List<Dingdan> list = new ArrayList<Dingdan>();
		list = dingdanService.selectList(dingdan, 0, 1000);
		for(int i = 0, length = list.size(); i < length; i++){
			if(dingdan.getStarttime().compareTo(list.get(i).getEndtime()) < 0){
				return -1;
			}
		}
		String starttime =  dingdan.getStarttime();
		String endtime = dingdan.getEndtime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date start = sdf.parse(starttime);
		Date end = sdf.parse(endtime);
		float timelong = end.getTime() - start.getTime();
		System.out.println(timelong);
		float time = timelong/3600/1000;
		System.out.println(time);
		dingdan.setTime(time);
		Date now = new Date();
		dingdan.setPlaytime(sdf.format(now));
		synchronized (this) {
			result = dingdanService.add(dingdan);
			User user = new User();
			Changdi c = new Changdi();
			c.setId(dingdan.getChangdiid());
			c = changdiService.selectbyid(c);
			float price = c.getPrice();
			user.setId(dingdan.getUserid());
			user = userService.selectbyid(user);
			user.setMoney(user.getMoney() - price);
			userService.update(user);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("delete")
	@Transactional
	public int delete(Dingdan dingdan) {
		Dingdan dd = new Dingdan();
		dd = dingdanService.selectbyid(dingdan);
		int changdiid = dd.getChangdiid();
		int userid = dd.getUserid();
		Changdi cd = new Changdi();
		cd.setId(changdiid);
		cd = changdiService.selectbyid(cd);
		float price = cd.getPrice();
		User user = new User();
		user.setId(userid);
		user = userService.selectbyid(user);
		dingdanService.delete(dingdan);
		user.setMoney(user.getMoney() + price);
		return userService.update(user);
	}

	@ResponseBody
	@RequestMapping("update")
	public int update(Dingdan dingdan) {
		return dingdanService.update(dingdan);
	}

	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(Dingdan dingdan, int currentPage, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		long count = dingdanService.count(dingdan);
		long pageCount = count / pageSize;
		long flag = count % pageSize;
		if (flag != 0) {
			pageCount = pageCount + 1;
		}
		int start = (currentPage - 1) * pageSize;
		List<Dingdan> dingdanList = new ArrayList<Dingdan>();
		dingdanList = dingdanService.selectList(dingdan, start, pageSize);
		map.put("data", dingdanList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
}
