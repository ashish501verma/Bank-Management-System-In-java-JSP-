<%@ page import="java.io.*,java.sql.*"%>
<%
int size=request.getContentLength();
byte[] data=new byte[size];
InputStream inr=request.getInputStream();
int remaining=size;
int read=0;
while(remaining>0)
{
	int x=inr.read(data,read,remaining);
	read=read+x;
	remaining=remaining-x;
}
String str=new String(data);
int p=str.indexOf("\r\n");
String bndry=str.substring(0,p);

int p1,p2;
p1=str.indexOf("name=\"t0\"")+13;
p2=str.indexOf(bndry,p1)-2;
String s1=str.substring(p1,p2);

p1=str.indexOf("name=\"t1\"");
p1=str.indexOf("filename=",p1)+10;
p2=str.indexOf("\"",p1);
String filename=str.substring(p1,p2);

p1=str.indexOf("Content-Type",p1)+14;
p2=str.indexOf("\r\n\r\n",p1);
String filetype=str.substring(p1,p2);

int filestart=p2+4;
int fileend=str.indexOf(bndry,filestart)-3;
int filesize=fileend-filestart+1;
byte[] filedata=new byte[filesize];
System.arraycopy(data,filestart,filedata,0,filesize);

p1=str.indexOf("name=\"t2\"");
p1=str.indexOf("filename=",p1)+10;
p2=str.indexOf("\"",p1);
String filename1=str.substring(p1,p2);

p1=str.indexOf("Content-Type",p1)+14;
p2=str.indexOf("\r\n\r\n",p1);
String filetype1=str.substring(p1,p2);

int filestart1=p2+4;
int fileend1=str.indexOf(bndry,filestart1)-3;
int filesize1=fileend1-filestart1+1;
byte[] filedata1=new byte[filesize1];
System.arraycopy(data,filestart1,filedata1,0,filesize1);


Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbBank","root","");
PreparedStatement stmt=con.prepareStatement("Update Customers set photo=?,signature=? where accno=?");
stmt.setBytes(1,filedata);
stmt.setBytes(2,filedata1);
stmt.setString(3,s1);
stmt.executeUpdate();
con.close();
response.sendRedirect("thanks.jsp?id="+s1);
%>