<%@ page import="java.sql.*"%>
<%
String s=request.getParameter("state");
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbBank","root","");
PreparedStatement stmt;
ResultSet rs;	
stmt=con.prepareStatement("Select city from indianstates where city is not null and states=? order by city");
stmt.setString(1,s);
rs=stmt.executeQuery();
String reply="";
while(rs.next())
{
	String s1=rs.getString(1);
	reply=reply+s1+"#";
}
out.write(reply);
%>