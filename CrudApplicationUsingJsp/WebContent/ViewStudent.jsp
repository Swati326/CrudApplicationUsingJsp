<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table, td, th {
  border: 1px solid black;
   padding-bottom:20px;
}
tr{
 background-color:white;
  padding-bottom:20px;
}
table {
  border-collapse: collapse;
  width: 100%;
  background-color:red;
  padding-bottom:20px;
}

th {
  height: 30px;
  color:white;
   background-color:black;
    padding-bottom:20px;
}
}
</style>
</head>
<body>
<%
String name,email,contact;
Connection conn;
PreparedStatement stmt;
ResultSet rs;
%>

<%@include file="master.jsp" %>

<br>
<br>
<%
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspmini","root","swati");
		if(conn!=null)
		{
			stmt=conn.prepareStatement("select *from register");
			rs=stmt.executeQuery();
			%>
				<table border="2">
				<tr><th>Name</th><th>Email</th><th>Contact</th><th>Delete</th><th>Update</th></tr>
			<%
			while(rs.next())
			{
				int id=rs.getInt(1);
				 name=rs.getString("name");
				 email=rs.getString("email");
				 contact=rs.getString("contact");
				%>
					<tr>
						<td><center><%=name%></center></td>
						<td><center><%=email %></center></td>
						<td><center><%=contact %></center></td>
						<td><center><a href="delete.jsp?id=<%=id%>">Delete</a></center></td>
						<td><center><a href="update.jsp?n=<%=name%>&e=<%=email%>&c=<%=contact%>&id=<%=id%>">Update</a></center></td>
					</tr>
					
					
				<%
			}
			
		}
		else
		{
			out.println("Not connected..");
		}
	}
	catch(Exception ex)
	{
		
	}
%>
</table>
</body>
</html>