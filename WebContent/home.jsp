<jsp:useBean id="user" scope="session"  class="obs.User" />
<jsp:useBean id="cart" scope="session"  class="obs.Cart" />

<%@ page import="java.util.*"%>

<style>
td {font:15pt verdana}
th {font:700 10pt verdana}
h2 {font:700 16pt arial}
a {font:700 10pt verdana;color:#5C2FC2;}
input {background-color:#5C2FC2; color:white; width:100px; font-size:10pt; padding:6px;}
</style>
<% 

%>

<html>
<body bgcolor=#FFFDB5>

<table border=1 width=100%>
<tr style="font:700 11pt verdana; background-color:#510c91; color:white">
<td style="padding: 4px;">
Welcome <b><jsp:getProperty name="user" property="uname"/> </b> 
</td>
</tr>

<tr style="font:10pt verdana;" align="center">
<td>
<h2 style="margin: 1em 0 0.5em 0;text-shadow: 0 2px white, 0 3px #777;font-size: 36px;text-transform: uppercase;">Shopping Cart </h2>
<form action="home.jsp" method="get">
<table width=100%>
<tr>
<td>
<table border = 2 style="background-color:#a9e4e8; border-color:#5C2FC2; border-collapse:collapse; width:100%;">  
<tr>
<th>Book Title
<th>Price
<th>Quantity
<th>Amount
<th>&nbsp;
</tr>

<%
 obs.Item item;
 ArrayList items = cart.getItems();
 Iterator  itr = items.iterator();
 int total = 0;
 while (  itr.hasNext()) {
    item = (obs.Item) itr.next();
    total += item.getQty() * item.getPrice();
%>

<tr>
<td> <input type=hidden value=<%=item.getIsbn()%> name=isbn>
<%= item.getTitle()%>
<td align="right"><%= item.getPrice()%>
<td align="center"><input type=text name=qty  size=5 value=<%=item.getQty()%>>
<td align="right"><%=item.getQty() * item.getPrice()%>
<td align="center"><a href=home.jsp?act=remove&isbn=<%=item.getIsbn()%>>Remove</a>
</tr>

<%
 }
 String act = request.getParameter("act");
	
 if ( act != null )
 {
  if( act.equals("Finalize Order"))
  {
    boolean orderid;
    String isb[] = (String []) request.getParameterValues("isbn");
   	
     orderid =  cart.finalizeOrder(user.getUserid(),total );
     if ( orderid == false)
     {
    	 //out.println(item.getIsbn());
   	  out.println("Sorry! Order Cannot be finalized.");
        return;
     }
     else
     {
        out.println("Order Has Been Finalized. Order id : " + orderid );
        //out.println(isb);
        out.println("<a href=home.jsp>Continue...</a>");
        cart.clearAll();
        return;
     }
  }   

  if ( act.equals("remove"))
  {
   cart.removeItem( request.getParameter("isbn"));
  }
  else 
   if ( act.equals("Update Cart"))
   {
 
     String isbn[] = (String []) request.getParameterValues("isbn");
     String qty[] = (String []) request.getParameterValues("qty");

     for (int i = 0 ;i < isbn.length ;i ++)
        cart.updateQty(isbn[i], Integer.parseInt( qty[i]));

   }
   else
    if ( act.equals("Clear Cart"))
         cart.clearAll();
  } // end of outer if
%>

<tr>
<td colspan=5 style="text-align:center;font:700 12pt verdana;color:navy">
Total Amount : <%=total%>
</tr>
</table>
</td>
</tr>
<tr>
<td> 
<input type=submit value="Update Cart"  name="act">&nbsp;&nbsp;&nbsp;&nbsp;
<input type=submit value="Clear Cart"  name="act">&nbsp;&nbsp;&nbsp;&nbsp;
<input type=submit value="Finalize Order"  name="act">
</td>
</tr>
</table>
</form>
  
</td>
</tr>

<tr>
<td>
[<a href="changeprofile.jsp">Change User Details</a>] &nbsp;&nbsp;
[<a href="browsebooks.jsp">Browse Books</a>] &nbsp;&nbsp;
[<a href="querybooks.jsp">Query Books</a>] &nbsp;&nbsp;
[<a href="ordershistory.jsp">Orders History</a>] &nbsp;&nbsp;
[<a href=logout.jsp> Logout </a>]
</td>
</tr>

</table>

</body>
</html>
