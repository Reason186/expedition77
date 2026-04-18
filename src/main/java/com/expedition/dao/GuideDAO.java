package com.expedition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.expedition.model.Guide;
import com.expedition.utils.DBConfig;

public class GuideDAO {

	public List<Guide> getAllGuides() throws Exception {

		Connection con = DBConfig.getConnection();

		String sql = "SELECT * FROM guides";

		PreparedStatement pst = con.prepareStatement(sql);

		ResultSet rs = pst.executeQuery();

		List<Guide> guideList = new ArrayList<Guide>();

		while (rs.next()) {
			Guide guide = new Guide();
			guide.setId(rs.getInt("id"));
			guide.setName(rs.getString("name"));
			guide.setSpecialty(rs.getString("specialty"));
			guide.setBio(rs.getString("bio"));
			guide.setExperienceYears(rs.getInt("experience_years"));
			guide.setTreksCompleted(rs.getInt("treks_completed"));
			guide.setRating(rs.getDouble("rating"));
			guide.setReviewCount(rs.getInt("review_count"));
			guide.setPhotoUrl(rs.getString("photo_url"));
			guideList.add(guide);
		}

		rs.close();
		pst.close();
		con.close();

		return guideList;
	}

	public void insertGuide(String name, String email, String password, String phone, String specialty, String bio, int experience) throws Exception {

		Connection con = DBConfig.getConnection();

		String userSql = "INSERT INTO users (name, email, password, phone_number, is_verified, role) VALUES (?, ?, ?, ?, ?, ?)";

		PreparedStatement pst1 = con.prepareStatement(userSql);
		pst1.setString(1, name);
		pst1.setString(2, email);
		pst1.setString(3, password);
		pst1.setString(4, phone);
		pst1.setBoolean(5, false);
		pst1.setString(6, "guide");
		pst1.executeUpdate();
		pst1.close();

		String guideSql = "INSERT INTO guides (name, specialty, bio, experience_years, treks_completed, rating, review_count, photo_url) VALUES (?, ?, ?, ?, 0, 0.0, 0, ?)";

		PreparedStatement pst2 = con.prepareStatement(guideSql);
		pst2.setString(1, name);
		pst2.setString(2, specialty);
		pst2.setString(3, bio);
		pst2.setInt(4, experience);
		String photoUrl = "https://ui-avatars.com/api/?name=" + name.replace(" ", "+") + "&background=2398A1&color=fff&size=200";
		pst2.setString(5, photoUrl);
		pst2.executeUpdate();
		pst2.close();

		con.close();
	}
}
