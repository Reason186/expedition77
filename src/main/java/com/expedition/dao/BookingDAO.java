package com.expedition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.expedition.utils.DBConfig;

public class BookingDAO {

    public void insertBooking(int customerId, String trekId, String trekName, Date trekDate, int groupSize, double totalPrice, String specialRequests) throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "INSERT INTO bookings (customer_id, trek_id, trek_name, trek_date, group_size, total_price, special_requests, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, customerId);
        pst.setString(2, trekId);
        pst.setString(3, trekName);
        pst.setDate(4, trekDate);
        pst.setInt(5, groupSize);
        pst.setDouble(6, totalPrice);
        pst.setString(7, specialRequests);
        pst.setString(8, "Pending");
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public List<Map<String, Object>> getBookingsByCustomerId(int customerId) throws Exception {
        List<Map<String, Object>> bookings = new ArrayList<>();
        Connection con = DBConfig.getConnection();
        String sql = "SELECT id, trek_name, status, trek_date, group_size FROM bookings WHERE customer_id = ? ORDER BY created_at DESC";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, customerId);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Map<String, Object> booking = new HashMap<>();
            booking.put("bookingId", String.valueOf(rs.getInt("id")));
            booking.put("trekName", rs.getString("trek_name"));
            booking.put("status", rs.getString("status"));
            booking.put("trekDate", rs.getDate("trek_date").toString());
            booking.put("groupSize", rs.getInt("group_size"));
            bookings.add(booking);
        }
        rs.close();
        pst.close();
        con.close();
        return bookings;
    }

    public void cancelBooking(int bookingId, int customerId) throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "UPDATE bookings SET status = 'Cancelled' WHERE id = ? AND customer_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, bookingId);
        pst.setInt(2, customerId);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public int getTotalBookingsCount() throws Exception {
        Connection con = DBConfig.getConnection();
        String sql = "SELECT COUNT(*) FROM bookings";
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

    public List<Map<String, Object>> getBookingsForGuide(int guideId) throws Exception {
        List<Map<String, Object>> list = new ArrayList<>();
        Connection con = DBConfig.getConnection();
        String sql = "SELECT b.id AS booking_id, b.trek_name, b.trek_date, b.group_size, b.total_price, b.status, b.created_at, " +
                     "u.name AS customer_name, u.email AS customer_email, u.phone_number AS customer_phone " +
                     "FROM bookings b " +
                     "JOIN custom_treks ct ON b.trek_id = CONCAT('custom_', ct.id) " +
                     "JOIN users u ON b.customer_id = u.id " +
                     "WHERE ct.guide_id = ? " +
                     "ORDER BY b.created_at DESC";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, guideId);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("bookingId", rs.getInt("booking_id"));
            map.put("trekName", rs.getString("trek_name"));
            map.put("trekDate", rs.getDate("trek_date").toString());
            map.put("groupSize", rs.getInt("group_size"));
            map.put("totalPrice", rs.getDouble("total_price"));
            map.put("status", rs.getString("status"));
            map.put("createdAt", rs.getTimestamp("created_at"));
            map.put("customerName", rs.getString("customer_name"));
            map.put("customerEmail", rs.getString("customer_email"));
            map.put("customerPhone", rs.getString("customer_phone"));
            list.add(map);
        }
        rs.close();
        pst.close();
        con.close();
        return list;
    }
}

