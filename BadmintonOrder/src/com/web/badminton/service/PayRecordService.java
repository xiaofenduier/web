package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.PayRecord;

public interface PayRecordService {

	public int add(PayRecord payRecord);
	
	public int delete(PayRecord payRecord);
	
	public int update(PayRecord payRecord);
	
	public List<PayRecord> selectList(PayRecord payRecord, int start, int pageSize);
	
	long count(PayRecord payRecord);
}
