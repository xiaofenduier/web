package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.NoticeMapper;
import com.web.order.model.Notice;
import com.web.order.model.NoticeExample;
import com.web.order.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<Notice> selectwithpage(Notice notice, int start, int pageSize) {
		NoticeExample noticeExample = new NoticeExample();
		noticeExample = buildNoticeExample(notice);
		noticeExample.setLimit(pageSize);
		noticeExample.setStart(start);
		return noticeMapper.selectByExample(noticeExample);
	}

	@Override
	public int insert(Notice notice) {
		return noticeMapper.insert(notice);
	}

	@Override
	public int update(Notice notice) {
		return noticeMapper.updateByPrimaryKey(notice);
	}

	@Override
	public int delete(Notice notice) {
		return noticeMapper.deleteByPrimaryKey(notice.getId());
	}

	@Override
	public long count(Notice notice) {
		NoticeExample noticeExample = new NoticeExample();
		noticeExample = buildNoticeExample(notice);
		return noticeMapper.countByExample(noticeExample);
	}

	private NoticeExample buildNoticeExample(Notice notice) {
		NoticeExample noticeExample = new NoticeExample();
		NoticeExample.Criteria criteria = noticeExample.createCriteria();
		noticeExample.setOrderByClause("id desc");
		try{
			if(notice.getIntime() != null){
				criteria.andIntimeLessThanOrEqualTo(notice.getIntime());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return noticeExample;
	}

	@Override
	public Notice select(Notice notice) {
		return noticeMapper.selectByPrimaryKey(notice.getId());
	}
}
