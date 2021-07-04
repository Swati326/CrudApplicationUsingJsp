<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  background-image: url("lapy1.jpg");
  background-repeat:no-repeat;
  background-size:100%;
  padding: 0;
  margin: 0;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

 
li a {
  display: block;
  color: white;
  text-align: center;
  padding: 22px 19px;
  text-decoration: none;
  font-size:18px; 
}

li a:hover {
  background-color: #111;
}
ul li
{
height:63px;
}
</style>
</head>
<body>
<ul>
<li><img src="techhub.jfif" alt="hi" style="width:150px; height:63px;"></li>
<li><a href="AddNewStudent.jsp" >ADD NEW STUDENT</a></li>
<li><a href="ViewStudent.jsp" >VIEW STUDENTS</a></li>
<li><a href="searchstudent.jsp" >SEARCH STUDENT</a></li>
</ul>
</body>
</html>