package com.expedition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.expedition.utils.DBConfig;


public class UserDAO {

	public void insertUser(String name, String email, String password, String phone_number) throws Exception {
	
	Connection con = DBConfig.getConnection();
	
	String sql = "INSERT INTO users (name, email, password, phone_number, is_verified)"
	 + "VALUES (?,?, ?, ?, ?)";
	
	PreparedStatement pst = con.prepareStatement(sql);
	pst.setString(1, name);
	pst.setString(2, email);
	pst.setString(3, password);
	pst.setString(4, phone_number);
	pst.setBoolean(5, false);
	
	pst.executeUpdate();
	pst.close();
	con.close();
	}
	
	public String getPassword(String email) throws Exception {
		
		Connection con = DBConfig.getConnection();
		
		String sql = "SELECT password FROM users WHERE email = ?";
		
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, email);
		
		ResultSet rs = pst.executeQuery();
		
		String password = null;
		
		if (rs.next()) {
			password = rs.getString("password");
		}
		
		rs.close();
	    pst.close();
	    con.close();

	    return password;
	}
	
		public String getVerificationStatus(String email) throws Exception {
		
		Connection con = DBConfig.getConnection();
		
		String sql = "SELECT is_verified FROM users WHERE email = ?";
		
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, email);
		
		ResultSet rs = pst.executeQuery();
		
		String isVerified = null;
		
		if (rs.next()) {
			isVerified = rs.getString("password");
		}
		
		rs.close();
	    pst.close();
	    con.close();

	    return isVerified;
	}
}