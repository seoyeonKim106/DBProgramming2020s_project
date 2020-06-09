<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<style type="text/css">
	* {
		font-family: ppi;
	}
</style>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서관 사용자 정보 조회 </title>
	<link rel='stylesheet' href='./dbDesign.css' />	
</head>
<body>
<%@ include file="top.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";	
	String user = "db1610049";
	String pw = "oracle";
	
	PreparedStatement pstmt = null;
	String formId = request.getParameter("id");
	String formPass = request.getParameter("password");
	String confirmPass = request.getParameter("passwordConfirm");
	String formAddr = request.getParameter("address");
	String st = request.getParameter("mode");
	System.out.println(st);
	
%>

</body>
</html>