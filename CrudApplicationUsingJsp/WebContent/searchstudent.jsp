<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.button{
 background-color: white;
  border-radius: 25px;
   text-align:center;
    border-color:black;
    border-style:solid;
    }
    .button1{
     background-color: #999999;
   text-align:center;
    border-style:solid;
    }
    
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
td{
 text-align:center;
 }
 h1 center{
 color:red;}
</style>
</head>
<%!String name; 
Connection conn;
PreparedStatement stmt;
ResultSet rs;
%>
<body>
<%@include file="master.jsp" %>
<center>
<br>
<br>
<form name="frm" action="" method="POST">
<input type="text" name="name" value="" Placeholder="Search Student" class="button" style="width:500px; height:40px;"/>
<br>
<br>

<input type="submit" name="s" value="click to search" class="button1" style="width:200px; height:30px;" />
</form>
<br>
<br>
</center>
<%
String btn=request.getParameter("s");
if(btn!=null)
{
	String name=request.getParameter("name");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspmini","root","swati");
		if(conn!=null)
		{
		stmt=conn.prepareStatement("select *from register where name=?");
		stmt.setString(1,name);
		ResultSet rs=stmt.executeQuery();	
		if(rs.next())
		{
			
			int id=rs.getInt(1);
			%>
			<table>
		<th>Name</th><th>Email</th><th>Contact</th><th>Delete</th><th>Update</th>
			<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><center><a href="delete.jsp?id=<%=id%>">Delete</a></center></td>
			<td><center><a href="update.jsp?n=<%rs.getString(2);%>&e=<%=rs.getString(3)%>&c=<%=rs.getString(4)%>&id=<%=id%>">Update</a></center></td>
			</tr>
			

		<%
		}
		else
		{
		%>
		<h1><center>Record Not Found!</center></h1>
		<%
	
	}
		}
	}
	catch(Exception ex)
	{
		
		out.println("error is: "+ex );
	}

}
%>
</table>
</body>
</html>