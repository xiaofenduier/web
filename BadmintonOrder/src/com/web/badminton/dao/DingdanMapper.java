package com.web.badminton.dao;

import com.web.badminton.model.Dingdan;
import com.web.badminton.model.DingdanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DingdanMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	long countByExample(DingdanExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int deleteByExample(DingdanExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int insert(Dingdan record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int insertSelective(Dingdan record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	List<Dingdan> selectByExample(DingdanExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	Dingdan selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int updateByExampleSelective(@Param("record") Dingdan record, @Param("example") DingdanExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int updateByExample(@Param("record") Dingdan record, @Param("example") DingdanExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int updateByPrimaryKeySelective(Dingdan record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	int updateByPrimaryKey(Dingdan record);
}