<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String status = request.getParameter("status");

try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update products set name='" + name + "' , category='" + category + "' , price='" + price + "' , status='"
	+ status + "' where id='" + id + "'");

	if (status.equals("InActive")) {
		st.executeUpdate("delete from cart where product_id='" + id + "' and address is NULL");
	}

	response.sendRedirect("allProductEditProduct.jsp?msg=yes");
} catch (Exception e) {
	response.sendRedirect("allProductEditProduct.jsp?msg=no");
	System.out.println(e);
}
%>