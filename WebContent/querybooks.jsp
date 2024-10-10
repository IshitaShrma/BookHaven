<html>

<style>
h2{margin: 1em 0 0.5em 0;text-shadow: 0 2px white, 0 3px #777;font-size: 36px;text-transform: uppercase;color:#5C2FC2;text-align:center;}
h4 {color:brwon;font:700 11pt verdana}
td {font:700 12pt verdana}
a {font:700 12pt verdana;color:#5C2FC2;}
table{border-spacing:10px;}
input{
  border: 2px solid #510c91; color: #510c91;
  border-radius: 8px;
  line-height: 1.8;
}
input[type="submit"]{
background-color:#5C2FC2;
color:white;
width:150px;
font-size:14pt;
padding:4px;
}
</style>

<body bgcolor=#FFFDB5>

<h2>Query Books</h2><a href="gohome.jsp">Home </a>
<form action="querybooks.jsp" method="post" >
<table>
<tr>
<td>
Category 
<select name="cat">
<option value="all">All Categories
<option value="ora">Oracle
<option value=".net">.NET 
<option value="java">Java 
</select> &nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td>
Title Contains 
<input type=text name=title size=20>
</td>
</tr>

<tr>
<td>
Author Name Contains
<input type=text size=20 name=author>
</td>
<td>
Price From
<input type=text name=fromprice size=10>
</td>
<td>
To
<input type=text name=toprice size=10>
</td>
</tr>
</table>
<p>
<input type=submit value="Query">
</p>
</form>

<%
 String cat = request.getParameter("cat");
 if ( cat == null)
  return;

 String cond = "1=1";

 if (!cat.equals("all") )
     cond = cond + " and cat = '" + cat + "'";

 String title = request.getParameter("title");

 if ( !title.equals(""))
    cond = cond + " and title like '%" + title + "%'";


 String author = request.getParameter("author");

 if ( !author.equals(""))
    cond = cond + " and author like '%" + author + "%'";


 String fromprice = request.getParameter("fromprice");

 if ( !fromprice.equals(""))
    cond = cond + " and price >= " + fromprice;

 String toprice = request.getParameter("toprice");

 if ( !toprice.equals(""))
    cond = cond + " and price <= " + toprice;

 request.setAttribute("cond", cond);

%>
 
<jsp:include  page="listbooks.jsp" flush="true"/>

</body>
</html>   