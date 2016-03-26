package nju.software.jsonmodel;

import nju.software.entity.HeadTeacher;

public class JsonHeadTeacher {
	private Integer id;
	private String no;
	private String name;

	private Integer tel;
	private String email;
	public JsonHeadTeacher(HeadTeacher ht){
		this.setId(ht.getId());
		this.setNo(ht.getNo());
		this.setName(ht.getName());
		this.setTel(ht.getTel());
		this.setEmail(ht.getEmail());
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTel() {
		return tel;
	}
	public void setTel(Integer tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
