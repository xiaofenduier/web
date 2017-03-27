package com.user.manage.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.manage.dao.OutDao;
import com.user.manage.model.OutModel;
import com.user.manage.service.OutService;

@Service
public class OutServiceImpl implements OutService {

	@Resource
    private OutDao outDao;
	
	@Override
	public List<OutModel> selectList(int id) {
		String hql = "from OutModel p where p.id = "+id;
		return outDao.selectList(hql);
	}

	@Override
	public List<OutModel> selectListWithPage(int currentPage, int pageSize, int state, int peopleid, String roleName) {
		int pageFrom = (currentPage - 1) * pageSize;
		String hql = "from OutModel p ";
		if(state != -1){
			hql += "where state =" + state;
		}
		if(state != -1 && roleName.equals("staff")){
			hql += " and staffId = "+peopleid;
		}
		if(state == -1 && roleName.equals("staff")){
			hql += "where staffId =" + peopleid;
		}
		return outDao.selectListWithPage(hql, pageFrom, pageSize);
	}

	@Override
	public Serializable add(OutModel out) {
		return outDao.add(out);
	}

	@Override
	public void delete(OutModel out) {
		outDao.del(out);
	}

	@Override
	public void update(OutModel out) {
		outDao.update(out);
	}

	@Override
	public Long count(int state) {
		String hql = "select count(*) from OutModel p ";
		if(state != -1){
			hql += "where state="+state;
		}
		return outDao.count(hql);
	}

	@Override
	public Long countwithstate(int staffId, int state) {
		String hql = "select count(*) from OutModel p where p.state="+state;
		if(staffId != -1){
			hql += " and p.staffId="+staffId;
		}
		return outDao.count(hql);
	}

	@Override
	public List<OutModel> downloadExcel(int state, int peopleid, String roleName) {
		String hql = "from OutModel p ";
		if(state != -1){
			hql += "where state =" + state;
		}
		if(state != -1 && roleName.equals("staff")){
			hql += " and staffId = "+peopleid;
		}
		if(state == -1 && roleName.equals("staff")){
			hql += "where staffId =" + peopleid;
		}
		return outDao.selectList(hql);
	}

}
