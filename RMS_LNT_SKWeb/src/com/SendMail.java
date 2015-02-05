package com;


import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionSupport;


public class SendMail extends ActionSupport
{
	private String to;
	private String subject;
	private String message;
	
	 private String SMTP_HOST_NAME = "smtp.gmail.com";

	  private String SMTP_AUTH_USER = "SolutionKnights";

	  private String SMTP_AUTH_PWD  = "@solutionknights";

	
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String postMail(String to,String subject,String message)
	{	
		setTo(to);
		setSubject(subject);
		setMessage(message);
		
		try {
			String from="SolutionKnights@gmail.com"; 
			boolean debug = false;
			 //Set the host smtp address
			 Properties props = new Properties();
			 props.put("mail.smtp.starttls.enable","true");
			 props.put("mail.smtp.host", SMTP_HOST_NAME);
			 props.put("mail.smtp.auth", "true");
			 Authenticator auth = new SMTP_Authenticator();
			 Session session=Session.getInstance(props,auth);
			// create a message
			Message msg = new MimeMessage(session);
			// set the from and to address
			InternetAddress addressFrom = new InternetAddress(from);
			msg.setFrom(addressFrom);
			InternetAddress addressTo=new InternetAddress(getTo());

			  msg.setRecipient(Message.RecipientType.TO, addressTo);
			//msg.setRecipients(Message.RecipientType.TO, addressTo);

			// Setting the Subject and Content Type

			msg.setSubject(subject);

			msg.setContent(message, "text/html");

			Transport.send(msg);
			return "SUCCESS";
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "ERROR";
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "ERROR";
		}

	}
	
}
