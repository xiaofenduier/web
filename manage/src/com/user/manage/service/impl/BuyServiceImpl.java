package com.user.manage.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.user.manage.dao.BuyDao;
import com.user.manage.model.BuyModel;
import com.user.manage.service.BuyService;

@Service
public class BuyServiceImpl implements BuyService {

private static final Logger logger = Logger.getLogger(productionServiceImpl.class);
	
	@Resource
    private BuyDao buyDao;
	
	@Override
	public List<BuyModel> selectList(int id) {
		String hql = "from BuyModel p where p.id = "+id;
		return buyDao.selectList(hql);
	}

	@Override
	public List<BuyModel> selectListWithPage(int currentPage, int pageSize, int state, int peopleid, String roleName) {
		int pageFrom = (currentPage - 1) * pageSize;
		String hql = "from BuyModel p ";
		if(state != -1){
			hql += "where state =" + state;
		}
		if(state != -1 && roleName.equals("staff")){
			hql += " and staffId = "+peopleid;
		}
		if(state == -1 && roleName.equals("staff")){
			hql += "where staffId =" + peopleid;
		}
		return buyDao.selectListWithPage(hql, pageFrom, pageSize);
	}

	@Override
	public Serializable add(BuyModel buy) {
		return buyDao.add(buy);
	}

	@Override
	public void delete(BuyModel buy) {
		buyDao.del(buy);
	}

	@Override
	public void update(BuyModel buy) {
		buyDao.update(buy);
	}

	@Override
	public Long count(int state) {
		String hql = "select count(*) from BuyModel p ";
		if(state != -1){
			hql += "where state="+state;
		}
		return buyDao.count(hql);
	}

	@Override
	public Long countwithstate(int staffId, int state) {
		String hql = "select count(*) from BuyModel p where p.state="+state;
		if(staffId != -1){
			hql += " and p.staffId="+staffId;
		}
		return buyDao.count(hql);
	}
}
