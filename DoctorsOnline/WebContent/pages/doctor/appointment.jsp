<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="com.org.doctorsonline.model.User"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="/pages/generic/validateSession.jsp"%>
 <%@ include file="/pages/header/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="/DoctorsOnline/resources/js/jquery.js"></script>
<script type="text/javascript" src="/DoctorsOnline/resources/js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript" src="/DoctorsOnline/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/DoctorsOnline/resources/js/general.js"></script>

<link rel="stylesheet" type="text/css" href="/DoctorsOnline/resources/css/jquery-ui.css"></link>
<link rel="stylesheet" type="text/css" href="/DoctorsOnline/resources/css/jquery-ui.structure.css"></link>
<link rel="stylesheet" type="text/css" href="/DoctorsOnline/resources/css/jquery.datetimepicker.css"></link>

<link rel="stylesheet"
	href="/DoctorsOnline/resources/css/jquery-ui.structure.css" />

<style>
</style>
	
<style>
.custom-combobox {
	position: relative;
	display: inline-block;
}

.custom-combobox-toggle {
	position: absolute;
	top: 0;
	bottom: 0;
	margin-left: -1px;
	padding: 0;
}

.custom-combobox-input {
	margin: 0;
	padding: 5px 10px;
}

.ui-autocomplete {
	max-height: 300px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
}
/* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
* html .ui-autocomplete {
	height: 300px;
}

table {
	border-collapse: collapse;
}
#comments{
	width: 100%;
}
</style>
<script>
  (function( $ ) {
    $.widget( "custom.combobox", {
      _create: function() {
        this.wrapper = $( "<span>" )
          .addClass( "custom-combobox" )
          .insertAfter( this.element );
 
        this.element.hide();
        this._createAutocomplete();
        this._createShowAllButton();
      },
 
      _createAutocomplete: function() {
        var selected = this.element.children( ":selected" ),
          value = selected.val() ? selected.text() : "";
 
        this.input = $( "<input>" )
          .appendTo( this.wrapper )
          .val( value )
          .attr( "title", "" )
          .attr( "width", "100%" )
          //.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
          .autocomplete({
            delay: 0,
            minLength: 0,
            source: $.proxy( this, "_source" )
          })
          .tooltip({
            tooltipClass: "ui-state-highlight"
          });
 
        this._on( this.input, {
          autocompleteselect: function( event, ui ) {
            ui.item.option.selected = true;
            this._trigger( "select", event, {
              item: ui.item.option
            });
          },
 
          autocompletechange: "_removeIfInvalid"
        });
      },
 
      _createShowAllButton: function() {
        var input = this.input,
          wasOpen = false;
 
        $( "<a>" )
          /* .attr( "tabIndex", -1 )
          .attr( "title", "Show All Items" )
          .tooltip()
          .appendTo( this.wrapper )
          .button({
            icons: {
              primary: "ui-icon-triangle-1-s"
            },
            text: false
          })
          .removeClass( "ui-corner-all" )
          .addClass( "custom-combobox-toggle ui-corner-right" ) 
          .mousedown(function() {
            wasOpen = input.autocomplete( "widget" ).is( ":visible" );
          })*/
          .click(function() {
            input.focus();
 
            // Close if already visible
            if ( wasOpen ) {
              return;
            }
 
            // Pass empty string as value to search for, displaying all results
            input.autocomplete( "search", "" );
          });
      },
 
      _source: function( request, response ) {
        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        response( this.element.children( "option" ).map(function() {
          var text = $( this ).text();
          if ( this.value && ( !request.term || matcher.test(text) ) )
            return {
              label: text,
              value: text,
              option: this
            };
        }) );
      },
 
      _removeIfInvalid: function( event, ui ) {
 
        // Selected an item, nothing to do
        if ( ui.item ) {
          return;
        }
 
        // Search for a match (case-insensitive)
        var value = this.input.val(),
          valueLowerCase = value.toLowerCase(),
          valid = false;
        this.element.children( "option" ).each(function() {
          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
            this.selected = valid = true;
            return false;
          }
        });
 
        // Found a match, nothing to do
        if ( valid ) {
          return;
        }
 
        // Remove invalid value
        this.input
          .val( "" )
          .attr( "title", value + " didn't match any item" )
          .tooltip( "open" );
        this.element.val( "" );
        this._delay(function() {
          this.input.tooltip( "close" ).attr( "title", "" );
        }, 2500 );
        this.input.autocomplete( "instance" ).term = "";
      },
 
      _destroy: function() {
        this.wrapper.remove();
        this.element.show();
      }
    });
  })( jQuery );
 
  $(function() {
    $( "#physician" ).combobox({   
    	select: function( event, ui ) {
    		updateAppnSlots();
    	} 
    });
    
    $( "#toggle" ).click(function() {
      $( "#physician" ).toggle();
    });
       
    
    $( "#patientName" ).combobox();
    $( "#toggle" ).click(function() {
      $( "#patientName" ).toggle();
    });
    
  });
  </script>
<script type="text/javascript">
  function openPage(){
		alert('Need to Create the Pateint record. Before taking any appointment')
		var formObj = $(document.createElement('form'));
		formObj.attr("method", "post");
        formObj.attr("action", "/DoctorsOnline/pages/doctor/createUser.jsp");
        formObj.submit();
	   
	}
  </script>
  <style>
  	.mainTable{
  		text-align: left; !important;
  		font: 100%;
  		font-size: larger;
  		width: 40%;
  	}
  	
  	
  	.ui-autocomplete-input
	{ 
    	width: 100%;
	}
  	select{
  		width: 100%;
  	  	}
  	input[type=text]{
		width: 100%;
	}
	td{
		padding: 1%;
	}
input, select{
outline: 5px solid #eff4f7;
}
  </style>
</head>
<body>
<%
 Appointment appointment = new Appointment();
 ArrayList<User> doctorList = appointment.getUserList("Doctor");
 ArrayList<User> patientList = appointment.getUserList("Patient");
 
 String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
 //out.println("today==>"+ today);
 
 LinkedHashMap<String, String> timings = appointment.getTimings(today);
 //out.println(timings);
 ArrayList<String> timingsList = new ArrayList<String>();
 

for(Map.Entry<String,String> map : timings.entrySet()){
	timingsList.add("'" + map.getKey() + "'");
}
//out.println(timingsList);
 
 String appntSlot = request.getParameter("appSlot") == null ? "" : request.getParameter("appSlot");
 Integer returnValue = null;
 String message = null;
 
// out.println(appntSlot);
 
 String doctorId = request.getParameter("physician");
 String patientId = request.getParameter("patientName");
 String comments = request.getParameter("comments") == null ? "" : request.getParameter("comments");
 
 String[] timeArray = null;
 
 
 
 if(request.getParameter("form1") != null){
	 	 String appnDate = appntSlot.split(" ")[0];
		 String timeId = timings.get(appntSlot.split(" ")[1]);
	     returnValue = appointment.createAppointment(doctorId, patientId, appnDate, timeId, session.getAttribute("userId").toString(), comments);
	     message = returnValue == 1 ? "Sorry selected slot is not available." : "Appointment is booked.";
 }
 
 
 
 %>
 <script type="text/javascript">
 var timingsList = <%=timingsList%>;
 </script>
 
<form method="post" action="" style="text-align: center;">
<h1 align="center">Patient Appointment</h1>

<table class="mainTable" align="center">
	<tr>
		<td>Is this your first visit to our Clinic?</td>
		<td>
			<input type="radio" id="isVisitY" value="Y" name="isVisit" onclick="fnOpenNormalDialog(this)"> Y
			<input type="radio" id="isVisitN" value="N" name="isVisit"> N
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="bottom" align="center"><h3>Appointment Information</h3></td>
	</tr>
	<tr>
		<td>Preferred Physician : </td>
		<td>
			<select name="physician" id="physician" class="physician autocomplete">
			<option value="-1"></option>
			<%
					Iterator it = doctorList.iterator();
					User user = null;
				    while (it.hasNext()) {
				       		user = (User)it.next();		        
				     	%><option <%=user.getUserId().equals(doctorId) ? "selected = selected" : "" %> value="<%=user.getUserId() %>"><%=user.getFirstName() + " "+user.getLastName() %></option>
					<%
					}
				    it = null;
					%>						
		</select>
		</td>
	</tr>
	<tr>
		<td>
			Patient Name : 
		</td>
		<td>
			<select name="patientName" id="patientName">
			<option value=""></option>
				<%	
			it = patientList.iterator();
				    user = null;
				    while (it.hasNext()) {
				       		user = (User)it.next();	
				       		out.println(patientId + "==>" + user.getUserId());
				     	%><option <%=user.getUserId().equals(patientId) ? "selected = selected" : "" %> value="<%=user.getUserId() %>"><%=user.getFirstName() + " "+user.getLastName() %></option>
				<%
					}
				    it = null;
					%>
						</select>
		</td>
	</tr>
	<tr>
		<td>Appointment Slot : </td>
		<td><input type="text" name="appSlot" id="appSlot" value="<%=appntSlot %>" autocomplete="off""></td>
	</tr>
	<tr>
		<td>Comments : </td>
		<td><textarea rows="8" cols="2" id="comments" name="comments"><%=comments %></textarea> </td>
	</tr>

	<tr>
		<td align="center" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input <%=((returnValue == null || returnValue == 1) ? "" : "disabled='disabled'") %> type="submit" name="form1" value="Submit" id="form1"></td>
	</tr>
	
</table>
<div id="dialog-confirm"></div>
<%
if(message != null){
	%>
	<script type="text/javascript">

$("#dialog-confirm").html('<%=message%>');

$("#dialog-confirm").dialog();

</script>
	<%
}

%>


</form>
<script type="text/javascript" src="/DoctorsOnline/resources/js/appointment.js"></script>
</body>
</html>