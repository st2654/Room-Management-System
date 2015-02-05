package com.lnt.lnd.action;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.SendMail;
import com.lnt.lnd.entity.CityLocation;
import com.lnt.lnd.facade.AuthenticationFacadeRemote;
import com.lnt.lnd.facade.CityLocationFacade;
import com.lnt.lnd.facade.CityLocationFacadeRemote;
import com.lnt.lnd.facade.UserManagementRemote;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.xml.internal.security.c14n.helper.C14nHelper;

public class UserManagement extends ActionSupport 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String loginPsno;
	private String searchPsno;
	private String name;
	private String otherLocation;
	private String emailId;
	private String role;
    private String location;
    private String city;
    private String otherCity;
    private String block;
    private String address;
    private String remark;
    private int userid;
    private String password;
    private String Msg;
    private List<String> lstList1;
    public String getEncryptedPassword(String password)
    {
    	byte[] unencodedPassword = password.getBytes();
		MessageDigest md = null;
		try {
		md = MessageDigest.getInstance("MD5");
		} 
		catch (Exception e) {}
		md.reset();
		md.update(unencodedPassword);
		byte[] encodedPassword = md.digest();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < encodedPassword.length; i++) {
		if (((int) encodedPassword[i] & 0xff) < 0x10) {buf.append("0");	}
		buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
		}
		String encryptedPassword=buf.toString();
		return encryptedPassword;
		
	}
/*	public void setEncryptedPassword(String encryptedPassword) {
		this.encryptedPassword = encryptedPassword;
	}*/
	
    public String getMsg() {
		return Msg;
	}
	public void setMsg(String msg) {
		Msg = msg;
	}
	
    

	public List getLstList1() {
		return lstList1;
	}
	public void setLstList1(List lstList1) {
		this.lstList1 = lstList1;
	}
	public String getPassword() 
	{
		String validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%*";
		String password = "";
		Random generator = new Random();
	
		for (int i=0; i<7; i++) 
		{
		        password += validChars.charAt(generator.nextInt(validChars.length()));
		}
		
	
		return password;
	}
	public void setPassword(String password) 
	{	
		this.password = password;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSearchPsno() {
		return searchPsno;
	}
	public void setSearchPsno(String searchPsno) {
		this.searchPsno = searchPsno;
	}
	public String getLoginPsno() {
		return loginPsno;
	}
	public void setLoginPsno(String username) {
		this.loginPsno = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOtherLocation() {
		return otherLocation;
	}
	public void setOtherLocation(String otherLocation) {
		this.otherLocation = otherLocation;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getOtherCity() {
		return otherCity;
	}
	public void setOtherCity(String otherCity) {
		this.otherCity = otherCity;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String execute()
	{
		if(role.equals("Super Administrator"))
			this.role="SA";
		if(role.equals("Administrator"))
			this.role="AD";
		if(role.equals("Power User"))
			this.role="PU";
		
		int cid;
		try {
			InitialContext 	ic = new InitialContext();
		
		CityLocationFacadeRemote remote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
		
		if(!otherCity.equals("") && !otherLocation.equals(""))
		{
		CityLocation cl = new CityLocation();
		cl.setLocation(otherLocation);
		cl.setAddress(address);
		cl.setBlock(block);
		cl.setCity(otherCity);
		
        cid=remote.setCityLocation(cl);
	        
		
		}
		
		else
		{
			cid=remote.getCityLocation(city, location);
		}

		UserManagementRemote remoteuser=(UserManagementRemote)ic.lookup("user#com.lnt.lnd.facade.UserManagementRemote");
		com.lnt.lnd.entity.UserManagement u = new com.lnt.lnd.entity.UserManagement();
	u.setEmail(emailId);
	u.setFirst_login(false);
	u.setBlocked_flag(false);
	u.setFull_name(name);
	u.setRole_Type(role);
	u.setCity_location_id(cid);
	u.setLogin_psno(loginPsno);
	String tempPass="String";
	tempPass=getPassword();
	
	u.setMobile_no("0000");
	
	String subject="L&D RMS:Congratulations!!Find Login Credentials ";
	String message="<hr><table style='color=#272121' border='0'><tr><td><h2>Congratulations, <font color='#483D8B'>"+getName()+"</font></h2>Below are your Login Name and password</td></tr>" +
			"<tr><td>&nbsp;&nbsp;&nbsp;<h3><u>LoginName</u> : "+getLoginPsno()+"</h3></td></tr>"+
			"<tr><td>&nbsp;&nbsp;&nbsp;<h3><u>Password</u> : "+tempPass+"</h3></td></tr>"+
			"</table><hr>";
	u.setPassword(getEncryptedPassword(tempPass));
	remoteuser.createUser(u);
	SendMail sendMail=new SendMail();
	
	sendMail.postMail(getEmailId(),subject , message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error while inserting");
			e.printStackTrace();
			return "ERROR";
		}

		setMsg("User Created Successfully");
		return "SUCCESS";
		
	}    
	public String search()
	{
		InitialContext ic;
		try {
			ic = new InitialContext();
		
		UserManagementRemote remoteuser=(UserManagementRemote)ic.lookup("user#com.lnt.lnd.facade.UserManagementRemote");
		CityLocationFacadeRemote remote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
		com.lnt.lnd.entity.UserManagement u = new com.lnt.lnd.entity.UserManagement();
		u=remoteuser.searchuser(searchPsno);
		int cid=u.getCity_location_id();
		CityLocation c = new CityLocation();
		c=remote.getCityLocationDetails(cid);
		
		setLoginPsno(u.getLogin_psno());
		System.out.println("HERE 1"+getLoginPsno());
		setName(u.getFull_name());
		if(u.getRole_Type().equals("SA"))
			this.role="Super Administrator";
		if(u.getRole_Type().equals("AD"))
			this.role="Administrator";
		if(u.getRole_Type().equals("PU"))
			this.role="Power User";
		setCity(c.getCity());
		setBlock(c.getBlock());
		setLocation(c.getLocation());
		setAddress(c.getAddress());
		
		setEmailId(u.getEmail());
		setRemark(u.getRemarks());
		setPassword(u.getPassword());
		setUserid(u.getUser_no());
		return "SEARCHSUCCESS";
		} catch (NamingException e) {
			// TODO Auto-generated catch block
		
			e.printStackTrace();
			return "SEARCHERROR";
		}
		
	}
	public String edit()
	{
		System.out.println("HERE 2"+getLoginPsno());
		if(role.equals("Super Administrator"))
			this.role="SA";
		if(role.equals("Administrator"))
			this.role="AD";
		if(role.equals("Power User"))
			this.role="PU";
		
		int cid=10;
		try {
			InitialContext 	ic = new InitialContext();
		
		CityLocationFacadeRemote remote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
		
		if(!getOtherCity().equals("") && !getOtherLocation().equals(""))
		{
		CityLocation cl = new CityLocation();
		cl.setLocation(getOtherLocation());
		cl.setAddress(getAddress());
		cl.setBlock(getBlock());
		cl.setCity(getOtherCity());
		
        cid=remote.setCityLocation(cl);
	        
		
		}
		
		else
		{
			cid=remote.getCityLocation(getCity(), getLocation());
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			
	
		InitialContext 	ic = new InitialContext();
		UserManagementRemote remoteuser=(UserManagementRemote)ic.lookup("user#com.lnt.lnd.facade.UserManagementRemote");
		com.lnt.lnd.entity.UserManagement u = new com.lnt.lnd.entity.UserManagement();
	u.setLogin_psno(getLoginPsno());	
	u.setEmail(getEmailId());
	u.setFirst_login(false);
	u.setBlocked_flag(false);
	u.setFull_name(getName());
	u.setRole_Type(getRole());
    u.setRemarks(getRemark());
    u.setMobile_no("000");
    u.setPassword(getPassword());
    u.setCity_location_id(cid);
  u.setUser_no(getUserid());
	remoteuser.editUser(u);
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("Error while inserting");
			e.printStackTrace();
			return "ERROR";
		}

		setMsg("User Edited Successfully");
		return "SUCCESS";
	}
	public String delete()
	{
		try
		{
		InitialContext 	ic = new InitialContext();
		UserManagementRemote remoteuser=(UserManagementRemote)ic.lookup("user#com.lnt.lnd.facade.UserManagementRemote");
		remoteuser.deleteUser(getLoginPsno());
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		setMsg("User Deleted Successfully");
		return "SUCCESS";
	}
	public String block()
	{
		try
		{
		InitialContext 	ic = new InitialContext();
		UserManagementRemote remoteuser=(UserManagementRemote)ic.lookup("user#com.lnt.lnd.facade.UserManagementRemote");
		remoteuser.blockUser(getLoginPsno());
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		setMsg("User Blocked Successfully");
		return "SUCCESS";
	}
	public String unblock()
	{
		try
		{
		InitialContext 	ic = new InitialContext();
		UserManagementRemote remoteuser=(UserManagementRemote)ic.lookup("user#com.lnt.lnd.facade.UserManagementRemote");
		remoteuser.unblockUser(getLoginPsno());
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		setMsg("User Unblocked Successfully");
		return "SUCCESS";
	}
	public String populate()
	{
		try
		{
lstList1 = new ArrayList<String>();
InitialContext 	ic = new InitialContext();

CityLocationFacadeRemote remote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
lstList1=remote.getcity();	
lstList1.add("Other");
return "ERROR";
		}
		catch (Exception e) {
			return "ERROR";// TODO: handle exception
		}
	

	}
	public String editpopulate()
	{
		try
		{
lstList1 = new ArrayList<String>();
InitialContext 	ic = new InitialContext();

CityLocationFacadeRemote remote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
lstList1=remote.getcity();	
lstList1.add("Other");
return "ERROR";
		}
		catch (Exception e) {
			return "ERROR";// TODO: handle exception
		}
	

	}
	
	
	
}
