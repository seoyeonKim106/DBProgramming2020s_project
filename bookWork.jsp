<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head><title>책 대출 및 예약</title>
</head>
<body>
<%@include file="top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String state=request.getParameter("state");	//1은 대출, 0은 예약
	String b_id=request.getParameter("b_id");
	System.out.println(b_id+"/"+state);
	session_id=(String)session.getAttribute("user");
	if(session_id==null){
%>
<script>
	alert("로그인이 필요한 서비스입니다.");
	location.href="login.jsp";
</script>
	<%
	}
	if(state.equals("1")){
%>
<td colspan=2><div align="center">
		<br><br>
		<button type="button" onclick="javascript:location.href='bookWork_verify.jsp?b_id=<%=b_id%>&state=0'">대출</button>
		<INPUT TYPE="button" onclick="history.back(-1);" VALUE="돌아가기">
</div></td>
<%
	}else{
		Connection myConn=null;
		String dbdriver="oracle.jdbc.driver.OracleDriver";
		//String dburl="jdbc:oracle:thin:@localhost:1521:xe";
		String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
		//String user="db1610049";
		String user="db1713926"; 
		String passwd="oracle";
		
		try{
			Class.forName(dbdriver);
			myConn=DriverManager.getConnection(dburl,user,passwd);
		}catch(SQLException ex){
			System.out.println("SQLException: "+ex.getMessage());
		}
		Statement stmt=myConn.createStatement();
		String mySQL="select b_id,s_id from checkOut where b_id='"+b_id+"' and s_id='"+session_id+"'";
		ResultSet myResultSet=stmt.executeQuery(mySQL);
		
		String sid="";
		
		if(myResultSet!=null){
			//대출 중 인 도서인데, 내가 빌리고 있는 책이라서 예약 기능도 불가함
			while(myResultSet.next()){
				String bid=myResultSet.getString("b_id");
				sid=myResultSet.getString("s_id");
				System.out.println(sid+"/"+bid);
			}
		}
		
		if(sid.equals(session_id)){		
%>
<script>
	alert("<%=session_id%>가 대출 중인 도서입니다.");
	location.href='bookMenu.jsp';
</script>
<%			
		}else{
%>
<script>
	alert("대출 중인 도서입니다.\n예약만 가능합니다.");
</script>
<td colspan=1><div align="center">
	<br><br>
	<button type="button" onclick="javascript:location.href='bookWork_verify.jsp?b_id=<%=b_id%>&state=1'">예약</button>
	<INPUT TYPE="button" onclick="history.back(-1);" VALUE="취소">
</div></td>
<%
		}
		stmt.close();
		myConn.close();
	}
%>

</body>
</html>