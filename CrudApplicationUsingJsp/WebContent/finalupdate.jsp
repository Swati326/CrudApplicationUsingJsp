<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%!
    Connection conn;
    PreparedStatement stmt;
    ResultSet rs;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try{
	int id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String contact=request.getParameter("contact");
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspmini","root","swati");
	if(conn!=null)
	{
		stmt=conn.prepareStatement("update register set name=?,email=?,contact=? where id=?");
		stmt.setString(1,name);
		stmt.setString(2,email);
		stmt.setString(3,contact);
		stmt.setInt(4,id);
		int value=stmt.executeUpdate();
		if(value>0)
		{
			response.sendRedirect("ViewStudent.jsp");
		}
		else{
			out.println("<h1>Some problem is there </h1>");
		}
	}
	else{
		out.println("database not connected");
	}
}
catch(Exception ex)
{
	out.println("Error is:"+ex);
}
%>
</body>
</html>