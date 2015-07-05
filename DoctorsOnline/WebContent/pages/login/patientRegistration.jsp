<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/pages/header/header.jsp"%>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="/DoctorsOnline/resources/css/style.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
 
	<form method="get" id="FSForm" action="/DoctorsOnline/userRegistration">
		<section class="container"> <!-- BEGIN_ITEMS -->
		<div class="outside_container form_shadow_top">
			<div class="form_shadow_top_left">
				<div class="form_shadow_top_right">
					<div class="form_shadow_top_middle"></div>
				</div>
			</div>
		</div>
		<div class="form_table">

			<div class="clear"></div>

			<div id="q19" class="q full_width">
				<a class="item_anchor" name="ItemAnchor0"></a> <br>
			</div>

			<div class="clear"></div>

			<div id="q16" class="q full_width">
				<a class="item_anchor" name="ItemAnchor1"></a>
				<div style="text-align: center;">
					<img src="/DoctorsOnline/resources/images/doctor-appointment-form.png" alt="">
				</div>
			</div>

			<div class="clear"></div>

			<div id="q20" class="q full_width">
				<a class="item_anchor" name="ItemAnchor2"></a>
				<div class="segment_header" style="width: auto; text-align: Left;">
					<h1 style="font-size: 18px;">Patient Information</h1>
				</div>
			</div>

			<div class="clear"></div>

			<div id="q3" class="q required">
				<a class="item_anchor" name="ItemAnchor3"></a> <label
					class="question top_question" for="RESULT_TextField-3"><b
					class="icon_required">*</b> First Name</label> <input type="text"
					name="firstName" class="text_field"
					id="firstName" size="25" value="">
			</div>
			<div id="q4" class="q">
				<a class="item_anchor" name="ItemAnchor4"></a> <label
					class="question top_question" for="RESULT_TextField-4">Middle
					Initial</label> <input type="text" name="middleName"
					class="text_field" id="middleName" size="20" maxlength="20"
					value="">
			</div>
			<div id="q5" class="q required">
				<a class="item_anchor" name="ItemAnchor5"></a> <label
					class="question top_question" for="RESULT_TextField-5"><b
					class="icon_required">*</b> Last Name</label> <input type="text"
					name="lastName" class="text_field"
					id="lastName" size="25" value="">
			</div>

			<div class="clear"></div>

			<div id="q6" class="q required">
				<a class="item_anchor" name="ItemAnchor6"></a> <label
					class="question top_question" for="RESULT_TextField-6"><b
					class="icon_required">*</b> Birth Date (MM/DD/YYYY)</label> <input
					type="text" name="dob" class="text_field"
					id="dob" size="10" maxlength="10" value="">
			</div>
			<div id="q7" class="q required">
				<a class="item_anchor" name="ItemAnchor7"></a> <label
					class="question top_question" for="RESULT_TextField-7"><b
					class="icon_required">*</b> Phone</label> <input type="text"
					name="Phone" class="text_field"
					id="Phone" size="25" maxlength="255" value="">
			</div>
			<div id="q7" class="q required">
				<a class="item_anchor" name="ItemAnchor7"></a> <label
					class="question top_question" for="RESULT_TextField-7"><b
					class="icon_required">*</b> UID</label> <input type="text"
					name="uid" class="text_field"
					id="uid" size="25" maxlength="255" value="">
			</div>
			<div id="q4" class="q required">
				<a class="item_anchor" name="ItemAnchor3"></a> <label
					class="question left_question_first" for="RESULT_TextField-3"><b
					class="icon_required">*</b> Street Address</label>
					
					<textarea name="address" class="text_field"
						id="address" size="40" rows="10" cols="50" ></textarea>
				
			</div>
			<div id="q7" class="q required">
				<a class="item_anchor" name="ItemAnchor7"></a> <label
					class="question top_question" for="RESULT_TextField-7"><b
					class="icon_required">*</b>Gender</label> <input type="text"
					name="gender" class="text_field"
					id="gender" size="25" maxlength="255" value="">
			</div>
			<div id="q7" class="q required">
				<a class="item_anchor" name="ItemAnchor7"></a> <label
					class="question top_question" for="RESULT_TextField-7"><b
					class="icon_required">*</b>Pin Code</label> <input type="text"
					name="pinCode" class="text_field"
					id="pinCode" size="25" maxlength="255" value="">
			</div>
			<div class="clear"></div>

			
		<div class="outside_container form_shadow_bottom">
			<div class="form_shadow_bottom_left">
				<div class="form_shadow_bottom_right">
					<div class="form_shadow_bottom_middle"></div>
				</div>
			</div>
		</div>
		<!-- END_ITEMS --> <input type="hidden" name="EParam"
			value="FzpUCZwnDno=">
		<div class="outside_container">
			<div class="buttons_reverse">
				<input type="submit" name="Submit" value="Submit"
					class="submit_button" id="FSsubmit">
			</div>
		</div>
		</section>
	</form>
</body>
</html>