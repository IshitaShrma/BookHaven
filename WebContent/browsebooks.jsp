<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<style>
h2{margin: 1em 0 0.5em 0;text-shadow: 0 2px white, 0 3px #777;font-size: 36px;text-transform: uppercase;color:#5C2FC2;}
h4 {color:brwon;font:700 11pt verdana}
td {font:10pt verdana}
a{font:700 12pt verdana;color:#5C2FC2;}
input {background-color:#5C2FC2; color:white; width:100px; font-size:10pt; padding:6px;}
form{font:12pt verdana; }
</style>

<body bgcolor=#FFFDB5>

<h2 align="center">Browse Available Books</h2>

<form action="browsebooks.jsp" method="post" >
<a href="gohome.jsp">Home </a> &nbsp;&nbsp; <a href="querybooks.jsp">Query Books </a> &nbsp;&nbsp;
Select Category :
<select name="cat">
<option value="all">All Categories
<option value="ora">Oracle
<option value=".net">.NET 
<option value="java">Java 
</select>&nbsp;&nbsp;
<input type=submit value="Browse"> 
</form>

<%
 String cat = request.getParameter("cat");
 if ( cat == null)
    request.setAttribute("cond","1=1");
else
  if (!cat.equals("all") )
   request.setAttribute("cond", "cat='" + cat + "'");

%>
 
<jsp:include  page="listbooks.jsp" flush="true"/>


</body>
</html>   