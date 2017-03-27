package com.web.order.dao;

import com.web.order.model.Information;
import com.web.order.model.InformationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InformationMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	long countByExample(InformationExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int deleteByExample(InformationExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int insert(Information record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int insertSelective(Information record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	List<Information> selectByExample(InformationExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	Information selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int updateByExampleSelective(@Param("record") Information record, @Param("example") InformationExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int updateByExample(@Param("record") Information record, @Param("example") InformationExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int updateByPrimaryKeySelective(Information record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_information
	 * @mbg.generated  Mon Mar 06 00:15:07 CST 2017
	 */
	int updateByPrimaryKey(Information record);
}