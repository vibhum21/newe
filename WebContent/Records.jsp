<%@page import="com.emp.dao.EmpDAO"%>
<%@page import="com.emp.integer.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<style>

label{
font-family:sans-serif;
display:block;
margin:3px;
padding-left: 60px;
padding-top: 3px;
}
label.login{
padding-left: 100px;
margin-right: 50px;
}
span.reset{
padding-left: 50px;
}
span.heading{
font-family:cursive;
font-style:italic;
font-size:30px;
padding-left:70px;
padding-bottom: 20px;
width:420px;
position: absolute;
}
span{
font-size:20px;
display:inline-block;
width:120px;
}

div.wrapper{
background-color: bisque;
border-radius: 10px;
padding: 20px;
border-color: red;
border-width: 3px;
border-style: solid;
width: 450px;
height: 400px;
margin: auto;
position: absolute;
top: 0;
bottom: 0;
left: 0;
right: 0;
}
h2.heading{

top: 0;
bottom: 0;
left: 0;
right: 0;
}
body
{
background-color: rgba(0,0,0,0,5);
}
input.btn {
border: 0;
background-color: #3bab53;
width: 80px;
height: 30px;
font-size: 16px;
color: white;
}

</style>
		
</head>
<body>
<%
PreparedStatement stmt;
ResultSet rs,rs1,rs2;
IntegerVerify iv=new IntegerVerify();
String input=request.getParameter("text");
System.out.println("fgd"+input);
int id=iv.getInt(input);
System.out.println("fgd"+id);
EmpDAO emp=new EmpDAO();
Connection con=emp.open();
	if(input.equals(""))
	{
		String sql = "SELECT * FROM EMP";
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();%>
		<div class='wrapper'><span class='heading'>Employee(s) Found : </span>
		
		<table>
		<%while(rs.next())
		{%>
		<tr><td><label>Employee Id	: </label></td><td><label><%=rs.getString(1)%></label></td></tr>
		<tr><td><label>Employee Name: </label></td><td><label><%=rs.getString(2)%></label></td></tr>
		<tr><td><label>Employee Department: </label></td><td><label><%=rs.getString(3)%></label></td></tr><br>
		<%}%>
		</table><br>
		</div>
	<%}
	else 
	{
		if(id==0)
		{
			PreparedStatement st2 =con.prepareStatement("select * from emp where name LIKE '%input%'");
			//st2.setString(1, input);
			rs1=st2.executeQuery();
			/* if(!rs1.isBeforeFirst())
				System.out.println("No Records Found for name "+input);
			else */
				while(rs1.next())
				{%>
				<div class='wrapper'><span class='heading'>Employee(s) Found : </span>
		<br><br><br>
		<table><tr><td><label>Employee Id	: </label></td><td><label><%=rs1.getString(1)%></label></td></tr>
		<tr><td><label>Employee Name: </label></td><td><label><%=rs1.getString(2)%></label></td></tr>
		<tr><td><label>Employee Department: </label></td><td><label><%=rs1.getString(3)%></label></td></tr>
		</table><br>
		</div>
			<%}
			
		}
		else
		{
			PreparedStatement st1 =con.prepareStatement("select * from emp where id=?");
			st1.setInt(1, id);
			rs2=st1.executeQuery();
			if(!rs2.isBeforeFirst())
				System.out.println("No Records Found for id "+id);
			else
				while(rs2.next())
				{%>
				<div class='wrapper'><span class='heading'>Employee(s) Found : </span>
		<br><br><br>
		<table><tr><td><label>Employee Id	: </label></td><td><label><%=rs2.getString(1)%></label></td></tr>
		<tr><td><label>Employee Name: </label></td><td><label><%=rs2.getString(2)%></label></td></tr>
		<tr><td><label>Employee Department: </label></td><td><label><%=rs2.getString(3)%></label></td></tr>
		</table><br>
		</div>
			<%}
		}
	}
%>
</body>
</html>