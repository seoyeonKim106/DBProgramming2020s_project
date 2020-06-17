<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반납처리</title>
</head>
<body>
<%@include file="top.jsp"%>
<%
	String b_id=request.getParameter("b_id");

	Connection myConn=null;
	String result=null;
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="db1610049";
	//String user="db1713926"; 
	String passwd="oracle";
	String dbdriver="oracle.jdbc.driver.OracleDriver";

		try{
			Class.forName(dbdriver);
			myConn=DriverManager.getConnection(dburl,user,passwd);
		}catch(SQLException ex){
			System.out.println("SQLException: "+ex.getMessage());
		}
	
		CallableStatement cstmt=myConn.prepareCall("{call return_book(?,?,?)}");
		cstmt.setString(1,b_id);
		cstmt.setString(2,session_id);
		cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
		try{
				cstmt.execute();
				result=cstmt.getString(3);
				System.out.println(result);
%>
<script>
	alert("<%=result%>");
	location.href="select.jsp";	
</script>
<%
		}catch(SQLException ex){
				System.out.println("SQLException: "+ex.getMessage());
		}finally{
				if(cstmt!=null)
					try{
						myConn.commit();cstmt.close();myConn.close();
					}catch(SQLException ex){}
		}
%>
</body>
</html>
