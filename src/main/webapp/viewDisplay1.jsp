<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Responsive Data into Database</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="row">
            <table class="table table-bordered table-responsive table-striped">
                <thead>
                    <tr>
                        <th>Course Id</th>
                        <th>Course Title</th>
                        <th>Trainer</th>
                        <th>Image URL</th>
                        <th>Fees</th>
                        <th>Course Description</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_abhay", "jugo", "1234");
                            ps = con.prepareStatement("SELECT * FROM courses");
                            rs = ps.executeQuery();

                            while (rs.next()) {
                    %>
                                <tr>
                                    <td><%= rs.getInt(1) %></td>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td><%= rs.getString(6) %></td>
                                </tr>
                    <%
                            }
                        } catch (Exception ex) {
                            out.println("Error here:" + ex);
                        } finally {
                            // Close resources in the finally block
                            try {
                                if (rs != null) rs.close();
                                if (ps != null) ps.close();
                                if (con != null) con.close();
                            } catch (SQLException ex) {
                                out.println("Error closing resources: " + ex.getMessage());
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Include Bootstrap and jQuery JS -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
