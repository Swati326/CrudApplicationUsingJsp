<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
div {
  background-color: black;
  width: 350px;
  border: 15px solid #999999;
  padding: 50px;
  margin: 20px;
 border-radius: 25px;
 text-align: center;
  box-shadow: 10px 10px 5px grey;
}
.button{
 background-color: #999999;
  border-radius: 25px;
    border: none;
}
.abc{
 border-radius: 25px;
  text-align: center;
}
</style>
</head>
<%!String name,email,contact; 
Connection conn;
PreparedStatement stmt;
ResultSet rs;
%>
<body>
<%@include file="master.jsp" %>
<center>
<br><br>
<div>
<form name="frm" action="" method="POST">
<input type="text" name="name" value="" Placeholder="Enter your name" class="abc" style="width:300px; height:30px;"/>
<br><br>
<input type="text" name="email" value="" Placeholder="Enter your email" class="abc" style="width:300px; height:30px;"/>
<br><br>
<input type="text" name="contact" value="" Placeholder="Enter your contact" class="abc" style="width:300px; height:30px;"/>
<br><br>
<input type="submit" name="s" value="Add New Student" style="width:300px; height:30px; " class="button"/>
</form>
</div>
</center>
<%
String btn=request.getParameter("s");
if(btn!=null)
{
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String contact=request.getParameter("contact");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspmini","root","swati");
		if(conn!=null)
		{
		stmt=conn.prepareStatement("insert into register values('0',?,?,?)");
		stmt.setString(1,name);
		stmt.setString(2,email);
		stmt.setString(3,contact);
		int value=stmt.executeUpdate();
		if(value>0)
		{
		response.sendRedirect("master.jsp");
		out.println("Record Save Successfully.....");
		}
		else
		{
		out.println("Record Not Save Successfully.....");
		}
	}
		else{
			out.println("Database is not connected.....");
		}
	}
	
	catch(Exception ex)
	{
		
		out.println("error is: "+ex );
	}
}
%>
</body>
</html>