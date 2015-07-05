package com.org.doctorsonline.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.org.doctorsonline.model.User;
import com.org.doctorsonline.services.OnlineServices;

/**
 * Servlet implementation class userRegistration
 */
public class userRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private  final OnlineServices onlineServices = new OnlineServices();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		User user = new User();
		user.setFirstName(StringUtils.defaultString(request
				.getParameter("firstName")));
		user.setMiddleName(StringUtils.defaultString(request
				.getParameter("middleName")));
		user.setLastName(StringUtils.defaultString(request
				.getParameter("lastName")));
		user.setDob(StringUtils.defaultString(request.getParameter("dob")));
		user.setUid(StringUtils.defaultString(request.getParameter("uid")));
		user.setPhone(StringUtils.defaultString(request.getParameter("phone")));
		user.setAddress(StringUtils.defaultString(request
				.getParameter("address")));
		user.setAddress(StringUtils.defaultString(request
				.getParameter("gender")));
		user.setPinCode(StringUtils.defaultString(request
				.getParameter("pinCode")));
		
		boolean userCreated = onlineServices.saveUser(user);
		String msg=null;
		if (userCreated){
			msg = "User Created sucessfully";
		}else{
			msg = "User not created sucessfully";
		}
		
		response.sendRedirect(request.getContextPath()+"/pages/header/header.jsp?msg="+msg);

	}

}
