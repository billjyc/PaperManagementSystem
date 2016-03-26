package test.dao;

import static org.junit.Assert.*;

import java.util.List;

import nju.software.dao.AccessoryDAO;
import nju.software.dao.common.BaseDao;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.dao.impl.AccessoryDAOImpl;
import nju.software.entity.Accessory;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:/spring-hibernate.xml"
	, "classpath*:/spring-activiti.xml"
})
public class AccessoryDAOTest {
	@Autowired
	private AccessoryDAO accessoryDAO;
	
	static Logger logger = LoggerFactory.getLogger(AccessoryDAOTest.class);

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<Accessory> list1 = accessoryDAO.findAll();
		assertNotNull(list1);
		long i = accessoryDAO.findCount();
	}
	
	@Test
	public void testAddAccessory(){
		Accessory accessory = new Accessory(2, "bill");
		accessoryDAO.create(accessory);
		Accessory accessory2 = accessoryDAO.findBySuggestionId(2).get(0);
		assertNotNull(accessory2);
		Accessory accessory3 = accessoryDAO.findByPath("bill").get(0);
		assertNotNull(accessory3);
		accessoryDAO.delete(accessory2);
	}
}
