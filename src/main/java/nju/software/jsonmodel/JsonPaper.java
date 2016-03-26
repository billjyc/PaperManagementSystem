package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.enums.PaperState;

public class JsonPaper {
	private Integer paperId;
    private Integer studentId;
    private String paperTitle;
    private PaperState paperStatement;
    private Integer paperVersion;
    private String paperAddress;
    private String paperGuideAddress;
    private String paperAffix1;
    private String paperAffix2;
    private String studentName;
	private String studentNumber;
	private String paperStateCHN;
	public Integer getPaperId() {
		return paperId;
	}
	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getPaperTitle() {
		return paperTitle;
	}
	public void setPaperTitle(String paperTitle) {
		this.paperTitle = paperTitle;
	}
	public PaperState getPaperStatement() {
		return paperStatement;
	}
	public void setPaperStatement(PaperState paperStatement) {
		this.paperStatement = paperStatement;
	}
	public Integer getPaperVersion() {
		return paperVersion;
	}
	public void setPaperVersion(Integer paperVersion) {
		this.paperVersion = paperVersion;
	}
	public String getPaperAddress() {
		return paperAddress;
	}
	public void setPaperAddress(String paperAddress) {
		this.paperAddress = paperAddress;
	}
	public String getPaperGuideAddress() {
		return paperGuideAddress;
	}
	public void setPaperGuideAddress(String paperGuideAddress) {
		this.paperGuideAddress = paperGuideAddress;
	}
	public String getPaperAffix1() {
		return paperAffix1;
	}
	public void setPaperAffix1(String paperAffix1) {
		this.paperAffix1 = paperAffix1;
	}
	public String getPaperAffix2() {
		return paperAffix2;
	}
	public void setPaperAffix2(String paperAffix2) {
		this.paperAffix2 = paperAffix2;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	
    public String getPaperStateCHN() {
		return paperStateCHN;
	}
	public void setPaperStateCHN(String paperStateCHN) {
		this.paperStateCHN = paperStateCHN;
	}
	public JsonPaper(){}
    
    public static JsonPaper paper2JsonPaper(Paper p,Student s){
    	JsonPaper j = new JsonPaper();
    	j.setPaperAddress(p.getPaperAddress());
    	j.setPaperAffix1(p.getPaperAffix1());
    	j.setPaperAffix2(p.getPaperAffix2());
    	j.setPaperGuideAddress(p.getPaperGuideAddress());
    	j.setPaperId(p.getPaperId());
    	j.setPaperStatement(p.getPaperState());
    	j.setPaperTitle(p.getPaperTitle());
    	j.setPaperVersion(p.getPaperVersion());
    	j.setStudentId(p.getStudentId());
    	j.setStudentName(s.getStudentName());
		j.setStudentNumber(s.getStudentNumber());
		j.setPaperStateCHN(p.getPaperState().getStatus());
    	return j;
    }
}
