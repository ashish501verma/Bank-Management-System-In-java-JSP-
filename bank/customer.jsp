<%@ page import="java.sql.*"%>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/dbbank","root","");
	PreparedStatement stmt;
	ResultSet rs;
%>
<html>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="customerheader.jsp" />
<hr>
<table align='center'>
	<%
		String name="";
		String balance="";
		stmt=con.prepareStatement("Select * from customers where accno=?");
		stmt.setObject(1,session.getAttribute("ULOGIN"));
		rs=stmt.executeQuery();
		if(rs.next())
		{
			name=rs.getString("fname")+" "+rs.getString("mname")+" "+rs.getString("lname");
		}
		stmt=con.prepareStatement("Select * from balances where accno=?");
		stmt.setObject(1,session.getAttribute("ULOGIN"));
		rs=stmt.executeQuery();
		if(rs.next())
		{
			balance=rs.getString(2);
		}	
	%>
	<tr><td>Bank Account No:</td><td><%=session.getAttribute("ULOGIN")%></td><td></td></tr>
	<tr><td>Name:</td><td><%=name%></td><td></td></tr>
	<tr><td>Balance:</td><td>Rs <%=balance%>/-</td><td></td></tr>
</table>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>