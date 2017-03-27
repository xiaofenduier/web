package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.MessageMapper;
import com.web.order.model.Message;
import com.web.order.model.MessageExample;
import com.web.order.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public List<Message> selectwithpage(Message message, int start, int pageSize) {
		MessageExample messageExample = new MessageExample();
		messageExample = buildMessageExample(message);
		messageExample.setStart(start);
		messageExample.setLimit(pageSize);
		return messageMapper.selectByExample(messageExample);
	}

	@Override
	public int insert(Message message) {
		return messageMapper.insert(message);
	}
	
	private MessageExample buildMessageExample(Message message) {
		MessageExample messageExample = new MessageExample();
		MessageExample.Criteria criteria = messageExample.createCriteria();
		messageExample.setOrderByClause("id desc");
		try{
			if(message.getContent() != null && message.getContent() != ""){
				criteria.andContentLike("%"+message.getContent()+"%");
			}
			if(message.getShopname() != null && message.getShopname() != ""){
				criteria.andShopnameLike("%"+message.getShopname()+"%");
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return messageExample;
	}

	@Override
	public long count(Message message) {
		MessageExample messageExample = new MessageExample();
		messageExample = buildMessageExample(message);
		return messageMapper.countByExample(messageExample);
	}

	@Override
	public int delete(Message message) {
		return messageMapper.deleteByPrimaryKey(message.getId());
	}

	@Override
	public Message select(Message message) {
		return messageMapper.selectByPrimaryKey(message.getId());
	}

	@Override
	public int update(Message message) {
		return messageMapper.updateByPrimaryKey(message);
	}

}
