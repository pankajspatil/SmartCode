/**
 * This js file is created to hold the funtions related to appointment page
 */


function fnOpenNormalDialog(selectObj) {
    $("#dialog-confirm").html("Need to Create the Pateint record. Before taking any appointment");

    // Define the Dialog and its properties.
    $("#dialog-confirm").dialog({
        resizable: false,
        modal: true,
        title: "Modal",
        height: 250,
        width: 400,
        buttons: {
            "Yes": function () {
                $(this).dialog('close');
                callback(true);
            },
                "No": function () {
                $(this).dialog('close');
                $(selectObj).prop('checked', false);
                //callback(false);
            }
        }
    });
}

function callback(value) {
    if (value) {
    	var formObj = $(document.createElement('form'));
		formObj.attr("method", "post");
        formObj.attr("action", "/DoctorsOnline/pages/doctor/createUser.jsp");
        formObj.submit();
    }
}

var dateTimeOptions = {
		dayOfWeekStart : 1,
		lang:'en',
		disabledDates:['1986/01/08','1986/01/09','1986/01/10'],
		startDate:	$.datepicker.formatDate('yy/mm/dd', new Date()),
		minDate: 0,
		step:15,
		allowTimes:timingsList,
		weekends:['2016/01/09'],
		closeOnDateSelect:false,
		//closeOnWithoutClick:false,
		format:'Y-m-d H:i',
		onSelectDate:function(ct,$i){
			var dt = new Date(ct);
			var selectedDate = dt.getFullYear() + '-' + (dt.getMonth() + 1) + '-' + dt.getDate();
			var response = getTimings(selectedDate);
			dateTimeOptions.allowTimes = response.split(',');
			$('#appSlot').datetimepicker(dateTimeOptions);
		},
		onClose:function(ct,$i){
			var dateObj = new Date(ct);
			if($('#appSlot').val() != '' && dateObj.getHours() == 0 && dateObj.getMinutes() == 0){
				//$('#appSlot').val('');
				return false;
			}
			
		},
		onShow:function(ct,$i){
			
			if(configObj.TIMINGS_ON_DOCTORS){
				if($('#physician').val() == ''){
					alert('Please select physician first.');
					return false;
				}
			}				
		}
			
};

$('#appSlot').datetimepicker(dateTimeOptions);
	//$('#appSlot').datetimepicker({value:'2015/04/15 05:03',step:10});

function getTimings(selectedDate){
	var timings = null;
	var paramMap = new Map();
	
	if(selectedDate){
		paramMap.put(SELECTED_DATE, selectedDate);
	}
	paramMap.put(ACTION, "getTimings");
	
	timings = doAjaxCall(paramMap);
	return timings;
}
	
function updateAppnSlots(ui){
	if(configObj.TIMINGS_ON_DOCTORS){
			
		var dt = new Date();
		var selectedDate = dt.getFullYear() + '-' + (dt.getMonth() + 1) + '-' + dt.getDate();
		var response = getTimings(selectedDate);
		dateTimeOptions.allowTimes = response.split(',');
		$('#appSlot').datetimepicker(dateTimeOptions);
		$('#appSlot').val('');
		//$('#appSlot').focus();
		/*if($('#appSlot').val('') != ''){
			$('#appSlot').datetimepicker('show');
		}*/		
	}
}
	