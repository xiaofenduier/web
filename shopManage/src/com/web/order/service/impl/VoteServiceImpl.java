package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.VoteMapper;
import com.web.order.model.Cp;
import com.web.order.model.Vote;
import com.web.order.model.VoteExample;
import com.web.order.service.VoteService;

@Service("voteService")
public class VoteServiceImpl implements VoteService {

	@Autowired
	private VoteMapper voteMapper;
	
	@Override
	public List<Vote> select(Vote vote) {
		VoteExample voteExample = new VoteExample();
		voteExample = buildVoteExample(vote);
		return voteMapper.selectByExample(voteExample);
	}

	@Override
	public int insert(Vote vote) {
		return voteMapper.insert(vote);
	}

	@Override
	public int update(Vote vote) {
		return voteMapper.updateByPrimaryKey(vote);
	}

	@Override
	public int delete(int id) {
		return voteMapper.deleteByPrimaryKey(id);
	}

	private VoteExample buildVoteExample(Vote vote) {
		VoteExample voteExample = new VoteExample();
		VoteExample.Criteria criteria = voteExample.createCriteria();
		voteExample.setOrderByClause("id desc");
		try{
			if (vote.getCpid() != null){
				criteria.andCpidEqualTo(vote.getCpid());
			}
			if (vote.getSjid() != null){
				criteria.andSjidEqualTo(vote.getSjid());
			}
			if (vote.getZtpj() != null){
				criteria.andZtpjGreaterThanOrEqualTo(vote.getZtpj());
			}
			if (vote.getRj() != null){
				criteria.andRjLessThanOrEqualTo(vote.getRj());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return voteExample;
	}

	@Override
	public List<Vote> select_cp_summar(Cp cp) {
		VoteExample voteExample = new VoteExample();
		Vote vote = new Vote();
		vote.setCpid(cp.getId());
		voteExample = buildVoteExample(vote);
		return voteMapper.selectByExample(voteExample);
	}

}
