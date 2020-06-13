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
				alert("예약 정보가 없습니다."); 
				location.href="seat.jsp";  
			</script>
<% 			
		}
		else{
%>
			<tr> <td align="center"><%=userID%>님! <%=date %>에 <%=seatID %>를 예약하였습니다.</td> </tr>
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
</html>