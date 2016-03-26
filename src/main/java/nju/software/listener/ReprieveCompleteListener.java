package nju.software.listener;

import java.util.List;

import nju.software.entity.Paper;
import nju.software.entity.enums.PaperState;
import nju.software.service.PaperService;
import nju.software.service.impl.PaperServiceImpl;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * 暂缓答辩后的评审监听器实现类
 * @author soft
 *
 */
@Service
public class ReprieveCompleteListener implements TaskListener{
	
	@Autowired
	private PaperService paperService;

	/**
	 * 
	 */
	private static final long serialVersionUID = -1420568544191581357L;
	private static final Logger logger = LoggerFactory.getLogger(ReprieveCompleteListener.class);
	@Override
	public void notify(DelegateTask delegateTask) {
		Boolean reprieve = (Boolean) delegateTask.getVariable("reprieve");
		logger.debug("reprieve: {}", reprieve);
		//如果暂缓评审老师通过，计数器+1
		if(reprieve) {
			Long reprieveApproved = (Long) delegateTask.getVariable("reprieveApproved");
			delegateTask.setVariable("reprieveApproved", reprieveApproved + 1);
		}else {
			
		}
	}

}
