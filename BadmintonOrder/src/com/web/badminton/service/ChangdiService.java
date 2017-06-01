package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.Changdi;

public interface ChangdiService {

	public int add(Changdi changdi);

	public int delete(Changdi changdi);

	public int update(Changdi changdi);

	public List<Changdi> selectList(Changdi changdi, int start, int pageSize);
	
	public Changdi selectbyid(Changdi changdi);

	long count(Changdi changdi);
}
