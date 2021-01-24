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
<tr><th>Transaction Date</th><th>Amount</th><th>Transaction Type</th><th>Balance</th></tr>
	<%
		stmt=con.prepareStatement("Select * from transactions where accno=? order by tdate");
		stmt.setObject(1,session.getAttribute("ULOGIN"));
		rs=stmt.executeQuery();
		double bal=0;
		while(rs.next())
		{
			out.write("<tr>");
			out.write("<td>"+rs.getString(2)+"</td>");
			out.write("<td>"+rs.getString(3)+"</td>");
			out.write("<td>"+rs.getString(4)+"</td>");
			if(rs.getString(4).equals("C"))
			{
				bal=bal+rs.getDouble(3);
			}
			if(rs.getString(4).equals("D"))
			{
				bal=bal-rs.getDouble(3);
			}
			out.write("<td>"+bal+"</td>");
			out.write("</tr>");
		}
	%>	
</table>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>