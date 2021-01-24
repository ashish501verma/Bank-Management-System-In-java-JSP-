<%@ page import="java.sql.*"%>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost","root","");	
	PreparedStatement stmt=con.prepareStatement("Create Database DBBank");
	stmt.executeUpdate();
	stmt=con.prepareStatement("Use DBBank");
	stmt.executeUpdate();
	stmt=con.prepareStatement("Create Table AccountTypes(acode int,atype varchar(20),details varchar(40))");
	stmt.executeUpdate();
	stmt=con.prepareStatement("Create Table Branches(bcode int,bname varchar(100),ifsccode varchar(20),address varchar(100),state varchar(50),city varchar(50),pincode varchar(6),cnumber varchar(10))");
	stmt.executeUpdate();	
	stmt=con.prepareStatement("Create Table Customers(accno varchar(20),fname varchar(100),mname varchar(100),lname varchar(100),father varchar(100),mother varchar(100),dob date,occupation varchar(100),mobile varchar(10),adress varchar(100),state varchar(100),city varchar(100),pincode varchar(6),email varchar(100),panno varchar(100),aadhar varchar(100),photo mediumblob,signature mediumblob)");
	stmt.executeUpdate();	
	stmt=con.prepareStatement(" create table balances(accno varchar(20),balance float,atype varchar(1))");
	stmt.executeUpdate();
	stmt=con.prepareStatement("create table transactions(accno varchar(20),tdate date,amount float,ttype varchar(1))");
	stmt.executeUpdate();
	stmt=con.prepareStatement(" create table Employees(ecode int,bcode int,name varchar(100),mobile varchar(10),email varchar(40),post varchar(20))");
	stmt.executeUpdate();
	stmt=con.prepareStatement(" create table users(ulogin varchar(30),upass varchar(20),utype varchar(30))");
	stmt.executeUpdate();
	stmt=con.prepareStatement("Insert into users values('admin','admin123','admin')");
	stmt.executeUpdate();
	out.write("Done");	
%>