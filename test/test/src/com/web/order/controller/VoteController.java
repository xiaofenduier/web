package com.web.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.order.model.Cp;
import com.web.order.model.Vote;
import com.web.order.service.VoteService;

//投票管理

@Controller
@RequestMapping("/vote")
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Vote vote){
		return voteService.insert(vote);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Vote vote){
		return voteService.delete(vote.getId());
	}
	
	@ResponseBody
	@RequestMapping("cp_summar")
	public Map<String, Object> cpSummar(Cp cp){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Vote> voteList = voteService.select_cp_summar(cp);
		int rj_count = 0;
		int ztpj_count = 0;
		if (voteList.size() > 0){
			for(Vote vote : voteList){
				rj_count = rj_count + Integer.parseInt(vote.getRj());
				ztpj_count = ztpj_count + Integer.parseInt(vote.getZtpj());
			}
		}
		map.put("rj_avg", rj_count / voteList.size());
		map.put("ztpj_avg", ztpj_count / voteList.size());
		return map;
	}
}
