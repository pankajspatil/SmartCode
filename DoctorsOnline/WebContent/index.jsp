

<!DOCTYPE HTML>
<html>
	<head>
		<title>Doctor's Online</title>
		<link href="<%=request.getContextPath() %>/resources/css/template.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="/DoctorsOnline/resources/css/responsiveslides.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/responsiveslides.min.js"></script>
		  <script>
		    //// You can also use "$(window).load(function() {"
			    //$(function () {
			
			      //// Slideshow 1
			      //$("#slider1").responsiveSlides({
			        //maxwidth: 1600,
			        //speed: 600
			      //});
			//});
		  //</script>
	</head>
	<body>
		<!--start-wrap-->
		
			<!--start-header-->
			<div class="header">
				<div class="wrap">
				<!--start-logo-->
				<div class="logo">
					<a href="index.html"><img src="<%=request.getContextPath() %>/resources/images/logoNew.png" title="logo" /></a>
				</div>
				<!--end-logo-->
				<!--start-top-nav-->
				<div class="top-nav">
					<%@ include file="/pages/header/commonMenu.jsp"%>						
				</div>
				<div class="clear"> </div>
				<!--end-top-nav-->
			</div>
			<!--end-header-->
		</div>
		<div class="clear"> </div>
			<!--start-image-slider---->
					<div class="image-slider">
						<!-- Slideshow 1 -->
					   <!-- <ul class="rslides" id="slider1">
					      <li><img src="./images/slider-image1.jpg" alt=""></li>
					      <li><img src="./images/slider-image2.jpg" alt=""></li>
					      <li><img src="./images/slider-image1.jpg" alt=""></li>
					    </ul>-->
						 <!-- Slideshow 2 -->
					</div>
					<!--End-image-slider---->
		    <div class="clear"> </div>
		    <div class="content-grids">
		    	<div class="wrap">
		    	<div class="section group">
				<div class="listview_1_of_3 images_1_of_3">
					<div class="listimg listimg_1_of_2">
						  <img src="/DoctorsOnline/resources/images/grid-img1.png">
					</div>
					<div class="text list_1_of_2">
						  <a href="/DoctorsOnline/pages/login/login.jsp"><h3>Doctors Login</h3></a>
						  <p>Need More info?</p>
						  <div class="button"><span><a href="#">View More</a></span></div>
					</div>
				</div>				
				<div class="listview_1_of_3 images_1_of_3">
					<div class="listimg listimg_1_of_2">
						  <img src="/DoctorsOnline/resources/images/grid-img2.png">
					</div>
					<div class="text list_1_of_2">
						  <h3>Our Client Care</h3>
						  <p>Need More info?</p>
						  <div class="button"><span><a href="#">View More</a></span></div>
				     </div>
				</div>				
				<div class="listview_1_of_3 images_1_of_3">
					<div class="listimg listimg_1_of_2">
						  <img src="/DoctorsOnline/resources/images/grid-img3.png">
					</div>
					<div class="text list_1_of_2">
						  <h3>Join Us Now</h3>
						  <p>Need More info?</p>
						  <div class="button"><span><a href="#">View More</a></span></div>
				    </div>
				</div>				
			</div>
		    </div>
		   </div>
		   <div class="wrap">
		   <div class="content-box">
		   <div class="section group">
				<div class="col_1_of_3 span_1_of_3 frist">
					<h3>Dedicated Staff</h3>
					<img src="/DoctorsOnline/resources/images/box-img1.jpg" title="staff" />
					<span>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</span>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
					<a href="#">Readmore</a>
				</div>
				<div class="col_1_of_3 span_1_of_3 second">
					<h3>Candidates</h3>
					<span>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</span>
					<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor pariatur.</p>
					<ul>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Primary Care Directory</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Medical Fee Waiving Mechanism</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Health Care Voucher</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">reprehenderit in voluptate</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">laboris nisi ut aliquip ex ean</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">aboris nisi ut aliquip</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Duis aute irure dolor </a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">adipisicing elit, sed do</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Ut enim ad minim veniam</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Primary Care Directory</a></li>
						<li><a href="#"><img src="/DoctorsOnline/resources/images/arrow.png">Medical Fee Waiving Mechanism</a></li>
					</ul>
				</div>
				<div class="col_1_of_3 span_1_of_3 frist">
					<h3>Quality Service</h3>
					<img src="/DoctorsOnline/resources/images/box-img2.jpg" title="staff" />
					<span>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</span>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
					<a href="#">Readmore</a>
				</div>
			</div>
		   </div>
		   </div>
		   <div class="clear"> </div>
		   <div class="footer">
		   	 <div class="wrap">
		   	<div class="footer-left">
		   			<%@ include file="/pages/header/commonMenu.jsp"%>
		   	</div>
		   	<div class="footer-right">
		   		<p>Online Doctor | Design By Fortune four</p>
		   	</div>
		   	<div class="clear"> </div>
		   </div>
		   </div>
		<!--end-wrap-->
	</body>
</html>

