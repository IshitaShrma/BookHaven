// Cart
package obs;
import java.util.*;
import java.sql.*;
import obs.*;
import javax.ejb.*;
import javax.naming.*;
import obs.order.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  




public class Cart
{
   ArrayList items = new ArrayList();
   
   public Item find(String isbn)
   {
     Iterator itr = items.iterator();
     Item itm;
     while ( itr.hasNext())
     {
       itm =  (Item) itr.next();
       if ( itm.getIsbn().equals(isbn))
       {
          return itm;
       }
     }  // end of while

     return null;
   }
   
   // adds an item if not already existing
  // otherwise add 1 to qty
   public void addItem(String isbn )
   {
     //check whether isbn is already present
     Item item =  find(isbn);
     if ( item != null)
       item.addQty(1);
     else
     {
       // get detais from Books tables
     
       Connection con =null;
       obs.User  user  = new obs.User();
       try
       {
        con = user.getConnection();
        PreparedStatement ps = con.prepareStatement("select title,price from books where isbn = ? ");
        ps.setString(1,isbn);

        ResultSet rs  = ps.executeQuery();
        if ( rs.next())
        {
          item = new Item(isbn, rs.getString(1), rs.getInt(2) );
          items.add(item);
        }

        rs.close();
        ps.close();

       }
       catch(Exception ex)
       {
         System.out.println(ex.getMessage());
       }
       finally
       {  
         try {con.close();} catch(Exception ex) {}
       }
     }  // end of else
   }       

   public  ArrayList  getItems()
   {  return items; }

   public  void removeItem(String isbn)
   {
       Item item = find(isbn);
       if  ( item != null)
           items.remove(item);
   } // end or removeItem

    public void clearAll()
    {
       items.clear();
   }

   public void updateQty(String isbn, int qty)
   {
        Item  item = find(isbn);
        if ( item != null)
          item.setQty(qty);
   } // end of updateQty()


  public boolean finalizeOrder(int userid,int total) 
  {
     
	  try {
			Scanner sc=new Scanner(System.in);
			
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/test";
			String user="root";
			String pass="4321";
			Connection con=DriverManager.getConnection(url,user,pass);
			String sql="INSERT INTO `orders` (`ordid`, `userid`, `orddate`, `totamt`, `status`, `isbn`) VALUES (NULL, '"+userid+"', '"+now+"', '"+total+"', 'a', '2')";
			Statement stmt=con.createStatement();
			stmt.executeUpdate(sql);
			con.close();
			System.out.println("Record inserted");
			
			return true;
			
		} catch(Exception ex)
	   	{
		     System.out.println( ex.getMessage());
		     return false;
		 
		   }

  } // end of  finalizeOrder



  public boolean cancelOrder(int ordid) 
  {
     
   try
   {
      Context ctx = getInitialContext();  
      // get access to bean

      OrderHome home = (OrderHome)  ctx.lookup("obs.order");
      Order order = home.create();

      return order.cancelOrder(ordid);
     
   }
   catch(Exception ex)
   {
     System.out.println( ex.getMessage());
     return false;
 
   }


  } // end of  finalizeOrder

  public Context getInitialContext() 
  {
  
  String JNDI_FACTORY="weblogic.jndi.WLInitialContextFactory";

  try
  {
   Hashtable env = new Hashtable();
   env.put(Context.INITIAL_CONTEXT_FACTORY, JNDI_FACTORY);
   env.put(Context.PROVIDER_URL,"t3://localhost:7001");
   return new InitialContext(env);
  }
  catch(Exception ex)
  { 
    System.out.println(ex.getMessage()); 
    return null;
  }

 }

}

   


