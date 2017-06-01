package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.badminton.dao.PayRecordMapper;
import com.web.badminton.model.PayRecord;
import com.web.badminton.model.PayRecordExample;
import com.web.badminton.service.PayRecordService;

@Service("payRecordService")
public class PayRecordServiceImpl implements PayRecordService {

	@Autowired
	private PayRecordMapper payRecordMapper;
	
	@Override
	public int add(PayRecord payRecord) {
		return payRecordMapper.insert(payRecord);
	}

	@Override
	public int delete(PayRecord payRecord) {
		return payRecordMapper.deleteByPrimaryKey(payRecord.getId());
	}

	@Override
	public int update(PayRecord payRecord) {
		return payRecordMapper.updateByPrimaryKeySelective(payRecord);
	}

	@Override
	public List<PayRecord> selectList(PayRecord payRecord, int start, int pageSize) {
		PayRecordExample payRecordExample = new PayRecordExample();
		payRecordExample = buildPayRecordExample(payRecord);
		payRecordExample.setStart(start);
		payRecordExample.setLimit(pageSize);
		return payRecordMapper.selectByExample(payRecordExample);
	}

	@Override
	public long count(PayRecord payRecord) {
		PayRecordExample payRecordExample = new PayRecordExample();
		payRecordExample = buildPayRecordExample(payRecord);
		return payRecordMapper.countByExample(payRecordExample);
	}

	private PayRecordExample buildPayRecordExample(PayRecord payRecord){
		PayRecordExample payRecordExample = new PayRecordExample();
		PayRecordExample.Criteria criteria = payRecordExample.createCriteria();
		payRecordExample.setOrderByClause("id desc");
		if(payRecord.getUserid() != null){
			criteria.andUseridEqualTo(payRecord.getUserid());
		}
		if(payRecord.getMoney() != null){
			criteria.andMoneyEqualTo(payRecord.getMoney());
		}
		if(payRecord.getTime() != null){
			criteria.andTimeEqualTo(payRecord.getTime());
		}
		return payRecordExample;
	}
}
