<%@ page import="java.sql.*"%>
<%
String s=request.getParameter("city");
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbBank","root","");
PreparedStatement stmt;
ResultSet rs;	
stmt=con.prepareStatement("Select bcode,bname from branches where city=? order by bname");
stmt.setString(1,s);
rs=stmt.executeQuery();
String reply="";
while(rs.next())
{
	String s1=rs.getString(2);
	String s2=rs.getString(1);
	reply=reply+s1+"#"+s2+"#";
}
out.write(reply);
%>