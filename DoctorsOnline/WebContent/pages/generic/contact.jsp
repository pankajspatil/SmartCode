<%@page import="com.org.doctorsonline.generic.ContactUs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Online Doctor</title>
		<link href="/DoctorsOnline/resources/css/template.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<!--start-wrap-->
		
			<!--start-header-->
			<div class="header">
				<div class="wrap">
				<!--start-logo-->
				<div class="logo">
					<a href="index.html"><img src="/DoctorsOnline/resources/images/logo.png" title="logo" /></a>
				</div>
				<!--end-logo-->
				<!--start-top-nav-->
				<div class="top-nav">
					<%@ include file="/pages/header/commonMenu.jsp"%>				
				</div>
				<div class="clear"> </div>
				<!--end-top-nav-->
			</div>
			<!--end-header-->
		</div>
		    <div class="clear"> </div>
		   <div class="wrap">
		   	<div class="contact">
		   	<div class="section group">				
				<div class="col span_1_of_3">
					<div class="contact_info">
			    	 	<h2>Find Us Here</h2><br />
			    	 		
      				</div>
      			<div class="company_address">
				     	<h2>Company Information :</h2>
						<p>Email: <span>info@mycompany.com</span></p>
				   		<p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
				   </div>
				</div>				
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h2>Contact Us</h2>
					    <form method="post" action="contact.jsp" name="contactForm" id="contactForm">
					    	<div>
						    	<span>
						    		<label>NAME</label>
						    	</span>
						    	<span>
						    		<input type="text" value="" name="name" id="name">
						    	</span>
						    </div>
						    <div>
						    	<span><label>E-MAIL</label></span>
						    	<span><input type="text" value="" name="email" id="email"></span>
						    </div>
						    <div>
						     	<span><label>MOBILE.NO</label></span>
						    	<span><input type="text" value="" name="mobileNo" id="mobileNo"></span>
						    </div>
						    <div>
						    	<span><label>SUBJECT</label></span>
						    	<span><textarea name="subject" id="subject"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Submit" name="page1"></span>
						  </div>
					    </form>
				    </div>
  				</div>				
			  </div>
			  	 <div class="clear"> </div>
	  	 <%
	  	 if(request.getParameter("page1") != null){
	  	 	ContactUs contactUs = new ContactUs();
	  	 	Boolean done = contactUs.isFeedbackAdded(request);
	  	 	if(done){
	  	 		%><div style="text-align: center;">
	  	 			Your Form has been successfully submitted! <br/>
					Your opinions and comments are very important to SEL and we read every message that we receive.<br/>
					Our goal is to improve our service any way we can, and we appreciate your taking the time to fill out our feedback form.
	  	 		</div><%
	  	 	}else{
	  	 		%>
	  	 			There is some issue with the system. Can you check later.
	  	 		<%
	  	 	}
	  	 }
	  	 %>
	</div>
	<div class="clear"> </div>
			</div>
	      <div class="clear"> </div>
		   <div class="footer">
		   	 <div class="wrap">
		   	<div class="footer-left">
		   			<%@ include file="/pages/header/commonMenu.jsp"%>
		   	</div>
		   	<div class="footer-right">
		   		<p>Online Doctor | Design By Teamr</p>
		   	</div>
		   	<div class="clear"> </div>
		   </div>
		   </div>
		<!--end-wrap-->
	</body>
</html>

