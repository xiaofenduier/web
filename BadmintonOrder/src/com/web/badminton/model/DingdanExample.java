package com.web.badminton.model;

import java.util.ArrayList;
import java.util.List;

public class DingdanExample extends BaseExample{
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public DingdanExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
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

		public Criteria andChangdiidIsNull() {
			addCriterion("changdiid is null");
			return (Criteria) this;
		}

		public Criteria andChangdiidIsNotNull() {
			addCriterion("changdiid is not null");
			return (Criteria) this;
		}

		public Criteria andChangdiidEqualTo(Integer value) {
			addCriterion("changdiid =", value, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidNotEqualTo(Integer value) {
			addCriterion("changdiid <>", value, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidGreaterThan(Integer value) {
			addCriterion("changdiid >", value, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidGreaterThanOrEqualTo(Integer value) {
			addCriterion("changdiid >=", value, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidLessThan(Integer value) {
			addCriterion("changdiid <", value, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidLessThanOrEqualTo(Integer value) {
			addCriterion("changdiid <=", value, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidIn(List<Integer> values) {
			addCriterion("changdiid in", values, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidNotIn(List<Integer> values) {
			addCriterion("changdiid not in", values, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidBetween(Integer value1, Integer value2) {
			addCriterion("changdiid between", value1, value2, "changdiid");
			return (Criteria) this;
		}

		public Criteria andChangdiidNotBetween(Integer value1, Integer value2) {
			addCriterion("changdiid not between", value1, value2, "changdiid");
			return (Criteria) this;
		}

		public Criteria andUseridIsNull() {
			addCriterion("userid is null");
			return (Criteria) this;
		}

		public Criteria andUseridIsNotNull() {
			addCriterion("userid is not null");
			return (Criteria) this;
		}

		public Criteria andUseridEqualTo(Integer value) {
			addCriterion("userid =", value, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridNotEqualTo(Integer value) {
			addCriterion("userid <>", value, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridGreaterThan(Integer value) {
			addCriterion("userid >", value, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
			addCriterion("userid >=", value, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridLessThan(Integer value) {
			addCriterion("userid <", value, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridLessThanOrEqualTo(Integer value) {
			addCriterion("userid <=", value, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridIn(List<Integer> values) {
			addCriterion("userid in", values, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridNotIn(List<Integer> values) {
			addCriterion("userid not in", values, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridBetween(Integer value1, Integer value2) {
			addCriterion("userid between", value1, value2, "userid");
			return (Criteria) this;
		}

		public Criteria andUseridNotBetween(Integer value1, Integer value2) {
			addCriterion("userid not between", value1, value2, "userid");
			return (Criteria) this;
		}

		public Criteria andPlaytimeIsNull() {
			addCriterion("playtime is null");
			return (Criteria) this;
		}

		public Criteria andPlaytimeIsNotNull() {
			addCriterion("playtime is not null");
			return (Criteria) this;
		}

		public Criteria andPlaytimeEqualTo(String value) {
			addCriterion("playtime =", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeNotEqualTo(String value) {
			addCriterion("playtime <>", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeGreaterThan(String value) {
			addCriterion("playtime >", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeGreaterThanOrEqualTo(String value) {
			addCriterion("playtime >=", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeLessThan(String value) {
			addCriterion("playtime <", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeLessThanOrEqualTo(String value) {
			addCriterion("playtime <=", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeLike(String value) {
			addCriterion("playtime like", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeNotLike(String value) {
			addCriterion("playtime not like", value, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeIn(List<String> values) {
			addCriterion("playtime in", values, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeNotIn(List<String> values) {
			addCriterion("playtime not in", values, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeBetween(String value1, String value2) {
			addCriterion("playtime between", value1, value2, "playtime");
			return (Criteria) this;
		}

		public Criteria andPlaytimeNotBetween(String value1, String value2) {
			addCriterion("playtime not between", value1, value2, "playtime");
			return (Criteria) this;
		}

		public Criteria andTimeIsNull() {
			addCriterion("time is null");
			return (Criteria) this;
		}

		public Criteria andTimeIsNotNull() {
			addCriterion("time is not null");
			return (Criteria) this;
		}

		public Criteria andTimeEqualTo(Float value) {
			addCriterion("time =", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeNotEqualTo(Float value) {
			addCriterion("time <>", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeGreaterThan(Float value) {
			addCriterion("time >", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeGreaterThanOrEqualTo(Float value) {
			addCriterion("time >=", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeLessThan(Float value) {
			addCriterion("time <", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeLessThanOrEqualTo(Float value) {
			addCriterion("time <=", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeIn(List<Float> values) {
			addCriterion("time in", values, "time");
			return (Criteria) this;
		}

		public Criteria andTimeNotIn(List<Float> values) {
			addCriterion("time not in", values, "time");
			return (Criteria) this;
		}

		public Criteria andTimeBetween(Float value1, Float value2) {
			addCriterion("time between", value1, value2, "time");
			return (Criteria) this;
		}

		public Criteria andTimeNotBetween(Float value1, Float value2) {
			addCriterion("time not between", value1, value2, "time");
			return (Criteria) this;
		}

		public Criteria andStarttimeIsNull() {
			addCriterion("starttime is null");
			return (Criteria) this;
		}

		public Criteria andStarttimeIsNotNull() {
			addCriterion("starttime is not null");
			return (Criteria) this;
		}

		public Criteria andStarttimeEqualTo(String value) {
			addCriterion("starttime =", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeNotEqualTo(String value) {
			addCriterion("starttime <>", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeGreaterThan(String value) {
			addCriterion("starttime >", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeGreaterThanOrEqualTo(String value) {
			addCriterion("starttime >=", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeLessThan(String value) {
			addCriterion("starttime <", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeLessThanOrEqualTo(String value) {
			addCriterion("starttime <=", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeLike(String value) {
			addCriterion("starttime like", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeNotLike(String value) {
			addCriterion("starttime not like", value, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeIn(List<String> values) {
			addCriterion("starttime in", values, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeNotIn(List<String> values) {
			addCriterion("starttime not in", values, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeBetween(String value1, String value2) {
			addCriterion("starttime between", value1, value2, "starttime");
			return (Criteria) this;
		}

		public Criteria andStarttimeNotBetween(String value1, String value2) {
			addCriterion("starttime not between", value1, value2, "starttime");
			return (Criteria) this;
		}

		public Criteria andEndtimeIsNull() {
			addCriterion("endtime is null");
			return (Criteria) this;
		}

		public Criteria andEndtimeIsNotNull() {
			addCriterion("endtime is not null");
			return (Criteria) this;
		}

		public Criteria andEndtimeEqualTo(String value) {
			addCriterion("endtime =", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeNotEqualTo(String value) {
			addCriterion("endtime <>", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeGreaterThan(String value) {
			addCriterion("endtime >", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeGreaterThanOrEqualTo(String value) {
			addCriterion("endtime >=", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeLessThan(String value) {
			addCriterion("endtime <", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeLessThanOrEqualTo(String value) {
			addCriterion("endtime <=", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeLike(String value) {
			addCriterion("endtime like", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeNotLike(String value) {
			addCriterion("endtime not like", value, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeIn(List<String> values) {
			addCriterion("endtime in", values, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeNotIn(List<String> values) {
			addCriterion("endtime not in", values, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeBetween(String value1, String value2) {
			addCriterion("endtime between", value1, value2, "endtime");
			return (Criteria) this;
		}

		public Criteria andEndtimeNotBetween(String value1, String value2) {
			addCriterion("endtime not between", value1, value2, "endtime");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table dingdan
	 * @mbg.generated  Thu May 25 18:05:35 CST 2017
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
     * This class corresponds to the database table dingdan
     *
     * @mbg.generated do_not_delete_during_merge Tue May 16 23:29:25 CST 2017
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}