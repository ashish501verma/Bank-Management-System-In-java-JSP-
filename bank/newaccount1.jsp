<%@ page import="java.sql.*"%>
<html>
<head>
</head>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="header.jsp" />
<hr>
<form method='post' action='uploadfile.jsp' enctype='multipart/form-data'>
<table align='center'>
<tr><th colspan='3'>Upload Documents</th></tr>
<tr>
	<td></td><td><input type='hidden' name='t0' value='<%=request.getParameter("actno")%>'></td><td></td>
</tr>
<tr>
	<td>Photo:</td><td><input type='file' name='t1' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Signature:</td><td><input type='file' name='t2' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td></td><td><input type='submit' name='b1' value='Upload'></td><td></td>
</tr>
</table></form>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>
