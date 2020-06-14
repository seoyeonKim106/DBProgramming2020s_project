<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String userID=request.getParameter("userID");
String userPassword=request.getParameter("userPassword");

String driver = "oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:xe";
//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="db1610049";
//String user="db1713926";
String passwd = "oracle";  

Class.forName(driver);
Connection con = DriverManager.getConnection(dburl, user, passwd);
Statement stmt = con.createStatement();
String query = "select * from students where s_id='"+userID+"' and s_pwd='"+userPassword+"'";
ResultSet rs = stmt.executeQuery(query); 

if (rs.next()){ // exists.
	session.setAttribute("user", rs.getString("s_id"));
	session.setAttribute("major", rs.getString("s_major"));

%>
<script>location.href = "main.jsp"; </script>

<%} else { %>	
<script>location.href = "login.jsp"; </script>

<%
}
rs.close();
stmt.close();
con.close();
%>
