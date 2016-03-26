package nju.software.manager.dean;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class AbstractDeanManager {
	private Logger logger = LoggerFactory.getLogger(AbstractDeanManager.class);
	
	/**
	 * 得到搜索条件
	 * @param col 表中属性
	 * @param oper 操作符     
	 * @param val 搜索值
	 */
	public String getSearch(String col, String oper, String val){
		logger.info("col: {}, oper: {}, val: {}", col, oper, val);
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("eq","=");
		map.put("ne","<>");
		map.put("lt", "<");
		map.put("le", "<=");
		map.put("gt",">");
		map.put("ge", ">=");
		map.put("bw", "LIKE");
		map.put("bn", "NOT LIKE");
		map.put("in", "LIKE");
		map.put("ni", "NOT LIKE");
		map.put("ew", "LIKE");
		map.put("en", "NOT LIKE");
		map.put("cn", "LIKE");
		map.put("nc", "NOT LIKE");

		if(col.equals("score")){
			if(val.equals("优")){
				val=String.valueOf(1);
			}
			if(val.equals("良")){
				val=String.valueOf(2);
			}
			if(val.equals("中")){
				val=String.valueOf(3);
			}
			if(val.equals("及格")){
				val=String.valueOf(4);
			}
		}

		if(col.equals("state")){
			if(val.equals("已通过")){
				val=String.valueOf(1);
			}
			if(val.equals("未审核")){
				val=String.valueOf(0);
			}
			if(val.equals("驳回")){
				val=String.valueOf(2);
			}

		}

		if(oper.equals("bw") || oper.equals("bn") ) {
			val =val+ "%";
		}

		if(oper.equals("ew") || oper.equals("en") ) {
			val = "%"+val;
		}

		if(oper.equals("cn") || oper.equals("nc")  || oper.equals("in") || oper.equals("ni")) {
			val = "%"+val+"%";
		}
		logger.debug("search condition: {}", "WHERE "+ col + " " + map.get(oper) + " '"+ val + "'");
		return "WHERE "+ col + " " + map.get(oper) + " '"+ val + "'" ;
	}
}
