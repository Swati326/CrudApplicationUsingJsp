<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%!
int id;
Connection conn;
PreparedStatement stmt;
ResultSet rs;
%>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspmini","root","swati");
	if(conn!=null)
	{
		stmt=conn.prepareStatement("delete from register where id=?");
		stmt.setInt(1,id);
		int value=stmt.executeUpdate();
		if(value>0)
		{
			response.sendRedirect("ViewStudent.jsp");
		}
		else
		{
			out.println("<h1>some problem is there</h1>");
		}
	}
	else
	{
		out.println("<h1>Database is not connected</h1>");
	}
}
catch(Exception ex)
{
	out.println("Error is "+ex);
}
%>
</body>
</html>