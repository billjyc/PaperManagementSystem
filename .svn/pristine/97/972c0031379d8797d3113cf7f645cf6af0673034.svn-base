package nju.software.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Account;

@Repository("nju.software.dao.AccountDAO")
public interface AccountDAO extends BaseDao<Account>{
	public List<Account> findByProperty(String propertyName, Object value);
	
	public List<Account> findByAccountName(String accountName);

	public List<Account> findByAccountPassword(String accountPassword);

	public List<Account> findByAccountLevel(Integer accountLevel);
	
	public List<Account> verifyAccount(String accountName, String accountPassword);

	public Account findByAccoundId(Integer id);
}