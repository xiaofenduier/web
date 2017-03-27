package com.web.order.dao;

import com.web.order.model.MyCp;
import com.web.order.model.MyCpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MyCpMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	long countByExample(MyCpExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int deleteByExample(MyCpExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int insert(MyCp record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int insertSelective(MyCp record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	List<MyCp> selectByExample(MyCpExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	MyCp selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int updateByExampleSelective(@Param("record") MyCp record, @Param("example") MyCpExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int updateByExample(@Param("record") MyCp record, @Param("example") MyCpExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int updateByPrimaryKeySelective(MyCp record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_mycp
	 * @mbg.generated  Thu Mar 23 15:53:41 CST 2017
	 */
	int updateByPrimaryKey(MyCp record);
}