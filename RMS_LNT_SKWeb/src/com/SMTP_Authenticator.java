package com;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTP_Authenticator extends Authenticator
{

	 public PasswordAuthentication getPasswordAuthentication()

	    {

	        String username = "SolutionKnights@gmail.com";

<<<<<<< HEAD
	        String password = "<PutYourPasswordHere>";
=======
	        String password = "<PutYourPassword>";
>>>>>>> origin/master

	        return new PasswordAuthentication(username, password);

	    }


}
