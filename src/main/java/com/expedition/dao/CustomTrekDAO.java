package com.expedition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.expedition.utils.DBConfig;

public class CustomTrekDAO {

    public void insertCustomTrek(int guideId, String guideName, String name, int duration, String difficulty, int maxAltitude, int price, String shortDesc, String longDesc, String groupSize, String image1, String image2, String image3) throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "INSERT INTO custom_treks (guide_id, guide_name, name, duration, difficulty, max_altitude, price, short_description, long_description, group_size, image, image2, image3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, guideId);
        pst.setString(2, guideName);
        pst.setString(3, name);
        pst.setInt(4, duration);
        pst.setString(5, difficulty);
        pst.setInt(6, maxAltitude);
        pst.setInt(7, price);
        pst.setString(8, shortDesc);
        pst.setString(9, longDesc);
        pst.setString(10, groupSize);
        pst.setString(11, image1);
        pst.setString(12, image2);
        pst.setString(13, image3);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public List<Map<String, Object>> getCustomTreksByGuideId(int guideId) throws Exception {
        List<Map<String, Object>> list = new ArrayList<>();
        Connection con = DBConfig.getConnection();
        String sql = "SELECT * FROM custom_treks WHERE guide_id = ? ORDER BY created_at DESC";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, guideId);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", rs.getInt("id"));
            map.put("guide_id", rs.getInt("guide_id"));
            map.put("guide_name", rs.getString("guide_name"));
            map.put("name", rs.getString("name"));
            map.put("duration", rs.getInt("duration"));
            map.put("difficulty", rs.getString("difficulty"));
            map.put("max_altitude", rs.getInt("max_altitude"));
            map.put("price", rs.getInt("price"));
            map.put("image", rs.getString("image"));
            map.put("image2", rs.getString("image2"));
            map.put("image3", rs.getString("image3"));
            map.put("short_description", rs.getString("short_description"));
            map.put("long_description", rs.getString("long_description"));
            map.put("group_size", rs.getString("group_size"));
            map.put("created_at", rs.getTimestamp("created_at"));
            list.add(map);
        }
        rs.close();
        pst.close();
        con.close();
        return list;
    }

    public List<Map<String, Object>> getAllCustomTreks() throws Exception {
        List<Map<String, Object>> list = new ArrayList<>();
        Connection con = DBConfig.getConnection();
        String sql = "SELECT * FROM custom_treks ORDER BY created_at DESC";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", rs.getInt("id"));
            map.put("guide_id", rs.getInt("guide_id"));
            map.put("guide_name", rs.getString("guide_name"));
            map.put("name", rs.getString("name"));
            map.put("duration", rs.getInt("duration"));
            map.put("difficulty", rs.getString("difficulty"));
            map.put("max_altitude", rs.getInt("max_altitude"));
            map.put("price", rs.getInt("price"));
            map.put("image", rs.getString("image"));
            map.put("image2", rs.getString("image2"));
            map.put("image3", rs.getString("image3"));
            map.put("short_description", rs.getString("short_description"));
            map.put("long_description", rs.getString("long_description"));
            map.put("group_size", rs.getString("group_size"));
            map.put("created_at", rs.getTimestamp("created_at"));
            list.add(map);
        }
        rs.close();
        pst.close();
        con.close();
        return list;
    }

    public Map<String, Object> getCustomTrekById(int id) throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "SELECT * FROM custom_treks WHERE id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        Map<String, Object> map = null;
        if (rs.next()) {
            map = new HashMap<>();
            map.put("id", rs.getInt("id"));
            map.put("guide_id", rs.getInt("guide_id"));
            map.put("guide_name", rs.getString("guide_name"));
            map.put("name", rs.getString("name"));
            map.put("duration", rs.getInt("duration"));
            map.put("difficulty", rs.getString("difficulty"));
            map.put("max_altitude", rs.getInt("max_altitude"));
            map.put("price", rs.getInt("price"));
            map.put("image", rs.getString("image"));
            map.put("image2", rs.getString("image2"));
            map.put("image3", rs.getString("image3"));
            map.put("short_description", rs.getString("short_description"));
            map.put("long_description", rs.getString("long_description"));
            map.put("group_size", rs.getString("group_size"));
            map.put("created_at", rs.getTimestamp("created_at"));
        }
        rs.close();
        pst.close();
        con.close();
        return map;
    }
}
