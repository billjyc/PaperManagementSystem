package nju.software.dao.impl;
// default package


import java.util.List;

import nju.software.dao.AccountDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Account;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 * A data access object (DAO) providing persistence and search support for Account entities.
 * Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
 * @see .Account
 * @author MyEclipse Persistence Tools 
 */

@Repository("nju.software.dao.impl.AccountDAOImpl")
public class AccountDAOImpl extends BaseDaoImpl<Account> implements AccountDAO  {
	private static final Logger logger = LoggerFactory.getLogger(AccountDAOImpl.class);
	//property constants
	public static final String ACCOUNT_NAME = "accountName";
	public static final String ACCOUNT_PASSWORD = "accountPassword";
	public static final String ACCOUNT_LEVEL = "accountLevel";
	public static final String ACCOUNT_ID = "accountId";

	public AccountDAOImpl() {
		super();
		this.setClazz(Account.class);
	}

	public List<Account> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	public List<Account> findByAccountName(String accountName) {
		return findByProperty(ACCOUNT_NAME, accountName);
	}


	public List<Account> findByAccountPassword(String accountPassword) {
		return findByProperty(ACCOUNT_PASSWORD, accountPassword);
	}

	public List<Account> findByAccountLevel(Integer accountLevel) {
		return findByProperty(ACCOUNT_LEVEL, accountLevel);
	}

	@Override
	public Account findByAccoundId(Integer id) {
		return super.findById(id);
	}

	@Override
	public List<Account> verifyAccount(String accountName,
			String accountPassword) {
		String hql = "from Account as a where a.accountName = ? and a.accountPassword = ?";
		return find(hql, accountName, accountPassword);
	}


}