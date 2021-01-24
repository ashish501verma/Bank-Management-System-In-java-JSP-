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
		stmt=con.prepareStatement("Select count(*)+1 from accounttypes");
		rs=stmt.executeQuery();
		String id="";
		if(rs.next()) id=rs.getString(1);
		stmt=con.prepareStatement("Insert into accounttypes values(?,?,?)");
		stmt.setString(1,id);
		stmt.setString(2,request.getParameter("t1"));
		stmt.setString(3,request.getParameter("t2"));
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
<tr><td>Account Type:</td><td><input type='text' name='t1'></td><td></td></tr>
<tr><td>Description:</td><td><input type='text' name='t2'></td><td></td></tr>
<tr><td></td><td><input type='submit' name='b1' value='Save Account'></td><td></td></tr>
</table>
</form>
<hr>
<table align='center'>
<%
	stmt=con.prepareStatement("Select * from accounttypes");
	rs=stmt.executeQuery();
	while(rs.next())
	{
		out.write("<tr>");	
		out.write("<td>"+rs.getString(1)+"</td>");
		out.write("<td>"+rs.getString(2)+"</td>");
		out.write("<td>"+rs.getString(3)+"</td>");
		out.write("</tr>");
	}
%>
</table>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>