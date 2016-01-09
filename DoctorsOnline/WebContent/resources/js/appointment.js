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

$('#appSlot').datetimepicker({
	dayOfWeekStart : 1,
	lang:'en',
	disabledDates:['1986/01/08','1986/01/09','1986/01/10'],
	startDate:	$.datepicker.formatDate('yy/mm/dd', new Date()),
	minDate: 0,
	step:15,
	allowTimes:['9.00'],
	weekends:['2016/01/09']
	});
	//$('#appSlot').datetimepicker({value:'2015/04/15 05:03',step:10});
	
	
	
	