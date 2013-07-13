package org.ivela.offline.dao;

import java.sql.SQLException;
import java.util.List;

import org.ivela.offline.domain.Course;
import org.ivela.offline.domain.CourseExample;

public interface CourseDAO {
    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int countByExample(CourseExample example) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int deleteByExample(CourseExample example) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int deleteByPrimaryKey(Long id) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    void insert(Course record) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    void insertSelective(Course record) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    List selectByExample(CourseExample example) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    Course selectByPrimaryKey(Long id) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int updateByExampleSelective(Course record, CourseExample example) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int updateByExample(Course record, CourseExample example) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int updateByPrimaryKeySelective(Course record) throws SQLException;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table course
     *
     * @ibatorgenerated Thu Apr 15 14:20:41 BRT 2010
     */
    int updateByPrimaryKey(Course record) throws SQLException;
}