<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%String paramMapString = request.getParameter("paramMap");
if(paramMapString != null){
	JSONParser jsonParser = new JSONParser();	
	JSONObject paramJSON = (JSONObject) jsonParser.parse(paramMapString);
	String action = paramJSON.get("action") == null ? "" : (String)paramJSON.get("action");
	if(action.equalsIgnoreCase("getTimings")){
		String selectedDate = paramJSON.get("selectedDate") == null ? "" : (String)paramJSON.get("selectedDate");
		if(!selectedDate.equals("")){
			Appointment appointment = new Appointment();
			LinkedHashMap<String, String> timings = appointment.getTimings(selectedDate);
			
			String timeList = "";
			
			for(Map.Entry<String,String> map : timings.entrySet()){
				timeList += map.getKey() + ",";
			}
			response.setCharacterEncoding("UTF-8");
			out.print(timeList.replaceAll(",$", ""));
		}
	}
}else{
	throw new Exception();
}%>