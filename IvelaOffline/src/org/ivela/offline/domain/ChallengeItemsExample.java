package org.ivela.offline.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ChallengeItemsExample {
    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    protected String orderByClause;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    protected List oredCriteria;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public ChallengeItemsExample() {
        oredCriteria = new ArrayList();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    protected ChallengeItemsExample(ChallengeItemsExample example) {
        this.orderByClause = example.orderByClause;
        this.oredCriteria = example.oredCriteria;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public List getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public void clear() {
        oredCriteria.clear();
    }

    /**
     * This class was generated by Apache iBATIS ibator.
     * This class corresponds to the database table challenge_items
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    public static class Criteria {
        protected List criteriaWithoutValue;

        protected List criteriaWithSingleValue;

        protected List criteriaWithListValue;

        protected List criteriaWithBetweenValue;

        protected Criteria() {
            super();
            criteriaWithoutValue = new ArrayList();
            criteriaWithSingleValue = new ArrayList();
            criteriaWithListValue = new ArrayList();
            criteriaWithBetweenValue = new ArrayList();
        }

        public boolean isValid() {
            return criteriaWithoutValue.size() > 0
                || criteriaWithSingleValue.size() > 0
                || criteriaWithListValue.size() > 0
                || criteriaWithBetweenValue.size() > 0;
        }

        public List getCriteriaWithoutValue() {
            return criteriaWithoutValue;
        }

        public List getCriteriaWithSingleValue() {
            return criteriaWithSingleValue;
        }

        public List getCriteriaWithListValue() {
            return criteriaWithListValue;
        }

        public List getCriteriaWithBetweenValue() {
            return criteriaWithBetweenValue;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteriaWithoutValue.add(condition);
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            Map map = new HashMap();
            map.put("condition", condition);
            map.put("value", value);
            criteriaWithSingleValue.add(map);
        }

        protected void addCriterion(String condition, List values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            Map map = new HashMap();
            map.put("condition", condition);
            map.put("values", values);
            criteriaWithListValue.add(map);
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            List list = new ArrayList();
            list.add(value1);
            list.add(value2);
            Map map = new HashMap();
            map.put("condition", condition);
            map.put("values", list);
            criteriaWithBetweenValue.add(map);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return this;
        }

        public Criteria andIdIn(List values) {
            addCriterion("id in", values, "id");
            return this;
        }

        public Criteria andIdNotIn(List values) {
            addCriterion("id not in", values, "id");
            return this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return this;
        }

        public Criteria andNameIn(List values) {
            addCriterion("name in", values, "name");
            return this;
        }

        public Criteria andNameNotIn(List values) {
            addCriterion("name not in", values, "name");
            return this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return this;
        }

        public Criteria andXmlIsNull() {
            addCriterion("xml is null");
            return this;
        }

        public Criteria andXmlIsNotNull() {
            addCriterion("xml is not null");
            return this;
        }

        public Criteria andXmlEqualTo(String value) {
            addCriterion("xml =", value, "xml");
            return this;
        }

        public Criteria andXmlNotEqualTo(String value) {
            addCriterion("xml <>", value, "xml");
            return this;
        }

        public Criteria andXmlGreaterThan(String value) {
            addCriterion("xml >", value, "xml");
            return this;
        }

        public Criteria andXmlGreaterThanOrEqualTo(String value) {
            addCriterion("xml >=", value, "xml");
            return this;
        }

        public Criteria andXmlLessThan(String value) {
            addCriterion("xml <", value, "xml");
            return this;
        }

        public Criteria andXmlLessThanOrEqualTo(String value) {
            addCriterion("xml <=", value, "xml");
            return this;
        }

        public Criteria andXmlLike(String value) {
            addCriterion("xml like", value, "xml");
            return this;
        }

        public Criteria andXmlNotLike(String value) {
            addCriterion("xml not like", value, "xml");
            return this;
        }

        public Criteria andXmlIn(List values) {
            addCriterion("xml in", values, "xml");
            return this;
        }

        public Criteria andXmlNotIn(List values) {
            addCriterion("xml not in", values, "xml");
            return this;
        }

        public Criteria andXmlBetween(String value1, String value2) {
            addCriterion("xml between", value1, value2, "xml");
            return this;
        }

        public Criteria andXmlNotBetween(String value1, String value2) {
            addCriterion("xml not between", value1, value2, "xml");
            return this;
        }

        public Criteria andCourseIsNull() {
            addCriterion("course is null");
            return this;
        }

        public Criteria andCourseIsNotNull() {
            addCriterion("course is not null");
            return this;
        }

        public Criteria andCourseEqualTo(Long value) {
            addCriterion("course =", value, "course");
            return this;
        }

        public Criteria andCourseNotEqualTo(Long value) {
            addCriterion("course <>", value, "course");
            return this;
        }

        public Criteria andCourseGreaterThan(Long value) {
            addCriterion("course >", value, "course");
            return this;
        }

        public Criteria andCourseGreaterThanOrEqualTo(Long value) {
            addCriterion("course >=", value, "course");
            return this;
        }

        public Criteria andCourseLessThan(Long value) {
            addCriterion("course <", value, "course");
            return this;
        }

        public Criteria andCourseLessThanOrEqualTo(Long value) {
            addCriterion("course <=", value, "course");
            return this;
        }

        public Criteria andCourseIn(List values) {
            addCriterion("course in", values, "course");
            return this;
        }

        public Criteria andCourseNotIn(List values) {
            addCriterion("course not in", values, "course");
            return this;
        }

        public Criteria andCourseBetween(Long value1, Long value2) {
            addCriterion("course between", value1, value2, "course");
            return this;
        }

        public Criteria andCourseNotBetween(Long value1, Long value2) {
            addCriterion("course not between", value1, value2, "course");
            return this;
        }

        public Criteria andDisciplineIsNull() {
            addCriterion("discipline is null");
            return this;
        }

        public Criteria andDisciplineIsNotNull() {
            addCriterion("discipline is not null");
            return this;
        }

        public Criteria andDisciplineEqualTo(Long value) {
            addCriterion("discipline =", value, "discipline");
            return this;
        }

        public Criteria andDisciplineNotEqualTo(Long value) {
            addCriterion("discipline <>", value, "discipline");
            return this;
        }

        public Criteria andDisciplineGreaterThan(Long value) {
            addCriterion("discipline >", value, "discipline");
            return this;
        }

        public Criteria andDisciplineGreaterThanOrEqualTo(Long value) {
            addCriterion("discipline >=", value, "discipline");
            return this;
        }

        public Criteria andDisciplineLessThan(Long value) {
            addCriterion("discipline <", value, "discipline");
            return this;
        }

        public Criteria andDisciplineLessThanOrEqualTo(Long value) {
            addCriterion("discipline <=", value, "discipline");
            return this;
        }

        public Criteria andDisciplineIn(List values) {
            addCriterion("discipline in", values, "discipline");
            return this;
        }

        public Criteria andDisciplineNotIn(List values) {
            addCriterion("discipline not in", values, "discipline");
            return this;
        }

        public Criteria andDisciplineBetween(Long value1, Long value2) {
            addCriterion("discipline between", value1, value2, "discipline");
            return this;
        }

        public Criteria andDisciplineNotBetween(Long value1, Long value2) {
            addCriterion("discipline not between", value1, value2, "discipline");
            return this;
        }

        public Criteria andUnitIsNull() {
            addCriterion("unit is null");
            return this;
        }

        public Criteria andUnitIsNotNull() {
            addCriterion("unit is not null");
            return this;
        }

        public Criteria andUnitEqualTo(Long value) {
            addCriterion("unit =", value, "unit");
            return this;
        }

        public Criteria andUnitNotEqualTo(Long value) {
            addCriterion("unit <>", value, "unit");
            return this;
        }

        public Criteria andUnitGreaterThan(Long value) {
            addCriterion("unit >", value, "unit");
            return this;
        }

        public Criteria andUnitGreaterThanOrEqualTo(Long value) {
            addCriterion("unit >=", value, "unit");
            return this;
        }

        public Criteria andUnitLessThan(Long value) {
            addCriterion("unit <", value, "unit");
            return this;
        }

        public Criteria andUnitLessThanOrEqualTo(Long value) {
            addCriterion("unit <=", value, "unit");
            return this;
        }

        public Criteria andUnitIn(List values) {
            addCriterion("unit in", values, "unit");
            return this;
        }

        public Criteria andUnitNotIn(List values) {
            addCriterion("unit not in", values, "unit");
            return this;
        }

        public Criteria andUnitBetween(Long value1, Long value2) {
            addCriterion("unit between", value1, value2, "unit");
            return this;
        }

        public Criteria andUnitNotBetween(Long value1, Long value2) {
            addCriterion("unit not between", value1, value2, "unit");
            return this;
        }

        public Criteria andTimestampIsNull() {
            addCriterion("timestamp is null");
            return this;
        }

        public Criteria andTimestampIsNotNull() {
            addCriterion("timestamp is not null");
            return this;
        }

        public Criteria andTimestampEqualTo(Date value) {
            addCriterion("timestamp =", value, "timestamp");
            return this;
        }

        public Criteria andTimestampNotEqualTo(Date value) {
            addCriterion("timestamp <>", value, "timestamp");
            return this;
        }

        public Criteria andTimestampGreaterThan(Date value) {
            addCriterion("timestamp >", value, "timestamp");
            return this;
        }

        public Criteria andTimestampGreaterThanOrEqualTo(Date value) {
            addCriterion("timestamp >=", value, "timestamp");
            return this;
        }

        public Criteria andTimestampLessThan(Date value) {
            addCriterion("timestamp <", value, "timestamp");
            return this;
        }

        public Criteria andTimestampLessThanOrEqualTo(Date value) {
            addCriterion("timestamp <=", value, "timestamp");
            return this;
        }

        public Criteria andTimestampIn(List values) {
            addCriterion("timestamp in", values, "timestamp");
            return this;
        }

        public Criteria andTimestampNotIn(List values) {
            addCriterion("timestamp not in", values, "timestamp");
            return this;
        }

        public Criteria andTimestampBetween(Date value1, Date value2) {
            addCriterion("timestamp between", value1, value2, "timestamp");
            return this;
        }

        public Criteria andTimestampNotBetween(Date value1, Date value2) {
            addCriterion("timestamp not between", value1, value2, "timestamp");
            return this;
        }

        public Criteria andDependencyIsNull() {
            addCriterion("dependency is null");
            return this;
        }

        public Criteria andDependencyIsNotNull() {
            addCriterion("dependency is not null");
            return this;
        }

        public Criteria andDependencyEqualTo(Long value) {
            addCriterion("dependency =", value, "dependency");
            return this;
        }

        public Criteria andDependencyNotEqualTo(Long value) {
            addCriterion("dependency <>", value, "dependency");
            return this;
        }

        public Criteria andDependencyGreaterThan(Long value) {
            addCriterion("dependency >", value, "dependency");
            return this;
        }

        public Criteria andDependencyGreaterThanOrEqualTo(Long value) {
            addCriterion("dependency >=", value, "dependency");
            return this;
        }

        public Criteria andDependencyLessThan(Long value) {
            addCriterion("dependency <", value, "dependency");
            return this;
        }

        public Criteria andDependencyLessThanOrEqualTo(Long value) {
            addCriterion("dependency <=", value, "dependency");
            return this;
        }

        public Criteria andDependencyIn(List values) {
            addCriterion("dependency in", values, "dependency");
            return this;
        }

        public Criteria andDependencyNotIn(List values) {
            addCriterion("dependency not in", values, "dependency");
            return this;
        }

        public Criteria andDependencyBetween(Long value1, Long value2) {
            addCriterion("dependency between", value1, value2, "dependency");
            return this;
        }

        public Criteria andDependencyNotBetween(Long value1, Long value2) {
            addCriterion("dependency not between", value1, value2, "dependency");
            return this;
        }

        public Criteria andWeightIsNull() {
            addCriterion("weight is null");
            return this;
        }

        public Criteria andWeightIsNotNull() {
            addCriterion("weight is not null");
            return this;
        }

        public Criteria andWeightEqualTo(Integer value) {
            addCriterion("weight =", value, "weight");
            return this;
        }

        public Criteria andWeightNotEqualTo(Integer value) {
            addCriterion("weight <>", value, "weight");
            return this;
        }

        public Criteria andWeightGreaterThan(Integer value) {
            addCriterion("weight >", value, "weight");
            return this;
        }

        public Criteria andWeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("weight >=", value, "weight");
            return this;
        }

        public Criteria andWeightLessThan(Integer value) {
            addCriterion("weight <", value, "weight");
            return this;
        }

        public Criteria andWeightLessThanOrEqualTo(Integer value) {
            addCriterion("weight <=", value, "weight");
            return this;
        }

        public Criteria andWeightIn(List values) {
            addCriterion("weight in", values, "weight");
            return this;
        }

        public Criteria andWeightNotIn(List values) {
            addCriterion("weight not in", values, "weight");
            return this;
        }

        public Criteria andWeightBetween(Integer value1, Integer value2) {
            addCriterion("weight between", value1, value2, "weight");
            return this;
        }

        public Criteria andWeightNotBetween(Integer value1, Integer value2) {
            addCriterion("weight not between", value1, value2, "weight");
            return this;
        }
    }
}