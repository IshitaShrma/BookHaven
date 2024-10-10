<%--
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("userid"); 
session.putValue("userid",user); 
String pwd=request.getParameter("pwd"); 
String fname=request.getParameter("fname"); 
String lname=request.getParameter("lname"); 
String email=request.getParameter("email"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","4321"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into users values ('"+user+"','"+pwd+"','"+fname+"',	'"+lname+"','"+email+"')"); 
out.println("Registered"); 
%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>
 --%>
 
<html>
<style>
h3 {font:700 12pt verdana;color:maroon}
a  {font:12pt verdana;color:navy}
</style>
<body bgcolor="wheat">
<jsp:useBean id="user" class="obs.User" scope="session" />
<jsp:setProperty  name="user" property="*" />
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String uname = request.getParameter("uname");
String pwd=request.getParameter("pwd"); 
String email=request.getParameter("email"); 
String address=request.getParameter("address"); 
String phone=request.getParameter("phone"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","4321"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into users(uname,pwd,email,address,phone) values ('"+uname+"','"+pwd+"','"+email+"','"+address+"','"+phone+"')");
out.println("Registered"); 
String result = user.registerUser();

if (result != null) 
     response.sendRedirect("home.jsp"); 
if(result == null)
     out.println("<h3>Sorry! Registration Failed With Error : <p> " + result + "</h3> <p> <a href=Reg.html>Try Again </a> ");
%>
</body>
</html>
     
    
   
 
