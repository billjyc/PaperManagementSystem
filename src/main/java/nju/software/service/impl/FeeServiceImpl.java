package nju.software.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.FeeDAO;
import nju.software.entity.Fee;
import nju.software.service.FeeService;

@Service("feeServiceImpl")
public class FeeServiceImpl implements FeeService{
	
	@Autowired 
    private FeeDAO feeDao;
	
	public void addFee(Fee fee) {
		feeDao.save(fee);
	}

	@SuppressWarnings("unchecked")

	public List<Fee> getAllFees() {
		return feeDao.findAll();
	}

	public List<Fee> getFeesByTeacherId(int teacherId) {
		return feeDao.findByTeacherId(teacherId);
	}


	public List<Fee> getFeesByFeeType(int fee_type) {
		return feeDao.findByFeeType(fee_type);
	}

	
	public boolean delete(int id) {
		try{
			feeDao.delete(feeDao.findById(id));
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Fee fee) {
		try{
			feeDao.update(fee);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
	}

}
