package com.lnt.lnd.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Authentication implements Serializable
{	@Id
	private int user_no;
	@Column(unique=true)
	private String login_psno;
	private String password;
	@Column(name="full_name")
	private String username;
	private String role_Type;
	private boolean first_login;
	private boolean del_flag;
	public boolean isDel_flag() {
		return del_flag;
	}
	public void setDel_flag(boolean del_flag) {
		this.del_flag = del_flag;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	public String getLogin_psno() {
		return login_psno;
	}
	public void setLogin_psno(String login_psno) {
		this.login_psno = login_psno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole_Type() {
		return role_Type;
	}
	public void setRole_Type(String role_Type) {
		this.role_Type = role_Type;
	}
	public boolean isFirst_login() {
		return first_login;
	}
	public void setFirst_login(boolean first_login) {
		this.first_login = first_login;
	}
	
	public String toString()
	{
		return this.username;
	}
}
