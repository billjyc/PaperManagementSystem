package nju.software.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import nju.software.dao.TeacherDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Teacher;
import nju.software.entity.enums.TeacherEducation;
import nju.software.entity.enums.TeacherJobTitle;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 * A data access object (DAO) providing persistence and search support for
 * Teacher entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see nju.software.dataobject.Teacher
 * @author MyEclipse Persistence Tools
 */

@Repository("nju.software.dao.impl.TeacherDAOImpl")
public class TeacherDAOImpl extends BaseDaoImpl<Teacher> implements TeacherDAO{
	private static final Logger log = LoggerFactory.getLogger(TeacherDAOImpl.class);
	// property constants
	public static final String TEACHER_NAME = "teacherName";
	public static final String TEACHER_NUMBER = "teacherNumber";
	public static final String TEACHER_PHONE = "teacherPhone";
	public static final String TEACHER_JOB_TITLE = "teacherJobTitle";
	public static final String TEACHER_EDUCATION = "teacherEducation";
	public static final String TEACHER_CLASSES = "teacherClasses";
	public static final String TEACHER_EMAIL = "teacherEmail";
	public static final String TEACHER_QUALIFICATION = "teacherQualification";

	public TeacherDAOImpl(){
		super();
		this.setClazz(Teacher.class);
	}

	public Teacher findById(java.lang.Integer id) {
		return super.findById(id);
	}

	public List<Teacher> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	public List<Teacher> findByTeacherName(Object teacherName) {
		return findByProperty(TEACHER_NAME, teacherName);
	}

	public List<Teacher> findByTeacherNumber(Object teacherNumber) {
		return findByProperty(TEACHER_NUMBER, teacherNumber);
	}

	public List<Teacher> findByTeacherPhone(Object teacherPhone) {
		return findByProperty(TEACHER_PHONE, teacherPhone);
	}

	public List<Teacher> findByTeacherJobTitle(Object teacherJobTitle) {
		return findByProperty(TEACHER_JOB_TITLE, teacherJobTitle);
	}

	public List<Teacher> findByTeacherEducation(Object teacherEducation) {
		return findByProperty(TEACHER_EDUCATION, teacherEducation);
	}

	public List<Teacher> findByTeacherClasses(Object teacherClasses) {
		return findByProperty(TEACHER_CLASSES, teacherClasses);
	}

	public List<Teacher> findByTeacherEmail(Object teacherEmail) {
		return findByProperty(TEACHER_EMAIL, teacherEmail);
	}

	public List<Teacher> findByTeacherQualification(Object teacherQualification) {
		return findByProperty(TEACHER_QUALIFICATION, teacherQualification);
	}

	/**
	 * return the count of records
	 */
	public int count() {
		return (int) findCount();
	}
	/**
	 * return the count of records by certain property
	 */
	public int count(String propertyName, Object value) {
		return (int) findCountByProperty(propertyName, value);
	}
	/**
	 * Calculate paging params
	 * 
	 * @param params
	 *			page: the requested page limit: how many rows we want to show
	 * 			sidx: index row sord: the direction 
	 *          ======above from page============ 
	 *          count: total records
	 * @return 
	 * 			page: the requested page 
	 * 			limit: how many rows we want to show
	 *          sidx: index row 
	 *          sord: the direction 
	 *          count: total records
	 *          total_pages 
	 *          start: tell the hql the position to begin
	 */
	public HashMap<String, Object> calculateLimits(
			HashMap<String, Object> params) {
		int page = (Integer) params.get("page");
		int limit = (Integer) params.get("limit");
		int count = (Integer) params.get("count");
		int total_pages = 0;
		int start = 0;

		if (count > 0)
			total_pages = (int) Math.ceil((double) count / limit);
		if (page > total_pages)
			page = total_pages;

		start = limit * (page - 1);

		params.put("total_pages", total_pages);
		params.put("start", start);
		return params;
	}

	public List<Object> findAllLimit(HashMap<String, Object> params) {
		int count = count();
		params.put("count", count);

		HashMap<String, Object> limits = calculateLimits(params);
		int limit = (Integer) params.get("limit");
		int start = (Integer) params.get("start");
		int page = (Integer) params.get("page");
		String sidx = (String) params.get("sidx");
		String sord = (String) params.get("sord");
		String[] sidx_array = sidx.split(" ");
		log.debug("sidx: {}", sidx);

		List<Object> result = new ArrayList<Object>();
		try {
			Criteria criteria = createCriteria();
			log.debug("sidx_array[sidx_array.length - 1]: {}", sidx_array[sidx_array.length - 1]);
			if (sord != null)
				if (sord.equals("asc"))
					criteria.addOrder(Order.asc(sidx_array[sidx_array.length - 1]));
				else
					criteria.addOrder(Order.desc(sidx_array[sidx_array.length - 1]));
			List<Teacher> list = findByPage(criteria, page, limit);
			result.add(list);
			result.add(limits);
		} catch (RuntimeException re) {
			log.error("find by property name limit failed", re);
		}
		return result;
	}

	@Override
	public List<Teacher> getTeacherHigherThanJobTitle(TeacherJobTitle jobTitle) {
		String hql = "from Teacher t where t.teacherJobTitle >= ?";
		return find(hql, jobTitle);
	}

	@Override
	public List<Teacher> getTeacherHigherThanEducation(
			TeacherEducation education) {
		String hql = "from Teacher t where t.teacherEducation >= ?";
		return find(hql, education);
	}
}