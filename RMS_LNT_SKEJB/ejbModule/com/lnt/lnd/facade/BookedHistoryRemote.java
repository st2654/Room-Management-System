package com.lnt.lnd.facade;
import java.util.List;

import javax.ejb.Remote;

import com.lnt.lnd.entity.RGSuperAdmin;

@Remote
public interface BookedHistoryRemote {
	public List<RGSuperAdmin> createBUType(String BUName,String date,String endDate);
	public List<RGSuperAdmin> bookedProgramHistory(String programType);
}
