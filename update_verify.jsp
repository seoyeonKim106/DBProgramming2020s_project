<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<html>
<head><title> 도서관 사용자 정보 수정 </title></head>
<body>
<%@include file="top.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="db1610049";
	//String user="db1713926";
	String pw = "oracle";
	
	PreparedStatement pstmt = null;
	String formId = request.getParameter("id");
	String formPass = request.getParameter("password");
	
	Statement stmt = null;	
	String mySQL = null;	
	ResultSet rs = null; 	

	myConn = DriverManager.getConnection(dburl, user, pw);
	stmt = myConn.createStatement(); 
	
	mySQL = "select s_id, s_pwd from students where s_id='" + session_id + "'";
	rs = stmt.executeQuery(mySQL);
	
	rs.next();
	String userPw = rs.getString("s_pwd");
	System.out.print(userPw);
	
	if(!formPass.equals(userPw)) { // 비번 틀림 

		%><script> 
		alert("비밀번호를 다시 확인해주세요."); 
		location.href="update.jsp";  
		</script><%
	}
	else {
			%><script> 
			location.href="change_passwd.jsp";  
			</script><%
		
	}	
	
%>
</body></html>