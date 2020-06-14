<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<link rel='stylesheet' href='./dbDesign.css' />
<body>
<%@include file="top.jsp"%>

<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
//	String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="db1610049";
//	String user="db1713926";
	String passwd = "oracle";
	Statement stmt = null;	
	String mySQL = null;
	String sql=null;
	PreparedStatement pp=null;
	ResultSet rs = null; 	
	String seatID = request.getParameter("seat_id");
	String str="";

	try{
		myConn=DriverManager.getConnection(dburl, user,passwd);
		stmt=myConn.createStatement();
		mySQL="select seat_id from seats where seat_id='"+seatID+"'and res_id=null";
		rs=stmt.executeQuery(mySQL);
		
	}catch(SQLException e){
	    out.println(e);
	    e.printStackTrace();
	}finally{
		if(rs != null){
			session.setAttribute("seat_id",seatID);

			sql="insert into seats (seat_id, res_id, res_date) values(?,?,SYSDATE)";
			pp=myConn.prepareStatement(sql);
			pp.setString(1,seatID);
			pp.setString(2,session_id);
			pp.executeUpdate();
%>
			<script>
			alert("좌석 예약 완료!");
			response.sendRedirect("seat.jsp");
			</script>
<% 
		}
		else{
%>
			<script> 
					alert("이미 예약된 좌석입니다. 다른 좌석을 입력해 주세요."); 
					response.sendRedirect("seat.jsp");  
			</script> 
<% 		
		}
		
	}
	rs.close();
	stmt.close(); 
	myConn.close();
%>
</body>
</html>