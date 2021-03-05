<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<%@ page import = "java.sql.*"%>




<%
try
{
   // Conexion con bd
   Class.forName("com.mysql.jdbc.Driver");
   Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendalibros?serverTimezone=UTC", "root", "");
   if (!conexion.isClosed())
   {
      // La consulta
      Statement st = conexion.createStatement();
      	String autor= request.getParameter("autor");
     	String cantidad= request.getParameter("cantidad");
     	String id= request.getParameter("id");
		String precio= request.getParameter("precio");
		String titulo= request.getParameter("titulo");
		
      
      
      String qry ="insert into libros(autor, cantidad, precio, titulo,id) VALUES ('"+ autor +"',"+ cantidad +","+ precio +",'"+ titulo +"'," +id+ ")";
      //String qry2="INSERT INTO `libros` (`id`, `titulo`, `autor`, `precio`, `cantidad`) VALUES ('3232365', 'alex', 'perico', '22', '1')";
		st.executeUpdate(qry);
    
      // cierre de la conexion
      conexion.close();
   }
   else
      // Error en la conexion
      out.println("fallo");
}
catch (Exception e)
{
   // Error en algun momento.
   e.printStackTrace();
   out.println("Excepcion "+e);
   
}

%>
<%
try
{
   // Conexion con bd
   Class.forName("com.mysql.jdbc.Driver");
   Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendalibros?serverTimezone=UTC", "root", "");
   if (!conexion.isClosed())
   {
      // La consulta
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table border='1'><tr><td>Id</td><td>Autor</td><td>Cantidad</td><td>Precio</td><td>Titulo</td></tr>");
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+rs.getObject("id")+"</td>");
         out.println("<td>"+rs.getObject("autor")+"</td>");
         out.println("<td>"+rs.getObject("cantidad")+"</td>");
         out.println("<td>"+rs.getObject("precio")+"</td>");
         out.println("<td>"+rs.getObject("titulo")+"</td>");
         out.println("</tr>");
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
   }
   else
      // Error en la conexion
      out.println("fallo");
}
catch (Exception e)
{
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}

%>
</body>
</html>