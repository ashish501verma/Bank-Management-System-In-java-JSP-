<%@ page import="java.sql.*"%>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/dbbank","root","");
	PreparedStatement stmt;
	ResultSet rs;
	String msg="";
	if(request.getParameter("b1")!=null)
	{
		String s1=request.getParameter("t1");
		String s2=request.getParameter("t2");
		stmt=con.prepareStatement("Select * from users where ulogin=? and upass=?");
		stmt.setString(1,s1);
		stmt.setString(2,s2);
		rs=stmt.executeQuery();
		if(rs.next())
		{
			String s3=rs.getString(3);
			session.setAttribute("ULOGIN",s1);
			session.setAttribute("UTYPE",s3);
			if(s3.equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}
			if(s3.equals("employee"))
			{
				response.sendRedirect("employee.jsp");
			}
			if(s3.equals("user"))
			{
				response.sendRedirect("customer.jsp");
			}	
		}
		else
		{	
			msg="Invalid Login/Password!!!";
		}
	}
%>
<html>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="header.jsp" />
<hr>
<form method='post'>
<table align='center'>
<tr><th colspan='3'>User Authentication</th></tr>
<tr>
	<td>Login:</td><td><input type='text' name='t1' id='t1' placeholder='Type User Id' required></td><td></td>
</tr>
<tr>
	<td>Password:</td><td><input type='password' placeholder='Type password' name='t2' id='t2' required></td><td></td>
</tr>
<tr>
	<td></td><td><input type='submit' name='b1' value='Login'></td><td></td>
</tr>
<tr>
	<td></td><td><font color='red'><%=msg%></font></td><td></td>
</tr>
<tr>
	<td></td><td><a href='forgotpass.jsp'>Forgot Password</a></td><td></td>
</tr>
</table></form>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>