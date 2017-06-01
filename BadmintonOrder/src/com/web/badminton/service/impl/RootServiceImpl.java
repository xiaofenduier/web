package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.badminton.dao.RootMapper;
import com.web.badminton.model.Root;
import com.web.badminton.model.RootExample;
import com.web.badminton.service.RootService;

@Service("rootService")
public class RootServiceImpl implements RootService {

	@Autowired
	private RootMapper rootMapper;
	
	@Override
	public int add(Root root) {
		return rootMapper.insert(root);
	}

	@Override
	public List<Root> selectList(Root root, int start, int pageSize) {
		RootExample rootExample = new RootExample();
		rootExample = buildRootExample(root);
		rootExample.setStart(start);
		rootExample.setLimit(pageSize);
		return rootMapper.selectByExample(rootExample);
	}

	@Override
	public long count(Root root) {
		RootExample rootExample = new RootExample();
		rootExample = buildRootExample(root);
		return rootMapper.countByExample(rootExample);
	}

	private RootExample buildRootExample(Root root){
		RootExample rootExample = new RootExample();
		RootExample.Criteria criteria = rootExample.createCriteria();
		rootExample.setOrderByClause("id desc");
		if(root.getTelphone() != null){
			criteria.andTelphoneEqualTo(root.getTelphone());
		}
		if(root.getPassword() != null){
			criteria.andPasswordEqualTo(root.getPassword());
		}
		if(root.getUsername() != null){
			criteria.andUsernameLike("%" + root.getUsername() +"%");
		}
		if(root.getRealname() != null){
			criteria.andRealnameLike("%" + root.getRealname() +"%");
		}
		return rootExample;
	}

	@Override
	public int delete(Root root) {
		return rootMapper.deleteByPrimaryKey(root.getId());
	}

	@Override
	public int update(Root root) {
		return rootMapper.updateByPrimaryKeySelective(root);
	}
}
