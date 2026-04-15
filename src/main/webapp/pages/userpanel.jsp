<%@ page import="java.sql.*" %>
<%
    String name = "";
    String email = "";
    String phone = "";
    String role = "";
    String status = "";

    // assuming user email stored in session after login
    String sessionEmail = (String) session.getAttribute("email");

    if(sessionEmail == null){
        response.sendRedirect("login.jsp");
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expedetion_77","root","");

        ps = conn.prepareStatement("SELECT * FROM users WHERE email=?");
        ps.setString(1, sessionEmail);
        rs = ps.executeQuery();

        if(rs.next()){
            name = rs.getString("name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            role = rs.getString("role");
            status = rs.getString("status");
        }

    } catch(Exception e){
        out.println(e);
    } finally{
        try{
            if(conn!=null) conn.close();
        } catch(Exception e){}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Panel | Expedition 77</title>
    <link rel="stylesheet" type="text/css" href="userpanel.css">
</head>
<body>

<div class="overlay">

    <div class="navbar">
        <h2>Expedition 77</h2>
        <a href="logout.jsp" class="logout">Logout</a>
    </div>

    <div class="container">

        <div class="profile-card">
            <h3>Welcome, <%=name %></h3>
            <p><strong>Email:</strong> <%=email %></p>
            <p><strong>Phone:</strong> <%=phone %></p>
            <p><strong>Role:</strong> <%=role %></p>
            <p><strong>Status:</strong> <%=status %></p>
        </div>

        <div class="actions">

            <div class="card">
                <h3>Book a Guide</h3>
                <p>Explore available trekking routes and guides.</p>
                <a href="booking.jsp">Explore</a>
            </div>

            <div class="card">
                <h3>My Bookings</h3>
                <p>View your booking history and status.</p>
                <a href="mybookings.jsp">View</a>
            </div>

            <div class="card">
                <h3>Edit Profile</h3>
                <p>Update your personal information.</p>
                <a href="editprofile.jsp">Update</a>
            </div>

        </div>

    </div>

</div>

</body>
</html>