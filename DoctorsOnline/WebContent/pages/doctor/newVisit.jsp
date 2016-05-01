<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.org.doctorsonline.search.Visit"%>
<%@page import="com.org.doctorsonline.generic.Constants"%>
<%@page import="com.org.doctorsonline.generic.Utils"%>
<%@page import="com.org.doctorsonline.search.MedicalTest"%>
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
	<form method="post" name="newVisitForm" id="newVisitForm">
	<%
	
	Search search = new Search();
	
	String height = "", weight = "", bp = "", bmi = "", gfr = "", hbv = "", hiv = "", prescriptionData = "";
	String g6pd = "", abnormalHB = "", allergy = "", visitSummary = "", patientName = "", visitId = "", medicalTestIds = "";
	Integer returnValue = null;
	String today = new Date().toString();
	Visit visit = new Visit();
	
	String userId = Utils.getString(request.getParameter("userId"));
	visitId = Utils.getString(request.getParameter("visitId"));
	String appointmentId = Utils.getString(request.getParameter("appointmentId"));
	//out.println("userId===>" + appointmentId);
		
	if(request.getParameter("page1") != null){
		prescriptionData = Utils.getString(request.getParameter("prescriptionData"));
		out.println("prescriptionData===>" + prescriptionData);
		
		height = Utils.getString(request.getParameter(Constants.HEIGHT));
		weight = Utils.getString(request.getParameter(Constants.WEIGHT));
		bp = Utils.getString(request.getParameter(Constants.BP));
		bmi = Utils.getString(request.getParameter(Constants.BMI));
		gfr = Utils.getString(request.getParameter(Constants.GFR));
		hbv = Utils.getString(request.getParameter(Constants.HBV));
		hiv = Utils.getString(request.getParameter(Constants.HIV));
		g6pd = Utils.getString(request.getParameter(Constants.G6PD));
		abnormalHB = Utils.getString(request.getParameter(Constants.ABNORMAL_HB));
		allergy = Utils.getString(request.getParameter(Constants.ALLERGY));
		visitSummary = Utils.getString(request.getParameter(Constants.VISIT_SUMMARY));
		medicalTestIds = Utils.getString(request.getParameter(Constants.MEDICAL_TEST_IDS));
		
		LinkedHashMap<String, String> paramMap = new LinkedHashMap<String, String>();
		paramMap.put(Constants.PRESCRIPTION_DATA, prescriptionData);
		paramMap.put(Constants.HEIGHT, height);
		paramMap.put(Constants.WEIGHT, weight);
		paramMap.put(Constants.BP, bp);
		paramMap.put(Constants.BMI, bmi);
		paramMap.put(Constants.GFR, gfr);
		paramMap.put(Constants.HBV, hbv);
		paramMap.put(Constants.HIV, hiv);
		paramMap.put(Constants.G6PD, g6pd);
		paramMap.put(Constants.ABNORMAL_HB, abnormalHB);
		paramMap.put(Constants.ALLERGY, allergy);
		paramMap.put(Constants.USER_ID, session.getAttribute("userId").toString());
		paramMap.put(Constants.PATIENT_ID, userId);
		paramMap.put(Constants.VISIT_SUMMARY, visitSummary);
		paramMap.put(Constants.APPOINTMENT_ID, appointmentId);
		paramMap.put(Constants.MEDICAL_TEST_IDS, medicalTestIds);
		System.out.println("paramMap===>" + paramMap);
		
		LinkedHashMap<String, Object> returnMap = visit.createNewVisit(paramMap);
		
		returnValue = (Integer)returnMap.get(Constants.RETURN_STATUS);		
		visitId = returnMap.get(Constants.VISIT_ID) == null ? "" : returnMap.get(Constants.VISIT_ID).toString();
	}
	
	if(userId != null){
		
		ResultSet userDataRS = search.getUser(userId);
		if(userDataRS != null){
			
			while(userDataRS.next()){
				
			patientName = (userDataRS.getString("firstName") + " "
					+ userDataRS.getString("middleName") + " " 
					+ userDataRS.getString("lastName")).replaceAll("[ ]+", " ");
			}
		}
		ConnectionsUtil.closeResultSet(userDataRS);
	
	if(!visitId.equals("")){
		
		ResultSet dataRS =  visit.getVisitDetail(null, null, visitId);
		if(dataRS != null){
			while(dataRS.next()){				
				patientName = (dataRS.getString("firstName") + " "
						+ dataRS.getString("middleName") + " " 
						+ dataRS.getString("lastName")).replaceAll("[ ]+", " ");
				prescriptionData = Utils.getString(dataRS.getString("prescription_data"));
				//out.println("prescriptionData===>" + prescriptionData);
				
				height = Utils.getString(dataRS.getString("height"));
				weight = Utils.getString(dataRS.getString("weight"));
				bp = Utils.getString(dataRS.getString("bp"));
				bmi = Utils.getString(dataRS.getString("bmi"));
				gfr = Utils.getString(dataRS.getString("gfr"));
				hbv = Utils.getString(dataRS.getString("hbv"));
				hiv = Utils.getString(dataRS.getString("hiv"));
				g6pd = Utils.getString(dataRS.getString("g6pd"));
				abnormalHB = Utils.getString(dataRS.getString("ahb"));
				allergy = Utils.getString(dataRS.getString("allergy"));
				visitSummary = Utils.getString(dataRS.getString("summary"));
				//Sun Apr 03 01:26:53 IST 2016
				SimpleDateFormat sdfDate = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy");				
				today = sdfDate.format(dataRS.getTimestamp("created_on"));
			}
		}
		ConnectionsUtil.closeResultSet(dataRS);
}
	
	
		%>
	<h1 align="center"><%=visitId.equals("") ? "Patient New Visit" : "Visit Details"%></h1>
	<table align="center" width="50%" id="visitDetails">
		<tr>
			<td>Patient Name :</td>
			<td align="left"><%=patientName %></td>
			<td>Date :</td>
			<td align="left"><%=today %></td>

		</tr>

	</table>
	<br />
	<br />
	<table align="center" width="60%" border="1">
		<tr>
			<td>Weight :</td>
			<td><input type="text" name="weight" size="5" id="weight" value="<%=weight%>"></td>
			<td>Height :</td>
			<td><input type="text" name="height" size="5" id="height" value="<%=height%>"></td>
			<td>BP :</td>
			<td><input type="text" name="bp" id="bp" size="5" value="<%=bp%>"></td>
			<td>BMI :</td>
			<td><input type="text" name="bmi" size="5" id="bmi" title="Body Mass Index" value="<%=bmi%>"></td>
			<td>GFR :</td>
			<td><input type="text" name="gfr" size="5" id="gfr" value="<%=gfr%>"></td>
						
		</tr>
		<tr>
			<td colspan="5">Immune status</td>
			</tr>
		<tr>
			<td>HBV :</td>
			<td><input type="text" name="hbv" id="HBhbvV" size="5" value="<%=hbv%>"></td>	
			<td>HIV :</td>
			<td><input type="text" name="hiv" id="hiv" size="5" value="<%=hiv%>"></td>
			<td>G6PD :</td><td><input type="text" name="g6pd" id="g6pd" size="5" value="<%=g6pd%>"></td>
			<td>AbnormalHB :</td><td><input type="text" name="abnormalHB" id="abnormalHB" size="5" value="<%=abnormalHB%>"></td>
			<td>Allergy :</td><td><input type="text" name="allergy" id="allergy" size="5" value="<%=allergy%>"></td>		
		</tr>
		<tr>
			<td colspan="6" align="left">Visit Summary</td>
		</tr>
		<tr>
			<td colspan="6" align="left"><textarea rows="6" cols="1"
					name="visitSummary" id="visitSummary" style="width: 100%"><%=visitSummary %></textarea></td>
			<td align="center"><div onclick="openDocumentsUpload()">Upload Documents</div></hr>
			<div onclick="openSuggestTests()">Suggest Tests</div></td>
		</tr>
	</table>
	<br />
	<br />

	<%
		//userDataRS.next();
	}
	if(visitId.equals("")){
		
	ConcurrentHashMap<String,String> prescription = (ConcurrentHashMap<String,String>) application.getAttribute("prescription");
	%><table align="center" width="80%" border="1">
		<tr align="center"  class='mainBGnFont'>
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
				<select id="tillDosedays" name="tillDosedays" onchange="updateDuration(this, 'doseTill')">
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
							<select id="morningFrequency">
								<option value="afterBreakfast">After BreakFast</option>
								<option value="beforeBreakfast">Before BreakFast</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Afternoon<input type="checkbox" id="afternoon" value="Afternoon"></td>
						<td>Qty : <input type="text" name="afternoonQty" id="afternoonQty" value=""></td>
						<td>
							<select id="afternoonFrequency">
								<option value="afterMeal">After Meal</option>
								<option value="beforeMeal">Before Meal</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Evening&nbsp;&nbsp;&nbsp;<input type="checkbox" id="evening" value="Evening"></td>
						<td>Qty : <input type="text" name="eveningQty" id="eveningQty" value=""></td>
						<td>
							<select id="eveningFrequency">
								<option value="afterSnack">After Snacks</option>
								<option value="beforeSnack">Before Snacks</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Night&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="night" value="Night"></td>
						<td>Qty : <input type="text" name="nightQty" id="nightQty" value=""></td>
						<td>
							<select id="nightFrequency">
								<option value="afterDinner">After Dinner</option>
								<option value="beforeDinner">Before Dinner</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
			<td><input type="button" value="add" name="add" id="add"
				onclick="addPrescription()" align="middle" class="mainBGnFont"></td>
		</tr>
	</table>
	<%} %>
	<br />
	<br />
	<table width="50%" border="1" name="addedPrescription"
		id="addedPrescription" align="center" class="<%=visitId.equals("") ? "" 
				: ((!visitId.equals("") && !prescriptionData.equals("")) ? "" : "displayHide")%>">
		<tr class="mainBGnFont">
			<td width="25%" align="center">Prescription Name</td>
			<td align="center">Dose</td>
			<td align="center">Usage</td>
			<td align="center" class="<%=visitId.equals("") ? "" : "displayHide"%>">Action</td>
		</tr>
		<tr id="noData">
			<td colspan="4" align="center">No Prescription Added</td>
		</tr>
	</table>
	<br />
	<center><input type="submit" value="Submit" name="page1" id="page1" class="mainBGnFont <%=visitId.equals("") ? "" : "displayHide"%>" onclick="validateForm()"></center>
	<input type="hidden" value='<%=prescriptionData %>' name="prescriptionData" id="prescriptionData">
	<input type="hidden" value="<%=userId %>" name="userId" id="userId">
	<input type="hidden" value="<%=appointmentId %>" name="appointmentId" id="appointmentId">
	<input type="hidden" value="<%=medicalTestIds %>" name="medicalTestIds" id="medicalTestIds">
	
	
	<script type="text/javascript">
	var returnValue = <%=returnValue%>;
	var visitId = <%=visitId.equals("") ? "''" : visitId%>;
	//alert(returnValue);
	if(visitId !== ''){
		updateVisitDetails();
	}
	
	if(returnValue != null){
		if(returnValue == '-1'){
			alert('Error while saving data');
		}else{
			alert('Data has been successfully saved!!');
			//$('#page1').disabled = true;
		}			
	}
	</script>
	
	<%
	
}catch(Exception e){
	System.out.println("Error in new visit");
	e.printStackTrace();
	
}
	
%>
</form>
</body>
</html>