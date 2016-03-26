package nju.software.service;

import nju.software.entity.Account;

public interface AccountService {
	
	public boolean deleteAccount(Integer accountId);
	
	public boolean addAccount(Account account);
	
	public boolean updateAccount(Account account);
	
	public Account vertifyAccount(String accountName , String accountPassword);
	
	public Account getAccountByAccountname(String accountname);

	public Account getAccountByAccountId(int accountId);
}
