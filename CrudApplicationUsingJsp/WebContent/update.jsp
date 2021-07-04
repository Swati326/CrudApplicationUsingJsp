<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<%!
String name,email,contact;
int id;
Connection conn;
PreparedStatement stmt;
ResultSet rs;
%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
div {
  background-color:black;
  width: 350px;
  border: 15px solid  #999999;
  padding: 50px;
  margin: 20px;
   border-radius: 25px;
   text-align: center;
}
.button{
 background-color:  #999999;
  border-radius: 25px;
    border: none;
 }
 .abc1{
 border-radius: 25px;
  text-align: center;
  }
 </style>
</head>
<body>
<%@ include file="master.jsp" %>
<%	
name=request.getParameter("n");
email=request.getParameter("e");
contact=request.getParameter("c");
id=Integer.parseInt(request.getParameter("id"));
%>
<center>
<br>
<br>
<br>
<div>
<form name="frm" action="finalupdate.jsp" method="POST">
<input type="hidden" name="id" value="<%=id%>" Placeholder="Enter your id" class="abc1" style="width:300px; height:30px;"/>
<br><br>
<input type="text" name="name" value="<%=name%>" Placeholder="Enter your name" class="abc1" style="width:300px; height:30px;"/>
<br><br>
<input type="text" name="email" value="<%=email%>" Placeholder="Enter your email" class="abc1" style="width:300px; height:30px;"/>
<br><br>
<input type="text" name="contact" value="<%=contact%>" Placeholder="Enter your contact" class="abc1" style="width:300px; height:30px;"/>
<br><br>
<input type="submit" name="s" value="Update Student" class="button" style="width:300px; height:30px;"/>
</form>
</div>
</center>
</body>
</html>