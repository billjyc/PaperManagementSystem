package nju.software.jsonmodel;

import nju.software.entity.Director;

public class JsonDirector {
	private Integer id;
	private String no;
	private String name;

	private Integer tel;
	private String email;
	
	public JsonDirector(Director d){
		this.setId(d.getId());
		this.setName(d.getName());
		this.setNo(d.getNo());
		this.setTel(d.getTel());
		this.setEmail(d.getEmail());
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getTel() {
		return tel;
	}
	public void setTel(Integer tel) {
		this.tel = tel;
	}


}
