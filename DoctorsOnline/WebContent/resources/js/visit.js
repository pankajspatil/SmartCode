/**
 * This java script page created to include function required on patient visit page in case of new / edit / view.
 */

var prescriptionId = '';
var prescriptionName = '';
var allPrescriptions = [];

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
          //.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
          .autocomplete({
            delay: 0,
            minLength: 3,
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
           */.mousedown(function() {
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
    $( "#combobox" ).combobox({
    	select:function(event,ui){
    		prescriptionId = ui.item.value;
    		prescriptionName = ui.item.text;
    	}
    });
    $( "#toggle" ).click(function() {
      $( "#combobox" ).toggle();
    });
  });

  
  function updateDuration(selectObj, id){
	  
	  if($(selectObj).val() > 1){
		  updateValues ('plural', id);
	  }else{
		  updateValues ('single', id);
	  }
  }
  
  function updateValues(type, id){
	  var value = '';
	  $(function() {
		    $("#" + id + " option").each(function(i){
		    	
		    	value = $(this).text();
		    	
		    	if(value != ''){
		  		  if(type == 'plural' && value.slice(-1) != 's'){
		  			value = value + 's';
		  		  }else if(type == 'single' && value.slice(-1) == 's'){
		  			value = value.slice(0,-1);
		  		  }
		  	  }
		    	
		    	$(this).text(value);
		    	$(this).val(value);
		    });
		});
	  
	  
	  
  }
  function addPrescription(){

	  //var prescriptionId = $('#combobox').find('option:selected').val();
	  //var prescriptionName = $('#combobox').find('option:selected').text();
	  var prescriptionData = {};
	  var isValid = true;
	  
	  if(prescriptionId == ''){
		  alert('Please select medicine from dropdown.');
		  $('#combobox').focus();
		  return false;
	  }
		
	var fromDoseDays = $('#fromDoseDays').find('option:selected').text();
	
	var doseDuration = $('#doseDuration').find('option:selected').text();
	
	var doseTill = $('#doseTill').find('option:selected').text();
	
	var tillDosedays = $('#tillDosedays').find('option:selected').text();
	
	var operationText = "morning#afternoon#evening#night";
	var oprnArray = operationText.split("#");
	
	$.each( oprnArray, function( index, value ) {
		  //alert( index + ": " + value );
		  if ($('#'+value+'').is(":checked")){
			  if($('#' + value + 'Qty').val() != ''){
			  	prescriptionData[value] = $('#'+value+'').attr('value');
			  	prescriptionData[value + 'Qty'] = $('#' + value + 'Qty').val();
			  	prescriptionData[value + 'Frequency'] = $('#' + value + 'Frequency').find('option:selected').text();
			  }
			else{
				alert('Please fill quantity for ' + value);
				$('#' + value + 'Qty').focus();
				isValid = false;
				return false;
			}
		  }
		});
		
		var tableObj = $('#addedPrescription');
		$('#noData').remove();
			
		
		tableObj.find("input[type='hidden']").each(function(){
		     if(prescriptionId == $(this).val()){
		    	 alert('Prescription already added.');
		    	 isValid = false;
		     }
		  });
		
		if(isValid){
			
		prescriptionData.prescriptionId = prescriptionId;
		prescriptionData.prescriptionName = prescriptionName;
		
		
		var row = "<tr>" +
					"<td>" +
						"<input type='hidden' name='prescriptionId' value='"+prescriptionId+"'>" + 
						prescriptionName +
					" </td>" +
					"<td> Every" +fromDoseDays +" "+doseDuration+" "+" for "+tillDosedays +" "+doseTill +
					"</td>" +
					"<td><div id='"+prescriptionId+"' class='clickableToolTip' onclick='displayTooltip(this)' onmouseout='disableTooltip(this)' title='details'>Details</div></td>" +
					"<td align='center'><input type='button' value='Delete' onClick='deleteRow(this)'></td>"+
				"</tr>";
		
		tableObj.append(row);
		allPrescriptions.push(prescriptionData);
		}
	}

	function deleteRow(cellObj){
		var row = cellObj.closest('tr');
		row.remove();
	}
	
function validateForm(){
	document.getElementById('prescriptionData').value = JSON.stringify(allPrescriptions);
	document.getElementById("newVisitForm").submit();
}

function openVisitDetailsPage(visitId){
	window.opener.location = '/DoctorsOnline/pages/doctor/newVisit.jsp?visitId=' +visitId;
	window.close();
}

function displayTooltip(selectedObj){
	
	var textToDisplay = "";
	
	$.each(allPrescriptions, function(index, prescriptionData){
		if(prescriptionData.prescriptionId === $(selectedObj).attr('id')){
			var operationText = "morning#afternoon#evening#night";
			var oprnArray = operationText.split("#");
			
			$.each( oprnArray, function( index, value ) {
				  //alert( index + ": " + value );
				
				if(prescriptionData[value]){
					textToDisplay += "<hr>" + prescriptionData[value + 'Qty'] + " in " 
								+ prescriptionData[value] + " "+ prescriptionData[value + 'Frequency'];
				}
				});
			return false;
		}
	});
	
	textToDisplay = textToDisplay.replace(/^<hr>/g,'');
	
	$(selectedObj).tooltip({
		items: '#'+$(selectedObj).attr('id'),
		content: textToDisplay,
		position: {
	        my: "center bottom-20",
	        at: "center top",
	        using: function( position, feedback ) {
	          $( this ).css( position );
	          $( "<div>" )
	            .addClass( "arrow" )
	            .addClass( feedback.vertical )
	            .addClass( feedback.horizontal )
	            .appendTo( this );
	        }
		}
	});
	$(selectedObj).tooltip("open");
}

function disableTooltip(selectedObj){
	if($(selectedObj).tooltip( "instance" ) !== undefined){
		$(selectedObj).tooltip("disable");
	  }
}

