package com.lnt.lnd.facade;
import java.util.List;

import javax.ejb.Remote;

import com.lnt.lnd.entity.UserManagement;

@Remote
public interface UserManagementRemote 
{
public void createUser(UserManagement u);
public int deleteUser(String psno);
public void blockUser(String psno);
public void unblockUser(String psno);
public void editUser(UserManagement u);
public UserManagement searchuser(String psno);
}
