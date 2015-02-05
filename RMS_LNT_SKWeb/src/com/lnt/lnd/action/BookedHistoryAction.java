package com.lnt.lnd.action;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.naming.InitialContext;
import com.lnt.lnd.entity.RGSuperAdmin;
import com.lnt.lnd.facade.BookedHistoryRemote;
import com.lnt.lnd.facade.BookingFacadeRemote;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class BookedHistoryAction 
{
	private InputStream fileStream;
public InputStream getFileStream() {
		return fileStream;
	}


	public void setFileStream(InputStream fileStream) {
		this.fileStream = fileStream;
	}


private String duration;
private String reportType;
private String programType;
private String buType;
private String date;
private String endDate;


public String getDuration() {
	return duration;
}


public void setDuration(String duration) {
	this.duration = duration;
}


public String getReportType() {
	return reportType;
}


public void setReportType(String reportType) {
	this.reportType = reportType;
}


public String getProgramType() {
	return programType;
}


public void setProgramType(String programType) {
	this.programType = programType;
}


public String getBuType() {
	return buType;
}


public void setBuType(String buType) {
	this.buType = buType;
}


public String getDate() {
	return date;
}


public void setDate(String date) {
	this.date = date;
}


public String getEndDate() {
	return endDate;
}


public void setEndDate(String endDate) {
	this.endDate = endDate;
}
public String execute()
{
	if(reportType.equals("BusinessUnit"))
	{
		bookedHistory();		
	}
	else
	{
		bookedProgramHistory();
		
	}
	try {
		fileStream = new DataInputStream(new FileInputStream("c:/sources/new.pdf"));
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "test-stream";
}

public void bookedHistory()
{
	try {
	
	
	InitialContext 	ic = new InitialContext();
System.out.println("this is called");
BookedHistoryRemote remote=(BookedHistoryRemote)ic.lookup("bookedHistory#com.lnt.lnd.facade.BookedHistoryRemote");
List<RGSuperAdmin> rg = new ArrayList<RGSuperAdmin>();
	//createprogramtype()

System.out.println("this is called");
rg=	remote.createBUType(buType,date,endDate);
for (RGSuperAdmin rg1 : rg) {
	System.out.println(rg1.getBooking_id()+rg1.getBooking_status()+rg1.getBu_name());	
}

OutputStream o=new FileOutputStream(new File("c:/sources/new.pdf"));
Document d=new Document();
PdfWriter.getInstance(d, o);
d.open();
d.add(new Paragraph("---Room Management System---"));
d.add(new Paragraph(" "));

PdfPTable table = new PdfPTable(3);



PdfPCell c1 = new PdfPCell(new Phrase("Name"));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("BU"));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("room name"));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);
table.setHeaderRows(1);
int count=0;
for (RGSuperAdmin rg2 : rg) {
	count++;
	table.addCell(rg2.getrequester_name());
	table.addCell(rg2.getBu_name());
	table.addCell(rg2.getRoom_name());
}
d.add(table);

d.add(new Paragraph(" "));
d.add(new Paragraph("number of bookings made by BU type"+" "+buType+" :"+count));


d.close();
	}catch (Exception e) {
		// TODO: handle exception
	}
}
public void bookedProgramHistory()
{
	try {
	
	
	InitialContext 	ic = new InitialContext();
System.out.println("this is called");
BookedHistoryRemote remote=(BookedHistoryRemote)ic.lookup("bookedHistory#com.lnt.lnd.facade.BookedHistoryRemote");
List<RGSuperAdmin> rg = new ArrayList<RGSuperAdmin>();
	//createprogramtype()

System.out.println("this is called");
rg=	remote.bookedProgramHistory(programType);
for (RGSuperAdmin rg1 : rg) {
	System.out.println(rg1.getBooking_id()+rg1.getBooking_status()+rg1.getBu_name());	
}

OutputStream o=new FileOutputStream(new File("c:/sources/new.pdf"));
Document d=new Document();
PdfWriter.getInstance(d, o);
d.open();
d.add(new Paragraph("---Room Management System---"));
d.add(new Paragraph(" "));

PdfPTable table = new PdfPTable(3);



PdfPCell c1 = new PdfPCell(new Phrase("Name"));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("TrainingType"));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("room name"));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);
table.setHeaderRows(1);
int count=0;
for (RGSuperAdmin rg2 : rg) {
	table.addCell(rg2.getrequester_name());
	table.addCell(rg2.getTraining_purpose());
	table.addCell(rg2.getRoom_name());
	count=count+1;
}


d.add(table);
d.add(new Paragraph(" "));
d.add(new Paragraph("number of bookings made by training type"+" "+programType+" :"+count));







d.close();

		// TODO: handle exception
	
	}catch (Exception e) {
		// TODO: handle exception
	}
}
}
