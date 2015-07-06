<%@page import="java.util.Date"%>
<%@page import="com.org.doctorsonline.generic.ConnectionsUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.doctorsonline.search.Search"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/pages/generic/validateSession.jsp"%>
<%@ include file="/pages/header/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/DoctorsOnline/resources/css/jquery-ui.css">
  <link rel="stylesheet" href="/DoctorsOnline/resources/css/jquery-ui.structure.css">
  <script src="/DoctorsOnline/resources/js/jquery.js"></script>
  <script src="/DoctorsOnline/resources/js/jquery-ui.js"></script>
  <script type="text/javascript" src="/DoctorsOnline/resources/js/search.js"></script>
  
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
  table
{
  border-collapse:collapse;
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
          .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
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
          .attr( "tabIndex", -1 )
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
          })
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
    $( "#combobox" ).combobox();
    $( "#toggle" ).click(function() {
      $( "#combobox" ).toggle();
    });
  });
  </script>
</head>
<body>
<br/>
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
					<td>Patient Name : </td>
					<td align="left"><%=patientName %></td>
					<td>Date : </td>
					<td align="left"><%=today %></td>
					
				</tr>
				
			</table>
			<br/>
			<br/>
			<table align="center" width="50%">
				<tr>
					<td>Weight : </td>
					<td><input type="text" name="weight" id="weight" value=""></td>
					<td>Height : </td>
					<td><input type="text" name="height" id="height" value=""></td>
					<td>BP : </td>
					<td><input type="text" name="bp" id="bp" value=""></td>
				</tr>
				<tr>
					<td colspan="6" align="left">Visit Summary</td>
				</tr>
				<tr>
					<td colspan="6" align="left">
						<textarea rows="6" cols="1" name="summary" id="summary" style="width: 100%"></textarea>
					</td>
				</tr>
			</table>
			<br/>
			<br/>
			
		<%
		//userDataRS.next();
	}
	
	ResultSet dataRS = search.getAllPrescriptions();
	%><table align="center" width="50%" border="1">
		<tr>
			<td>Medicine Name</td>
			<td>Opeartion</td>
		</tr>
		<tr>
			<td>
				<select id="combobox">
				<option value="">Select one...</option>
					<%while(dataRS.next()){
						%><option value="<%=dataRS.getString("prescription_id") %>"><%=dataRS.getString("drug_name") %></option><%
					}
					%>
				</select>
			</td>
			<td><input type="button" value="add" name="add" id="add" onclick="addPrescription()"></td>
		</tr>
	</table>
	<br/><br/>
	<table width="50%" border="1" name="addedPrescription" id="addedPrescription" align="center">
		<tr>
			<td>Prescription Name</td>
			<td>Dose</td>
			<td>Usage</td>
			<td>Action</td>
		</tr>
		<tr id="noData"><td colspan="4" align="center">No Prescription Added</td></tr>
	</table>
	<br/>
	<input type="submit" value="Submit" name="page1" id="page1" align="middle">
	<%
	
	
	ConnectionsUtil.closeResultSet(userDataRS);
	
	ConnectionsUtil.closeResultSet(dataRS);
%>
</body>
</html>