
function doAjaxCall(paramMap){
	
	var url = paramMap.get(URL) ? paramMap.get(URL) : '/DoctorsOnline/pages/generic/processAjaxCalls.jsp';
	var response = {};
	
	$.ajax({
		url: url,
		method : POST,
		async:false,
		data : 'paramMap=' + JSON.stringify(paramMap.entrySet()),
		success: function(result){
			console.log(paramMap.get(ACTION) + " result==> " + result);
			response = result;
		}
	});
	
	return response;
}