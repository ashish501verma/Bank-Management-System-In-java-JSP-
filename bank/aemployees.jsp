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
%>
<html>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="adminheader.jsp" />
<hr><center>
<img src='images/administrator.jpg' width='500px'>
</center>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>