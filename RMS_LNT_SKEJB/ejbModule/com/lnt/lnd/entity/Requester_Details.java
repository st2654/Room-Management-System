package com.lnt.lnd.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Requester_Details implements Serializable{

	@Id
	private String requester_psno;
	private String requester_name;
	private String requester_email;
	private String requester_mobile_no;
	private String requester_bu_id;
	//private BU_Details bu_details;
	
	public String getRequester_psno() {
		return requester_psno;
	}
	public void setRequester_psno(String requester_psno) {
		this.requester_psno = requester_psno;
	}
	public String getRequester_name() {
		return requester_name;
	}
	public void setRequester_name(String requester_name) {
		this.requester_name = requester_name;
	}
	public String getRequester_email() {
		return requester_email;
	}
	public void setRequester_email(String requester_email) {
		this.requester_email = requester_email;
	}
	public String getRequester_mobile_no() {
		return requester_mobile_no;
	}
	public void setRequester_mobile_no(String requester_mobile_no) {
		this.requester_mobile_no = requester_mobile_no;
	}
	
	public String getRequester_bu_id() {
		return requester_bu_id;
	}
	public void setRequester_bu_id(String requester_bu_id) {
		this.requester_bu_id = requester_bu_id;
	}
	
	
	
}
