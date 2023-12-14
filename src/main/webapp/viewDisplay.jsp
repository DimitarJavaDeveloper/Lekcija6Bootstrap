<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Responsive Data from Database</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="row">
            <table class="table table-bordered table-responsive table-striped">
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Title</th>
                        <th>Trainer</th>
                        <th>Image URL</th>
                        <th>Fees</th>
                        <th>Course Description</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    String course_id = request.getParameter("id");
                    if (course_id != null && !course_id.isEmpty()) {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_abhay", "root","");
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM courses WHERE Course_id = ?");
                            ps.setString(1, course_id);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                                <tr>
                                    <td> <%= rs.getInt(1) %> </td>
                                    <td> <%= rs.getString(2) %> </td>
                                    <td> <%= rs.getString(3) %> </td>
                                    <td> <%= rs.getString(4) %> </td>
                                    <td> <%= rs.getString(5) %> </td>
                                    <td> <%= rs.getString(6) %> </td>
                                </tr>
                    <%
                            }
                            con.close(); // Close the connection when done
                        } catch (SQLException ex) {
                            out.println("SQL Exception: " + ex);
                        } catch (ClassNotFoundException ex) {
                            out.println("Driver not found: " + ex);
                        }
                    } else {
                        out.println("No course ID provided.");
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!--Some JS Put here -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
</body>
</html>
