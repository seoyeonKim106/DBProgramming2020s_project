<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
   <%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<link rel='stylesheet' href='./dbDesign.css' />
<body>

<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1713926";
	String passwd = "oarcle";
	Statement stmt = null;	
	String mySQL = null;
	String sql=null;
	PreparedStatement pp=null;
	ResultSet rs = null; 	
	String seatID = request.getParameter("seat_id");
	String session_id=(String) session.getAttribute("user");
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
			alert("�¼� ���� �Ϸ�!");
			response.sendRedirect("seat.jsp");
			</script>
<% 
		}
		else{
%>
			<script> 
					alert("�̹� ����� �¼��Դϴ�. �ٸ� �¼��� �Է��� �ּ���."); 
					response.sendRedirect("seat.jsp");  
			</script> 
<% 		
		}
		stmt.close(); 
		myConn.close();
	}
%>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
   <%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<link rel='stylesheet' href='./dbDesign.css' />
<body>

<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1610049";
	String passwd = "oarcle";
	Statement stmt = null;	
	String mySQL = null;
	String sql=null;
	PreparedStatement pp=null;
	ResultSet rs = null; 	
	String seatID = request.getParameter("seat_id");
	String session_id=request.getPrameter("userID");
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
			alert("�¼� ���� �Ϸ�!");
			response.sendRedirect("seat.jsp");
			</script>
<% 
		}
		else{
%>
			<script> 
					alert("�̹� ����� �¼��Դϴ�. �ٸ� �¼��� �Է��� �ּ���."); 
					response.sendRedirect("seat.jsp");  
			</script> 
<% 		
		}
		stmt.close(); 
		myConn.close();
	}
%>
</body>
>>>>>>> branch 'master' of https://github.com/itsjayoung/DBProgramming2020s_project.git
</html>