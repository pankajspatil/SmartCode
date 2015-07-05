/**
 * 
 */
/**
 * This method is calling on change of search parameters.
 * Showing date picker if search by DOB is selected.
 * */

function searchKeySelect(selectObj){
	$("#searchValue").val('');
	if(selectObj.options[selectObj.selectedIndex].value == 3){
		var yrRange = '1900:'+ new Date().getFullYear();
		$( "#searchValue" ).datepicker({
		      changeMonth: true,
		      changeYear: true,
		      dateFormat : 'yy-mm-dd',
		      minDate: '1900-1-1',
		      maxDate: new Date(),
		      yearRange : yrRange,
		      onSelect: function(dateText, inst) {
		    	  $("#searchValue").attr('readonly', true);
		      }
		    });
	}else{
		$( "#searchValue" ).datepicker("destroy");
		$("#searchValue").attr('readonly', false);
	}
}

function openPage(oepration, userId){
	
	var formObj = $(document.createElement('form'));
	formObj.attr("method", "post");
	
	var userIdObj = $(document.createElement('input'));
	userIdObj.attr("type", "text");
	userIdObj.attr("value", userId);
	userIdObj.attr("name", "userId");
	
	formObj.append(userIdObj);
	
	switch (oepration) { 
    case 'edit': 
        alert('Edit called');
        break;
    case 'delete': 
        alert('Delete called');
        break;
    case 'vHistory': 
        alert('Visit History Called');
        break;      
    case 'vNew': 
        alert('New Button Called');
        formObj.attr("action", "/DoctorsOnline/pages/doctor/newVisit.jsp");
        formObj.submit();
        break;
    default:
        alert('Something went wrong!');
}
	
}