package com.web.order.model;

import java.util.ArrayList;
import java.util.List;

public class CpExample extends BaseExample{
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public CpExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(Integer value) {
			addCriterion("id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(Integer value) {
			addCriterion("id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(Integer value) {
			addCriterion("id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(Integer value) {
			addCriterion("id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(Integer value) {
			addCriterion("id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<Integer> values) {
			addCriterion("id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<Integer> values) {
			addCriterion("id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(Integer value1, Integer value2) {
			addCriterion("id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(Integer value1, Integer value2) {
			addCriterion("id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andTypeidIsNull() {
			addCriterion("typeid is null");
			return (Criteria) this;
		}

		public Criteria andTypeidIsNotNull() {
			addCriterion("typeid is not null");
			return (Criteria) this;
		}

		public Criteria andTypeidEqualTo(String value) {
			addCriterion("typeid =", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotEqualTo(String value) {
			addCriterion("typeid <>", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidGreaterThan(String value) {
			addCriterion("typeid >", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidGreaterThanOrEqualTo(String value) {
			addCriterion("typeid >=", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidLessThan(String value) {
			addCriterion("typeid <", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidLessThanOrEqualTo(String value) {
			addCriterion("typeid <=", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidLike(String value) {
			addCriterion("typeid like", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotLike(String value) {
			addCriterion("typeid not like", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidIn(List<String> values) {
			addCriterion("typeid in", values, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotIn(List<String> values) {
			addCriterion("typeid not in", values, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidBetween(String value1, String value2) {
			addCriterion("typeid between", value1, value2, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotBetween(String value1, String value2) {
			addCriterion("typeid not between", value1, value2, "typeid");
			return (Criteria) this;
		}

		public Criteria andGoodsnameIsNull() {
			addCriterion("goodsname is null");
			return (Criteria) this;
		}

		public Criteria andGoodsnameIsNotNull() {
			addCriterion("goodsname is not null");
			return (Criteria) this;
		}

		public Criteria andGoodsnameEqualTo(String value) {
			addCriterion("goodsname =", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameNotEqualTo(String value) {
			addCriterion("goodsname <>", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameGreaterThan(String value) {
			addCriterion("goodsname >", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameGreaterThanOrEqualTo(String value) {
			addCriterion("goodsname >=", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameLessThan(String value) {
			addCriterion("goodsname <", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameLessThanOrEqualTo(String value) {
			addCriterion("goodsname <=", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameLike(String value) {
			addCriterion("goodsname like", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameNotLike(String value) {
			addCriterion("goodsname not like", value, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameIn(List<String> values) {
			addCriterion("goodsname in", values, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameNotIn(List<String> values) {
			addCriterion("goodsname not in", values, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameBetween(String value1, String value2) {
			addCriterion("goodsname between", value1, value2, "goodsname");
			return (Criteria) this;
		}

		public Criteria andGoodsnameNotBetween(String value1, String value2) {
			addCriterion("goodsname not between", value1, value2, "goodsname");
			return (Criteria) this;
		}

		public Criteria andIntroduceIsNull() {
			addCriterion("introduce is null");
			return (Criteria) this;
		}

		public Criteria andIntroduceIsNotNull() {
			addCriterion("introduce is not null");
			return (Criteria) this;
		}

		public Criteria andIntroduceEqualTo(String value) {
			addCriterion("introduce =", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceNotEqualTo(String value) {
			addCriterion("introduce <>", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceGreaterThan(String value) {
			addCriterion("introduce >", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceGreaterThanOrEqualTo(String value) {
			addCriterion("introduce >=", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceLessThan(String value) {
			addCriterion("introduce <", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceLessThanOrEqualTo(String value) {
			addCriterion("introduce <=", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceLike(String value) {
			addCriterion("introduce like", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceNotLike(String value) {
			addCriterion("introduce not like", value, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceIn(List<String> values) {
			addCriterion("introduce in", values, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceNotIn(List<String> values) {
			addCriterion("introduce not in", values, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceBetween(String value1, String value2) {
			addCriterion("introduce between", value1, value2, "introduce");
			return (Criteria) this;
		}

		public Criteria andIntroduceNotBetween(String value1, String value2) {
			addCriterion("introduce not between", value1, value2, "introduce");
			return (Criteria) this;
		}

		public Criteria andPriceIsNull() {
			addCriterion("price is null");
			return (Criteria) this;
		}

		public Criteria andPriceIsNotNull() {
			addCriterion("price is not null");
			return (Criteria) this;
		}

		public Criteria andPriceEqualTo(Double value) {
			addCriterion("price =", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceNotEqualTo(Double value) {
			addCriterion("price <>", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceGreaterThan(Double value) {
			addCriterion("price >", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceGreaterThanOrEqualTo(Double value) {
			addCriterion("price >=", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceLessThan(Double value) {
			addCriterion("price <", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceLessThanOrEqualTo(Double value) {
			addCriterion("price <=", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceIn(List<Double> values) {
			addCriterion("price in", values, "price");
			return (Criteria) this;
		}

		public Criteria andPriceNotIn(List<Double> values) {
			addCriterion("price not in", values, "price");
			return (Criteria) this;
		}

		public Criteria andPriceBetween(Double value1, Double value2) {
			addCriterion("price between", value1, value2, "price");
			return (Criteria) this;
		}

		public Criteria andPriceNotBetween(Double value1, Double value2) {
			addCriterion("price not between", value1, value2, "price");
			return (Criteria) this;
		}

		public Criteria andNowpriceIsNull() {
			addCriterion("nowprice is null");
			return (Criteria) this;
		}

		public Criteria andNowpriceIsNotNull() {
			addCriterion("nowprice is not null");
			return (Criteria) this;
		}

		public Criteria andNowpriceEqualTo(Double value) {
			addCriterion("nowprice =", value, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceNotEqualTo(Double value) {
			addCriterion("nowprice <>", value, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceGreaterThan(Double value) {
			addCriterion("nowprice >", value, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceGreaterThanOrEqualTo(Double value) {
			addCriterion("nowprice >=", value, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceLessThan(Double value) {
			addCriterion("nowprice <", value, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceLessThanOrEqualTo(Double value) {
			addCriterion("nowprice <=", value, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceIn(List<Double> values) {
			addCriterion("nowprice in", values, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceNotIn(List<Double> values) {
			addCriterion("nowprice not in", values, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceBetween(Double value1, Double value2) {
			addCriterion("nowprice between", value1, value2, "nowprice");
			return (Criteria) this;
		}

		public Criteria andNowpriceNotBetween(Double value1, Double value2) {
			addCriterion("nowprice not between", value1, value2, "nowprice");
			return (Criteria) this;
		}

		public Criteria andPictureIsNull() {
			addCriterion("picture is null");
			return (Criteria) this;
		}

		public Criteria andPictureIsNotNull() {
			addCriterion("picture is not null");
			return (Criteria) this;
		}

		public Criteria andPictureEqualTo(String value) {
			addCriterion("picture =", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureNotEqualTo(String value) {
			addCriterion("picture <>", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureGreaterThan(String value) {
			addCriterion("picture >", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureGreaterThanOrEqualTo(String value) {
			addCriterion("picture >=", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureLessThan(String value) {
			addCriterion("picture <", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureLessThanOrEqualTo(String value) {
			addCriterion("picture <=", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureLike(String value) {
			addCriterion("picture like", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureNotLike(String value) {
			addCriterion("picture not like", value, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureIn(List<String> values) {
			addCriterion("picture in", values, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureNotIn(List<String> values) {
			addCriterion("picture not in", values, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureBetween(String value1, String value2) {
			addCriterion("picture between", value1, value2, "picture");
			return (Criteria) this;
		}

		public Criteria andPictureNotBetween(String value1, String value2) {
			addCriterion("picture not between", value1, value2, "picture");
			return (Criteria) this;
		}

		public Criteria andIntimeIsNull() {
			addCriterion("intime is null");
			return (Criteria) this;
		}

		public Criteria andIntimeIsNotNull() {
			addCriterion("intime is not null");
			return (Criteria) this;
		}

		public Criteria andIntimeEqualTo(String value) {
			addCriterion("intime =", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeNotEqualTo(String value) {
			addCriterion("intime <>", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeGreaterThan(String value) {
			addCriterion("intime >", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeGreaterThanOrEqualTo(String value) {
			addCriterion("intime >=", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeLessThan(String value) {
			addCriterion("intime <", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeLessThanOrEqualTo(String value) {
			addCriterion("intime <=", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeLike(String value) {
			addCriterion("intime like", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeNotLike(String value) {
			addCriterion("intime not like", value, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeIn(List<String> values) {
			addCriterion("intime in", values, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeNotIn(List<String> values) {
			addCriterion("intime not in", values, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeBetween(String value1, String value2) {
			addCriterion("intime between", value1, value2, "intime");
			return (Criteria) this;
		}

		public Criteria andIntimeNotBetween(String value1, String value2) {
			addCriterion("intime not between", value1, value2, "intime");
			return (Criteria) this;
		}

		public Criteria andNewgoodsIsNull() {
			addCriterion("newgoods is null");
			return (Criteria) this;
		}

		public Criteria andNewgoodsIsNotNull() {
			addCriterion("newgoods is not null");
			return (Criteria) this;
		}

		public Criteria andNewgoodsEqualTo(Integer value) {
			addCriterion("newgoods =", value, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsNotEqualTo(Integer value) {
			addCriterion("newgoods <>", value, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsGreaterThan(Integer value) {
			addCriterion("newgoods >", value, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsGreaterThanOrEqualTo(Integer value) {
			addCriterion("newgoods >=", value, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsLessThan(Integer value) {
			addCriterion("newgoods <", value, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsLessThanOrEqualTo(Integer value) {
			addCriterion("newgoods <=", value, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsIn(List<Integer> values) {
			addCriterion("newgoods in", values, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsNotIn(List<Integer> values) {
			addCriterion("newgoods not in", values, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsBetween(Integer value1, Integer value2) {
			addCriterion("newgoods between", value1, value2, "newgoods");
			return (Criteria) this;
		}

		public Criteria andNewgoodsNotBetween(Integer value1, Integer value2) {
			addCriterion("newgoods not between", value1, value2, "newgoods");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table t_cp
	 * @mbg.generated  Mon Mar 27 23:58:48 CST 2017
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_cp
     *
     * @mbg.generated do_not_delete_during_merge Sat Mar 04 23:03:45 CST 2017
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}