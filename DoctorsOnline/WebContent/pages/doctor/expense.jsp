<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.org.doctorsonline.search.Expense"%>
<%@page import="com.org.doctorsonline.model.ExpenseModel"%>
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
		Integer userId = Integer.parseInt(session.getAttribute("userId")
				+ "");
		if (request.getParameter("expenseDesc") != null) {
			ExpenseModel expenseModel = new ExpenseModel();
			expenseModel.setExpense_desc(request
					.getParameter("expenseDesc"));
			expenseModel.setExpense_bill_amount(Double.parseDouble(request
					.getParameter("amount")));
			expenseModel.setUser_id(userId);
			
			Expense.addExpense(expenseModel);

		}
	%>

	<form method="post" action="#" style="text-align: center;">
<h1 align="center">Add expense</h1>

<table class="mainTable" align="center">
		<tr>
		<td>Expense description</td>
		<td><input type="text" name="expenseDesc" id="expenseDesc" value="" autocomplete="off""></td>
	</tr>
	<tr>
		<td>Amount : </td>
		<td><input type="text" id="amount" name="amount"></td>
	</tr>
	<tr>
		<td colspan=2 align="center"><input type="Submit" id="submit" name="submit"></td>
	</tr>
	
</table>
<div id="dialog-confirm"></div>



</form>
<script type="text/javascript" src="/DoctorsOnline/resources/js/appointment.js"></script>
</body>
</html>