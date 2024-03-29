package org.ivela.offline.dao;
import java.sql.SQLException;
import java.util.List;

import org.ivela.offline.domain.FinishedUnitContent;
import org.ivela.offline.domain.FinishedUnitContentExample;

public interface FinishedUnitContentDAO {

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int countByExample(FinishedUnitContentExample example) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int deleteByExample(FinishedUnitContentExample example) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int deleteByPrimaryKey(Integer id) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	void insert(FinishedUnitContent record) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	void insertSelective(FinishedUnitContent record) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	List selectByExample(FinishedUnitContentExample example)
			throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	FinishedUnitContent selectByPrimaryKey(Integer id) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int updateByExampleSelective(FinishedUnitContent record,
			FinishedUnitContentExample example) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int updateByExample(FinishedUnitContent record,
			FinishedUnitContentExample example) throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int updateByPrimaryKeySelective(FinishedUnitContent record)
			throws SQLException;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table finished_unit_content
	 * @ibatorgenerated  Thu Apr 15 14:20:41 BRT 2010
	 */
	int updateByPrimaryKey(FinishedUnitContent record) throws SQLException;
}