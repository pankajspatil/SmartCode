<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
			class="icon_required">*</b> Time</label> <select id="RESULT_RadioButton-12"
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
					<td><input type="radio" name="RESULT_RadioButton-13"
						class="multiple_choice" id="RESULT_RadioButton-13_0"
						value="Radio-0"><label for="RESULT_RadioButton-13_0">Dr.
							Anderson</label></td>
					<td><input type="radio" name="RESULT_RadioButton-13"
						class="multiple_choice" id="RESULT_RadioButton-13_1"
						value="Radio-1"><label for="RESULT_RadioButton-13_1">Dr.
							Jones</label></td>
					<td><input type="radio" name="RESULT_RadioButton-13"
						class="multiple_choice" id="RESULT_RadioButton-13_2"
						value="Radio-2"><label for="RESULT_RadioButton-13_2">Dr.
							Patel</label></td>
				</tr>
				<tr>
					<td><input type="radio" name="RESULT_RadioButton-13"
						class="multiple_choice" id="RESULT_RadioButton-13_3"
						value="Radio-3"><label for="RESULT_RadioButton-13_3">Dr.
							Smith</label></td>
					<td><input type="radio" name="RESULT_RadioButton-13"
						class="multiple_choice" id="RESULT_RadioButton-13_4"
						value="Radio-4"><label for="RESULT_RadioButton-13_4">no
							preference</label></td>
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
</body>
</html>