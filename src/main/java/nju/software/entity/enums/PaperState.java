package nju.software.entity.enums;

public enum PaperState {
	TUTOR_UNASSIGNED(0, "未分配导师"), UNPROPOSED(1, "未开题"), PROPOSAL_UNDER_REVIEW(2, "开题报告评审中"), 
	INTERIM_REPORT_UNSUBMITED(3, "中期报告未提交"), INTERIM_REPORT_UNDER_REVIEW(4, "中期报告评审中"), 
	UNCOMMITED(5, "论文未提交"), FIRST_DRAFT_COMPLETED(6, "初稿完成, 交由导师评审"),  
	FIRST_DRAFT_FINALIZED(7, "初稿定稿完成，等待教务员进行重复率检测"), DETECTION_PASSED(8, "重复率检测通过，等待教务员进行评审分配"), 
	JUDGE_READY(9, "评审导师分配完毕，准备进行评审"), JUDGE_PASSED(10, "评审通过，等待导师进行答辩前定稿"),
	FINALIZED_BEFORE_DEFENSE(11, "答辩前定稿通过，等待教务员进行答辩分配"), 
	DEFENSE_READY(12, "答辩老师分配完成"), DEFENSE_PASSED(13, "答辩通过，等待导师进行答辩后定稿"), 
	DEFENSE_REPRIEVED(14, "答辩暂缓通过，请准备再次答辩"), FINALIZED_AFTER_REPRIEVE(15, "暂缓答辩前定稿完成"), 
	FINALIZED_AFTER_DEFENSE(16, "答辩通过后定稿完成，等待打印论文"), FINISH(17, "学位已分配，论文归档");
	
	private int index;
	private String status;
	
	private PaperState(int index, String status) {
		this.index = index;
		this.status = status;
	}
	
	public int getIndex() {
		return index;
	}

	public String getStatus() {
		return status;
	}

	public static PaperState getPaperStateByIndex(int index) {
		for(PaperState state : PaperState.values()) {
			if(state.getIndex() == index) {
				return state;
			}
		}
		return null;
	}
	
	public static PaperState getPaperStateByStatus(String status) {
		for(PaperState state : PaperState.values()) {
			if(state.getStatus().equals(status)) {
				return state;
			}
		}
		return null;
	}
}