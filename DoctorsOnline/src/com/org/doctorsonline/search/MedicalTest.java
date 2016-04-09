package com.org.doctorsonline.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.generic.Constants;


public class MedicalTest {

	public LinkedHashMap<String, Object> getMedicalTest(){
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
				
		Connection conn = connectionsUtil.getConnection();
		String query = "SELECT * FROM citybazz_doctoronline.medical_test_master mtm,"
				+ "citybazz_doctoronline.medical_test mt "
				+ "where mtm.Medical_Test_Master_id=mt.Medical_Test_Master_id "
				+ "and mtm.is_active ='1' and mt.isactive='1'";
		
		LinkedHashMap<String, Object> returnMap = new LinkedHashMap<String, Object>();
		try{
		
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet dataRS = pst.executeQuery();
			
			LinkedHashMap<String, Object> medicalTestModel = null;
			ArrayList<String> medicalTest = null;
			String oldmedicalMasterLabel = "";
			while (dataRS.next()) {
				medicalTestModel = new LinkedHashMap<String, Object>();
				String medicalMasterLabel =  dataRS.getString("Medical_Test_Master_label");
				if (!oldmedicalMasterLabel.equalsIgnoreCase(medicalMasterLabel)){
					medicalTestModel.put(medicalMasterLabel,medicalTest);
					oldmedicalMasterLabel =medicalMasterLabel;
				}
				String medicalTestLabel =  dataRS.getString("Medical_Test_Master_label");
				
				
			}

				
			returnMap.put(Constants.RETURN_STATUS, 0);
			
		}catch(Exception ex){
			ex.printStackTrace();
			returnMap.put(Constants.RETURN_STATUS, 0);
		}
		
		return returnMap;

	}
}
