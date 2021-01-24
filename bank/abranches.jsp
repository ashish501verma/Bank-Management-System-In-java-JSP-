<%@ page import="java.sql.*"%>
<%
	if(session.getAttribute("ULOGIN")==null || !session.getAttribute("UTYPE").toString().equals("admin"))
	{
		response.sendRedirect("login.jsp");
	}
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/dbbank","root","");
	PreparedStatement stmt;
	ResultSet rs;
	if(request.getParameter("b1")!=null)
	{
		stmt=con.prepareStatement("Insert into branches values(?,?,?,?,?,?,?,?)");
		stmt.setString(1,request.getParameter("t1"));
		stmt.setString(2,request.getParameter("t2"));
		stmt.setString(3,request.getParameter("t3"));
		stmt.setString(4,request.getParameter("t4"));
		stmt.setString(5,request.getParameter("t5"));
		stmt.setString(6,request.getParameter("t6"));
		stmt.setString(7,request.getParameter("t7"));
		stmt.setString(8,request.getParameter("t8"));
		stmt.executeUpdate();		
	}
%>
<html>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="adminheader.jsp" />
<hr>
<form method='post'>
<table align='center'>
<tr><td>Branch Code:</td><td><input type='text' name='t1'></td><td></td></tr>
<tr><td>Branch Name:</td><td><input type='text' name='t2'></td><td></td></tr>
<tr><td>IFSC Code:</td><td><input type='text' name='t3'></td><td></td></tr>
<tr><td>Address:</td><td><input type='text' name='t4'></td><td></td></tr>
<tr><td>State:</td><td><input type='text' name='t5'></td><td></td></tr>
<tr><td>City:</td><td><input type='text' name='t6'></td><td></td></tr>
<tr><td>Pin Code:</td><td><input type='text' name='t7'></td><td></td></tr>
<tr><td>Contact Number:</td><td><input type='text' name='t8'></td><td></td></tr>
<tr><td></td><td><input type='submit' name='b1' value='Save Account'></td><td></td></tr>
</table>
</form>
<hr>
<table align='center'>
<%
	stmt=con.prepareStatement("Select * from branches");
	rs=stmt.executeQuery();
	while(rs.next())
	{
		out.write("<tr>");	
		out.write("<td>"+rs.getString(1)+"</td>");
		out.write("<td>"+rs.getString(2)+"</td>");
		out.write("<td>"+rs.getString(3)+"</td>");
		out.write("<td>"+rs.getString(4)+"</td>");
		out.write("<td>"+rs.getString(5)+"</td>");
		out.write("<td>"+rs.getString(6)+"</td>");
		out.write("<td>"+rs.getString(7)+"</td>");
		out.write("<td>"+rs.getString(8)+"</td>");
		out.write("</tr>");
	}
%>
</table>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>