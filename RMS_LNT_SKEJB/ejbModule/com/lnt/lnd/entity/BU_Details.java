package com.lnt.lnd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BU_Details {

	@Id
	private String bu_id;
	private String bu_name;
	public String getBu_id() {
		return bu_id;
	}
	public void setBu_id(String bu_id) {
		this.bu_id = bu_id;
	}
	public String getBu_name() {
		return bu_name;
	}
	public void setBu_name(String bu_name) {
		this.bu_name = bu_name;
	}
}
