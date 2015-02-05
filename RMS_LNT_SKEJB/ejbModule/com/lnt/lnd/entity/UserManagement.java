package com.lnt.lnd.entity;



import java.io.Serializable;

import javax.persistence.*;
@Entity
@Table(name="User_Master")
public class UserManagement implements Serializable
{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int user_no;
	
	String login_psno;
	String password;
	String full_name;
	String email;
	String mobile_no;
	String role_Type;
	boolean del_flag;
	boolean first_login;
	String remarks;
	boolean blocked_flag;
	int city_location_id;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getRole_Type() {
		return role_Type;
	}
	public void setRole_Type(String role_Type) {
		this.role_Type = role_Type;
	}
	public boolean isDel_flag() {
		return del_flag;
	}
	public void setDel_flag(boolean del_flag) {
		this.del_flag = del_flag;
	}
	public boolean isFirst_login() {
		return first_login;
	}
	public void setFirst_login(boolean first_login) {
		this.first_login = first_login;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public boolean isBlocked_flag() {
		return blocked_flag;
	}
	public void setBlocked_flag(boolean blocked_flag) {
		this.blocked_flag = blocked_flag;
	}
	
	public String getLogin_psno() {
		return login_psno;
	}
	public void setLogin_psno(String login_psno) {
		this.login_psno = login_psno;
	}

	public int getCity_location_id() {
		return city_location_id;
	}
	public void setCity_location_id(int city_location_id) {
		this.city_location_id = city_location_id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
}
