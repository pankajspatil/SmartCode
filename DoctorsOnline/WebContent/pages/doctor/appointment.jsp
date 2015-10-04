<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="com.org.doctorsonline.model.User,java.util.ArrayList,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment</title>
</head>
<%@ include file="/pages/generic/validateSession.jsp"%>
<%@ include file="/pages/header/header.jsp"%>
<link rel="stylesheet" href="/DoctorsOnline/resources/css/jquery-ui.css">
<link rel="stylesheet"
	href="/DoctorsOnline/resources/css/jquery-ui.structure.css">
<script src="/DoctorsOnline/resources/js/jquery.js"></script>
<script src="/DoctorsOnline/resources/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="/DoctorsOnline/resources/js/search.js"></script>
 <link rel="stylesheet" href="/DoctorsOnline/resources/css/style.css">
 
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
 <%
 Appointment appointment = new Appointment();
 ArrayList<User> doctorList = appointment.getUserList("Doctor");
 ArrayList<User> patientList = appointment.getUserList("Patient"); 
 
 %>




<body>
<form>
	<section class="container">
	<div id="q9" class="q required">
		<a class="item_anchor" name="ItemAnchor9"></a> <span
			class="question top_question"><b class="icon_required">*</b>
			Is this your first visit to our offices?</span>
		<table class="inline_grid">
			<tbody>
				<tr>
					<td><input type="radio" name="RESULT_RadioButton-9"
						class="multiple_choice" id="RESULT_RadioButton-9_0"
						value="Radio-0"><label for="RESULT_RadioButton-9_0">Yes</label></td>
					<td><input type="radio" name="RESULT_RadioButton-9"
						class="multiple_choice" id="RESULT_RadioButton-9_1"
						value="Radio-1"><label for="RESULT_RadioButton-9_1">No</label></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="clear"></div>

	<div id="q21" class="q full_width">
		<a class="item_anchor" name="ItemAnchor10"></a>
		<div class="segment_header" style="width: auto; text-align: Left;">
			<h1 style="font-size: 18px;">Appointment Information</h1>
		</div>
	</div>

	<div class="clear"></div>

	<div id="q11" class="q required">
		<a class="item_anchor" name="ItemAnchor11"></a> <label
			class="question top_question" for="RESULT_TextField-11"><b
			class="icon_required">*</b> Date</label> <input type="text"
			name="RESULT_TextField-11"
			class="text_field calendar_field hasDatepicker"
			id="RESULT_TextField-11" size="10" maxlength="10" datemax=""
			datemin="" value="" date="mm/dd/yy"><img
			class="popup_button inline_button"
			src="/images/icons/formIcons/calendar.gif" alt="calendar"
			style="vertical-align: top;">

	</div>
	<div id="q12" class="q required">
		<a class="item_anchor" name="ItemAnchor12"></a> <label
			class="question top_question" for="RESULT_RadioButton-12"><b
			class="icon_required">*</b> Time</label> 
	  <select id="RESULT_RadioButton-12"
			name="RESULT_RadioButton-12" class="drop_down">
			<option></option>
			<option value="Radio-0">Morning</option>
			<option value="Radio-1">Afternoon</option>
			<option value="Radio-2">Evening</option>
		</select>
	</div>
	<div id="q14" class="q">
		<a class="item_anchor" name="ItemAnchor13"></a> <span
			class="question top_question">Preferred Physician</span>
		<table class="inline_grid">
			<tbody>
				<tr>
					<td>
					<select id="appointDoctorId"
							name="appointDoctorName" class="drop_down">
						<option>Select Doctor</option>
						<%
					Iterator it = doctorList.iterator();
					User user = null;
				    while (it.hasNext()) {
				       		user = (User)it.next();		        
				     	%><option value="<%=user.getUserName() %>"><%=user.getFirstName() + " "+user.getLastName() %></option>
					<%
					}
				    it = null;
					%>						
		</select></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="q14_1" class="q">
		<a class="item_anchor" name="ItemAnchor13"></a> <span
			class="question top_question">Patient Name</span>
		<table class="inline_grid">
			<tbody>
				<tr>
						<td><select id="combobox" name="appointPatientName"
							class="drop_down">
								<option></option>
								<%
					it = patientList.iterator();
				    user = null;
				    while (it.hasNext()) {
				       		user = (User)it.next();		        
				     	%><option value="<%=user.getUserName() %>"><%=user.getFirstName() + " "+user.getLastName() %></option>
								<%
					}
				    it = null;
					%>
						</select> </td>
					</tr>
			</tbody>
		</table>
	</div>

	<div class="clear"></div>

	<div id="q15" class="q required">
		<a class="item_anchor" name="ItemAnchor14"></a> <label
			class="question top_question" for="RESULT_TextArea-14"><b
			class="icon_required">*</b> Please describe the reason for this visit</label>
		<textarea name="RESULT_TextArea-14" class="text_field"
			id="RESULT_TextArea-14" rows="7" cols="65"></textarea>
	</div>
	<div class="clear"></div>

	<div class="q required">
		<b class="icon_required">*</b> Indicates Response Required
	</div>
	<div class="clear"></div>

	</div>
	</section>
	</form>
</body>
</html>