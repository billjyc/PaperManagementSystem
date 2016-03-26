package nju.software.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import nju.software.dao.StudentDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Student;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 * A data access object (DAO) providing persistence and search support for
 * Student entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see nju.software.dataobject.Student
 * @author MyEclipse Persistence Tools
 */

@Repository("nju.software.dao.impl.StudentDAOImpl")
public class StudentDAOImpl extends BaseDaoImpl<Student> implements StudentDAO{
	private static final Logger log = LoggerFactory.getLogger(StudentDAOImpl.class);
	// property constants
	public static final String CLASSNAME = "classname";
	public static final String DEGREE_TYPE = "degreeType";
	public static final String NOMINAL_TEACHER_ID = "nominalTeacherId";
	public static final String SCORE = "score";
	public static final String STUDENT_EMAIL = "studentEmail";
	public static final String STUDENT_GRADE = "studentGrade";
	public static final String STUDENT_NAME = "studentName";
	public static final String STUDENT_NUMBER = "studentNumber";
	public static final String STUDENT_PHONE = "studentPhone";
	public static final String STUDENT_PHONE_X = "studentPhoneX";
	public static final String STUDY_TIME = "studyTime";
	public static final String TEACHER_ID = "teacherId";
	public static final String TEACHING_POINT_NO = "teachingPointNo";

	public StudentDAOImpl(){
		super();
		this.setClazz(Student.class);
	}

	public Student findById(java.lang.Integer id) {
		return super.findById(id);
	}

	public List<Student> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	public List<Student> findByClassname(Object classname) {
		return findByProperty(CLASSNAME, classname);
	}

	public List<Student> findByDegreeType(Object degreeType) {
		return findByProperty(DEGREE_TYPE, degreeType);
	}

	public List<Student> findByNominalTeacherId(Object nominalTeacherId) {
		return findByProperty(NOMINAL_TEACHER_ID, nominalTeacherId);
	}

	public List<Student> findByScore(Object score) {
		return findByProperty(SCORE, score);
	}

	public List<Student> findByStudentEmail(Object studentEmail) {
		return findByProperty(STUDENT_EMAIL, studentEmail);
	}

	public List<Student> findByStudentGrade(Object studentGrade) {
		return findByProperty(STUDENT_GRADE, studentGrade);
	}

	public List<Student> findByStudentName(Object studentName) {
		return findByProperty(STUDENT_NAME, studentName);
	}

	public List<Student> findByStudentNumber(Object studentNumber) {
		return findByProperty(STUDENT_NUMBER, studentNumber);
	}

	public List<Student> findByStudentPhone(Object studentPhone) {
		return findByProperty(STUDENT_PHONE, studentPhone);
	}

	public List<Student> findByStudentPhoneX(Object studentPhoneX) {
		return findByProperty(STUDENT_PHONE_X, studentPhoneX);
	}

	public List<Student> findByStudyTime(Object studyTime) {
		return findByProperty(STUDY_TIME, studyTime);
	}

	public List<Student> findByTeacherId(Object teacherId) {
		return findByProperty(TEACHER_ID, teacherId);
	}

	/**
	 * return the count of records by certain property
	 */
	public int count(String propertyName, Object value) {
		return (int)findCountByProperty(propertyName, value);
	}

	/**
	 * return the count of records
	 */
	public int count() {
		return (int)findCount();
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

	/**
	 * @param params
	 *          page: the requested page 
	 *          limit: how many rows we want to show
	 *          sidx: index row 
	 *          sord: the direction
	 */
	public List<Object> findByPropertyLimit(String propertyName, Object value,
			HashMap<String,Object> params) {
		int count = count(propertyName, value);
		params.put("count", count);

		HashMap<String, Object> limits = calculateLimits(params);
		int limit = (Integer) params.get("limit");
		int start = (Integer) params.get("start");

		String sidx = (String) params.get("sidx");
		String sord = (String) params.get("sord");
		int page = (Integer) params.get("page");
		List<Object> result = new ArrayList<Object>();
		try {
			Criteria criteria = createCriteria(Restrictions.eq(propertyName,value));
			if (sord != null)
				if (sord.equals("asc"))
					criteria.addOrder(Order.asc(sidx));
				else
					criteria.addOrder(Order.desc(sidx));

			List<Student> studentList = findByPage(criteria, page, limit);
			result.add(studentList);
			result.add(limits);
		} catch (RuntimeException re) {
			log.error("find by property name limit failed", re);
			throw re;
		}
		return result;
	}

	public List<Object> findAllLimit(HashMap<String, Object> params) {
		int type = (Integer) params.get("type");
		int count = count("studyTime", type);
		int page = (Integer) params.get("page");
		log.debug("count: {}", count);
		params.put("count", count);

		HashMap<String, Object> limits = calculateLimits(params);
		int limit = (Integer) params.get("limit");
		int start = (Integer) params.get("start");
		String sidx = (String) params.get("sidx");
		String sord = (String) params.get("sord");
		String[] sidx_array = sidx.split(" ");
		log.debug("sidx: {}", sidx);

		List<Object> result = new ArrayList<Object>();
		try {
			Criteria criteria = createCriteria(Restrictions.eq("studyTime",type));
			if (sord != null)
				log.debug("sidx_array[sidx_array.length - 1]: {}", sidx_array[sidx_array.length - 1]);
			if (sord.equals("asc"))
				criteria.addOrder(Order.asc(sidx_array[sidx_array.length - 1]));
			else
				criteria.addOrder(Order.desc(sidx_array[sidx_array.length - 1]));
			List<Student> studentList = findByPage(criteria, page, limit);
			log.debug("studentlist.size()=={}", studentList.size());
			result.add(studentList);
			result.add(limits);
		} catch (RuntimeException re) {
			log.error("find by property name limit failed", re);
			throw re;
		}
		return result;
	}


	public List<Object> findAllWithTeacherLimit(HashMap<String,Object> params) {
		Long count;
		try {
			String hql = "select count(*) from Student where teacherId is not null";
			List<?> list = find(hql);
			if(list != null && list.size() == 1){
				count = (Long)list.get(0);
			}else {
				count = 1L;
			}
		} catch (RuntimeException re) {
			log.error("count by property name failed", re);
			throw re;
		}
		params.put("count", count.intValue());

		HashMap<String, Object> limits = calculateLimits(params);
		int limit = (Integer) params.get("limit");
		int start = (Integer) params.get("start");
		int page = (Integer) params.get("page");
		String sidx = (String) params.get("sidx");
		String sord = (String) params.get("sord");

		List<Object> result = new ArrayList<Object>();
		try {
			Criteria criteria = createCriteria();
			if (sord != null)
				if (sord.equals("asc"))
					criteria.addOrder(Order.asc(sidx));
				else
					criteria.addOrder(Order.desc(sidx));
			criteria.add(Restrictions.isNotNull("teacherId"));

			List<Student> studentList = findByPage(criteria, page, limit);
			result.add(studentList);
			result.add(limits);
		} catch (RuntimeException re) {
			log.error("find by property name limit failed", re);
			throw re;
		}
		return result;
	}

	public List<Student> findAllWithOutClass() {
		log.debug("finding all Student instances");
		try {
			String hql = "from Student where classNo = null ";
			return find(hql);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List<Student> findAllWithOutTeacher() {
		log.debug("finding all Student instances");
		try {
			String hql = "from Student where teacherId = null or teacherId <= 0 ";
			return find(hql);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List<Student> findAllWithClass() {
		log.debug("finding all Student instances");
		try {
			String hql = "from Student where classNo is not null ";
			return find(hql);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List<Student> getStudentByTPNo(String tPNo) {
		return findByProperty(TEACHING_POINT_NO, tPNo);
	}

	@Override
	public List<Student> findSearch(String searchCondition) {
		String hql = "from Student " + searchCondition;
		return find(hql);
	}
}