<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title> 도서관 사용자 정보 수정 </title>
</head>
<body>
<%@include file="top.jsp"%>

<%
	Connection myConn=null;
	Statement stmt=null;
	Statement stmt2=null;
	ResultSet myResultSet=null;
	ResultSet myResultSet_ck=null;
	String dbdriver="oracle.jdbc.driver.OracleDriver";
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	String user="db1610049";
	String passwd="oracle";
		
	try{
		Class.forName(dbdriver);
		myConn=DriverManager.getConnection(dburl,user,passwd);
	}catch(SQLException ex){
		System.out.println("SQLException: "+ex.getMessage());
	}
	stmt=myConn.createStatement();
	String mySQL="select * from students";
	myResultSet=stmt.executeQuery(mySQL);
%>
	<form action="change_passwd_verify.jsp?id=<%=session_id%>" method="post">
	<table align="center" id="update_table">
	<tr>
	  <td id="update_td">아이디</td>
	  <td colspan="3"><input id="update_id_in" type="text" name="id" size="50" style="text-align: center;" value="<%=session_id%>" disabled></td>
	</tr>
	<tr>  
	  <td id="update_td">비밀번호</td>
	  <td><input id="update_pw_in" type="password" name="password" size="50"></td>
	</tr>
	<tr>  
	  <td id="update_td">비밀번호 확인</td>
	  <td><input id="update_pw_in" type="password" name="passwordConfirm" size="50"></td>
	</tr>
	<tr>
	  <td colspan="4" align="center">
	  <input id="update_btn" type="submit" value="비밀번호 변경">
	</tr>
	</table>
	</form>
<% 
	stmt.close();
	myConn.close();
%>
</table>
</body>
</html>