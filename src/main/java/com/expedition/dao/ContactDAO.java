package com.expedition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.expedition.utils.DBConfig;

public class ContactDAO {

    public void insertContactMessage(String name, String email, String subject, String message) throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, subject);
        pst.setString(4, message);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public List<Map<String, Object>> getRecentContactMessages(int limit) throws Exception {
        List<Map<String, Object>> list = new ArrayList<>();
        Connection con = DBConfig.getConnection();
        String sql = "SELECT name, email, message, created_at FROM contact_messages ORDER BY created_at DESC LIMIT ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, limit);
        ResultSet rs = pst.executeQuery();
        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("name", rs.getString("name"));
            map.put("email", rs.getString("email"));
            map.put("message", rs.getString("message"));
            Timestamp ts = rs.getTimestamp("created_at");
            map.put("date", sdf.format(ts));
            list.add(map);
        }
        rs.close();
        pst.close();
        con.close();
        return list;
    }

    public int getTotalQueriesCount() throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "SELECT COUNT(*) FROM contact_messages";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
        }
        rs.close();
        pst.close();
        con.close();
        return count;
    }
}
