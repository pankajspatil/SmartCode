<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Date"%>
<%@page import="com.org.doctorsonline.generic.ConnectionsUtil"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.doctorsonline.search.Search"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/pages/generic/validateSession.jsp"%>
<%@ include file="/pages/header/header.jsp"%>
<%
try{
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/DoctorsOnline/resources/css/jquery-ui.css">
<link rel="stylesheet"
	href="/DoctorsOnline/resources/css/jquery-ui.structure.css">
<link rel="stylesheet"
	href="/DoctorsOnline/resources/css/visit.css">
<script src="/DoctorsOnline/resources/js/jquery.js"></script>
<script src="/DoctorsOnline/resources/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="/DoctorsOnline/resources/js/search.js"></script>
<script type="text/javascript"
	src="/DoctorsOnline/resources/js/visit.js"></script>

</head>
<body>
	<br />
	<form method="post" name="form1" >
	<h1 align="center">Patient New Visit</h1>
	<%
	String userId = request.getParameter("userId");
	Search search = new Search();
	String patientName  = "";
	
	ResultSet userDataRS = search.getUser(userId);
	if(userDataRS != null){
		
		userDataRS.next();
		
		patientName += (userDataRS.getString("firstName") + " "
				+ userDataRS.getString("middleName") + " " 
				+ userDataRS.getString("lastName")).replaceAll("[ ]+", " ");
		String today = new Date().toString();
		
		%>
	<table align="center" width="50%">
		<tr>
			<td>Patient Name :</td>
			<td align="left"><%=patientName %></td>
			<td>Date :</td>
			<td align="left"><%=today %></td>

		</tr>

	</table>
	<br />
	<br />
	<table align="center" width="60%">
		<tr>
			<td>Weight :</td>
			<td><input type="text" name="weight" size="5" id="weight" value=""></td>
			<td>Height :</td>
			<td><input type="text" name="height" size="5" id="height" value=""></td>
			<td>BP :</td>
			<td><input type="text" name="bp" id="bp" size="5" value=""></td>
			<td>BMI :</td>
			<td><input type="text" name="bmi" size="5" id="bmi" title="Body Mass Index" value=""></td>
			<td>GFR :</td>
			<td><input type="text" name="gfr" size="5" id="gfr" value=""></td>
						
		</tr>
		<tr>
			<td colspan="5">Immune status</td>
			</tr>
		<tr>
			<td>HBV :</td>
			<td><input type="text" name="HBV" id="HBV" size="5" value=""></td>	
			<td>HIV :</td>
			<td><input type="text" name="HIV" id="HIV" size="5" value=""></td>
			<td>G6PD :</td><td><input type="text" name="G6PD" id="G6PD" size="5" value=""></td>
			<td>AbnormalHB :</td><td><input type="text" name="abnormalHB" id="abnormalHB" size="5" value=""></td>
			<td>Allergy :</td><td><input type="text" name="allergy" id="allergy" size="5" value=""></td>		
		</tr>
		<tr><br>
			<td colspan="6" align="left">Visit Summary</td>
		</tr>
		<tr>
			<td colspan="6" align="left"><textarea rows="6" cols="1"
					name="summary" id="summary" style="width: 100%"></textarea></td>
		</tr>
	</table>
	<br />
	<br />

	<%
		//userDataRS.next();
	}
	
	ConcurrentHashMap<String,String> prescription = (ConcurrentHashMap<String,String>) application.getAttribute("prescription");
	%><table align="center" width="80%" border="1">
		<tr align="center">
			<td>Medicine Name</td>
			<td>Dosage Duration</td>
			<td>Dose Instruction</td>
			<td colspan="2">Operation</td>
		</tr>
		<tr align="center">
			<td rowspan="2"><select id="combobox" style="width: 100%">
					<option value="">Select one...</option>
					<%
					Iterator it = prescription.entrySet().iterator();
				    while (it.hasNext()) {
				        Map.Entry pair = (Map.Entry)it.next();				        
				     	%><option value="<%=pair.getKey() %>"><%=pair.getValue() %></option>
					<%
					}
					%>
			</select></td>
			<td>
				Every&nbsp;&nbsp;
				<select id="fromDoseDays" name="fromDoseDays" onchange="updateDuration(this, 'doseDuration')">
					<% 
					for(int i=1 ;i<32; i++){
					%><option value="<%=i%>"><%=i %></option><%
					}
					%>
				</select>
				<select id="doseDuration">
					<option value="day">Day</option>
					<option value="week">Week</option>
					<option value="month">Month</option>
					<option value="year">Year</option>
				</select>
			</td>				
			<td>
				For&nbsp;
				<select id="tillDosedays" name="tillDosedays" onchange="updateDuration(this, 'doseDuration')">
					<% 
					for(int i=1 ;i<32; i++){
					%><option value="<%=i%>"><%=i %></option><%
					}
					%>
				</select>
				<select id="doseTill">
					<option value="day">Day</option>
					<option value="week">Week</option>
					<option value="month">Month</option>
					<option value="year">Year</option>
				</select>
			</td>
			<td>
				<table>
					<tr>
						<td>Morning&nbsp;&nbsp;<input type="checkbox" id="morning" value="Morning"></td>
						<td>Qty : <input type="text" name="morningQty" id="morningQty" value=""></td>
						<td>
							<select id="breakfast">
								<option value="afterBreakfast">After BreakFast</option>
								<option value="beforeBreakfast">Before BreakFast</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Afternoon<input type="checkbox" id="afternoon" value="afternoon"></td>
						<td>Qty : <input type="text" name="afternoonQty" id="afternoonQty" value=""></td>
						<td>
							<select id="meal">
								<option value="afterMeal">After Meal</option>
								<option value="beforeMeal">Before Meal</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Evening&nbsp;&nbsp;&nbsp;<input type="checkbox" id="evening" value="evening"></td>
						<td>Qty : <input type="text" name="eveningQty" id="eveningQty" value=""></td>
						<td>
							<select id="snacks">
								<option value="afterSnack">After Snacks</option>
								<option value="beforeSnack">Before Snacks</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Night&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="night" value="night"></td>
						<td>Qty : <input type="text" name="nightQty" id="nightQty" value=""></td>
						<td>
							<select id="dinner">
								<option value="afterDinner">After Dinner</option>
								<option value="beforeDinner">Before Dinner</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
			<td><input type="button" value="add" name="add" id="add"
				onclick="addPrescription()" align="middle"></td>
		</tr>
	</table>
	<br />
	<br />
	<table width="50%" border="1" name="addedPrescription"
		id="addedPrescription" align="center">
		<tr>
			<td>Prescription Name</td>
			<td>Dose</td>
			<td>Usage</td>
			<td>Action</td>
		</tr>
		<tr id="noData">
			<td colspan="4" align="center">No Prescription Added</td>
		</tr>
	</table>
	<br />
	<input type="submit" value="Submit" name="page1" id="page1"
		align="middle">
	<%
	
	
	ConnectionsUtil.closeResultSet(userDataRS);
}catch(Exception e){
	System.out.println("Error ");
	e.printStackTrace();
	
}
	
%>
</form>
</body>
</html>