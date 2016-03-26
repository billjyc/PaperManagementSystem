package nju.software.service.impl;

import java.util.List;

import nju.software.dao.AccountDAO;
import nju.software.entity.Account;
import nju.software.service.AccountService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountServiceImpl")
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountDAO accountDAO;
	
	Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);

	public boolean deleteAccount(Integer accountId) {
		try{
			accountDAO.delete(getAccountByAccountId(accountId));
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean addAccount(Account account) {
		try {
			accountDAO.create(account);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateAccount(Account account) {
		try {
			accountDAO.update(account);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Account vertifyAccount(String accountName, String accountPassword) {
		logger.debug("验证账户----->");
		logger.debug("用户名：{}, 密码：{}", accountName, accountPassword);
		Account account = new Account();
		account.setAccountName(accountName);
		account.setAccountPassword(accountPassword);
		List<Account> accountList = accountDAO.verifyAccount(accountName, accountPassword);
		if (accountList.isEmpty()) {
			logger.debug("用户名或密码错误");
			return null;
		} else
			return accountList.get(0);
	}

	public Account getAccountByAccountname(String accountname) {
		List<Account> accountList = accountDAO.findByAccountName(accountname);
		if (accountList != null && !accountList.isEmpty()) {
			return accountList.get(0);
		} else
			return null;
	}

	public Account getAccountByAccountId(int accountId) {
		return accountDAO.findById(accountId);
	}
}