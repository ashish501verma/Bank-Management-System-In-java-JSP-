<html>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="header.jsp" />
<hr>
<center><img src='images/thanks.jpg'><br>
Thanks for Registration.<br>
Your Account No is <b><%=request.getParameter("id")%></b><br>
Please Note this number for future reference. <br>Its will also works as user Login.
</center>
<br>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>