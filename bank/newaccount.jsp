<%@ page import="java.sql.*"%>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/dbbank","root","");
	PreparedStatement stmt;
	ResultSet rs;
	if(request.getParameter("b1")!=null)
	{
		String s1=request.getParameter("s0");
		String s2=request.getParameter("s1");
		String s3=request.getParameter("s2");
		String s4=request.getParameter("s3");
		String s5=request.getParameter("t1");
		String s6=request.getParameter("t2");
		String s7=request.getParameter("t3");
		String s8=request.getParameter("t4");
		String s9=request.getParameter("t5");
		String s10=request.getParameter("t6");
		String s11=request.getParameter("t7");
		String s12=request.getParameter("t8");
		String s13=request.getParameter("t9");
		String s14=request.getParameter("t10");
		String s15=request.getParameter("t11");
		String s16=request.getParameter("t12");
		String s17=request.getParameter("t13");
		
		String actno=s4;
		if(s1.length()==1) s1="0"+s1;
		actno=actno+s1;
		stmt=con.prepareStatement("Select count(*)+1 from Customers");
		rs=stmt.executeQuery();
		String s="0";
		if(rs.next()) s=rs.getString(1);
		int n=s.length();
		for(int i=1;i<=6-n;i++)
		{
			actno=actno+"0";
		}
		actno=actno+s;
		stmt=con.prepareStatement("Insert into customers values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null,null)");
		stmt.setString(1,actno);
		stmt.setString(2,s5);
		stmt.setString(3,s6);
		stmt.setString(4,s7);
		stmt.setString(5,s8);
		stmt.setString(6,s9);
		stmt.setString(7,s10);
		stmt.setString(8,s11);
		stmt.setString(9,s12);
		stmt.setString(10,s13);
		stmt.setString(11,s2);
		stmt.setString(12,s3);
		stmt.setString(13,s14);
		stmt.setString(14,s15);
		stmt.setString(15,s16);
		stmt.setString(16,s17);
		stmt.executeUpdate();
		stmt=con.prepareStatement("Insert into users values(?,?,'user')");
		stmt.setString(1,actno);
		stmt.setString(2,request.getParameter("t14"));
		stmt.executeUpdate();
		stmt=con.prepareStatement("Insert into balances values(?,0,'D')");
		stmt.setString(1,actno);
		stmt.executeUpdate();	
		response.sendRedirect("newaccount1.jsp?actno="+actno);
	}
%>
<html>
<head>
<script>
var xmlhttp;
function getCities()
{
	s=document.getElementById("s1").value;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function (){
		if(xmlhttp.status==200 && xmlhttp.readyState==4)
		{
			reply=xmlhttp.responseText.trim();
			cities=reply.split("#");
			obj1=document.getElementById("s2");
			obj1.length=0;
			for(i=0;i<cities.length-1;i++)
			{
				opt=document.createElement("option");
				opt.text=cities[i];
				opt.value=cities[i];
				obj1.appendChild(opt);
			}
		}
	};
	xmlhttp.open("GET","getCities.jsp?state="+s,true);
	xmlhttp.send(null);
}

var xmlhttp;
function getBranches()
{
	s=document.getElementById("s2").value;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function (){
		if(xmlhttp.status==200 && xmlhttp.readyState==4)
		{
			reply=xmlhttp.responseText.trim();
			branches=reply.split("#");
			obj1=document.getElementById("s3");
			obj1.length=0;
			for(i=0;i<branches.length-1;i=i+2)
			{
				opt=document.createElement("option");
				opt.text=branches[i];
				opt.value=branches[i+1];
				obj1.appendChild(opt);
			}
		}
	};
	xmlhttp.open("GET","getBranches.jsp?city="+s,true);
	xmlhttp.send(null);
}
</script>
</head>
<body style='margin:0px'>
<img src='images/banner.jpg' width='100%'>
<jsp:include page="header.jsp" />
<hr>
<form method='post'>
<table align='center'>
<tr><th colspan='3'>New Account Form</th></tr>
<tr>
	<td>Account Type:</td><td><select name="s0">
	<%
		stmt=con.prepareStatement("Select * from accounttypes");
		rs=stmt.executeQuery();
		while(rs.next())
		{
			out.write("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
		}
	%>
	</select></td><td></td>
</tr>
<tr>
	<td>State:</td><td><select name="s1" id="s1" onChange="getCities()">
	<%
		stmt=con.prepareStatement("Select distinct states from indianstates order by states");
		rs=stmt.executeQuery();
		while(rs.next())
		{
			out.write("<option>"+rs.getString(1)+"</option>");
		}
	%>
	</select></td><td></td>
</tr>
<tr>
	<td>City:</td><td><select name="s2" id="s2" onChange="getBranches()"></select></td><td></td>
</tr>
<tr>
	<td>Nearest Branch:</td><td><select name="s3" id="s3"></select></td><td></td>
</tr>
<tr>
	<td>First Name:</td><td><input type='text' name='t1' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Middle Name:</td><td><input type='text' name='t2' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Last Name:</td><td><input type='text' name='t3' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Father Name:</td><td><input type='text' name='t4' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Mother Name:</td><td><input type='text' name='t5' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Date of Birth:</td><td><input type='date' name='t6' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Occupation:</td><td><select name='t7'><option>Job</option><option>Business</option><option>Student</option><option>Retired</option></select></td><td></td>
</tr>
<tr>
	<td>Mobile:</td><td><input type='text' name='t8' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Address:</td><td><textarea name='t9' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></textarea></td><td></td>
</tr>
<tr>
	<td>Pin Code:</td><td><input type='text' name='t10' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Email:</td><td><input type='email' name='t11' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>PAN No:</td><td><input type='text' name='t12' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Aadhar ID:</td><td><input type='text' name='t13' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Password:</td><td><input type='password' name='t14' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td>Re-Password:</td><td><input type='password' name='t15' style='border-color:#FFAAAA;border-style:solid;border-width:1px;width:200px'></td><td></td>
</tr>
<tr>
	<td></td><td><input type='submit' name='b1' value='Upload Documents'></td><td></td>
</tr>
</table></form>
<hr>
<img src='images/footer.jpg' width='100%'>
</body>
</html>
<%
con.close();
%>