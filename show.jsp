<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

</head>
<body>
<%

	String userID = request.getParameter("res_id");
	String seatID=request.getParameter("seat_id");
	String date=request.getParameter("res_date");

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1713926";
	String passwd = "oracle";
	Statement stmt = null;	
	String mySQL = null;	
	ResultSet rs = null; 	
	
	try{
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement(); 
		mySQL = "select seat_id, res_id, res_date from seats where res_id='" + userID +"'";
		rs = stmt.executeQuery(mySQL);
		
		if(rs==null){
%>
			<script> 
				alert("ì˜ˆì•½ ì •ë³´ê°€ ì—†ìŠµë‹ˆë‹¤."); 
				location.href="seat.jsp";  
			</script>
<% 			
		}
		else{
%>
			<tr> <td align="center"><%=userID%>ë‹˜! <%=date %>ì— <%=seatID %>ë¥¼ ì˜ˆì•½í•˜ì˜€ìŠµë‹ˆë‹¤.</td> </tr>
<% 			
		}
		stmt.close(); 
		myConn.close();
	}catch(SQLException e){
	    out.println(e);
	    e.printStackTrace();
	}
%>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

</head>
<body>
<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1610049";
	String passwd = "oracle";
	Statement stmt = null;	
	String mySQL = null;	
	ResultSet rs = null; 	
	
	try{
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement(); 
		mySQL = "select seat_id, res_id, res_date from seats where res_id='" + userID +"'";
		rs = stmt.executeQuery(mySQL);
		String userID = request.getParameter("res_id	");
		String seatID=request.getParameter("seat_id");
		String date=request.getParameter("res_date");
		
		if(rs==null){
%>
			<script> 
				alert("¿¹¾à Á¤º¸°¡ ¾ø½À´Ï´Ù."); 
				location.href="seat.jsp";  
			</script>
<% 			
		}
		else{
%>
			<tr> <td align="center"><%=userID%>´Ô! <%=date %>¿¡ <%=seatID %>¸¦ ¿¹¾àÇÏ¿´½À´Ï´Ù.</td> </tr>
<% 			
		}
		stmt.close(); 
		myConn.close();
	}catch(SQLException e){
	    out.println(e);
	    e.printStackTrace();
	}
%>
</body>
>>>>>>> branch 'master' of https://github.com/itsjayoung/DBProgramming2020s_project.git
</html>