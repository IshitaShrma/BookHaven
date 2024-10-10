<jsp:useBean id="user"  scope="session"  class="obs.User"/>
<%@page import="java.sql.*"%>

<html>
<style>
a.topic {font:700 12pt verdana;color:#5C2FC2;}
td {font:12pt verdana}
th {font:700 12pt verdana;background-color:#a9e4e8;}
</style>

<body bgcolor=#FFFDB5>
<h1>Orders History </h1>

<div style="background-color:green}">

<table width="100%">

<tr align="center">
<td>
<a class="topic" href="ordershistory.jsp?type=a">All Orders </a>
<td>
<a class="topic" href="ordershistory.jsp?type=n">New Orders </a>
<td>
<a class="topic" href="ordershistory.jsp?type=p">Processed Orders</a>
<td>
<a class="topic" href="ordershistory.jsp?type=d">Dispatched Orders</a>
<td>
<a class="topic" href="ordershistory.jsp?type=c">Completed Orders </a>
</tr>
</table>
</div>

<%
  String type = request.getParameter("type");
  String  cmd = "select ordid, orddate, userid,totamt,status,isbn from orders where userid = " + user.getUserid();
   
  if ( type != null)
  {

  if ( type.equals("n"))
     cmd += " and status = 'n'";
  else
    if ( type.equals("p"))
      cmd += " and status = 'p'";
  else
    if ( type.equals("d"))
      cmd += " and status = 'd'";
    else
      if ( type.equals("c"))
         cmd +=  " and status = 'c'";
  }
  
  Connection con = user.getConnection();
  Statement st = con.createStatement();

  ResultSet rs = st.executeQuery(cmd);
%>

<p>
<table width="100%" cellpadding=2 border=1>
<tr>
<th> Order Id
<th> Order Date
<th> Total Amount
<th> Status
</tr>

<%
   while ( rs.next())
   {
%>

<tr>
<td> <a href="orderitems.jsp?ordid=<%=rs.getInt(1)%>&status=<%=rs.getString(5)%>"> <%=rs.getInt(1)%> </a>
<td> <%= rs.getString(2)%>
<td> <%= rs.getInt(3)%>
<td> <%= rs.getString(4)%>
</tr>

<%
  }
  rs.close();
  st.close();
  con.close();
%>
  
</table>
</body>
</html>