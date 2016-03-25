package com.org;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.org.doctorsonline.generic.Utils;
import com.org.doctorsonline.search.Search;

/**
 * Servlet implementation class loadApplication
 */
@WebServlet("/loadApplication")
public class loadApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public void init(ServletConfig servletConfig) throws ServletException{
		// TODO Auto-generated constructor stub
        Search  search = new Search();
		ResultSet dataRS = search.getAllPrescriptions();
		ConcurrentHashMap<String, String> prescription = new ConcurrentHashMap<String, String>() ;
		ServletContext context = servletConfig.getServletContext();
		
		try {
			while(dataRS.next()){
				prescription.put(dataRS.getString("medicine_id"),dataRS.getString("medicine_descrption"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}finally{
			
		}
		
		context.setAttribute("prescription", prescription);
		System.out.println("Loading Prescription data");
		
		Utils utils = new Utils();
		JSONObject configObj = utils.getConfig();
		context.setAttribute("config", configObj);
	  }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadApplication() {
        super();
                
    }
}
