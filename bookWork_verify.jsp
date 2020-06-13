<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head><title>사용자 권한 확인</title>
</head>
<body>
<%@include file="top.jsp"%>
<%
	String b_id=request.getParameter("b_id");
	session_id=(String)session.getAttribute("user");
	if(session_id==null){
%>
<script>
	alert("로그인이 필요한 서비스입니다.");
	location.href="login.jsp";
</script>
<%
	}else{
		System.out.println(b_id+" is going to verified by "+session_id+"authority");	
		//여기에 checking하는 prepared function??이런거 넣어서 대출이나 예약 가능한지 확인해서 메시지 띄워주고 DB에 저장해야함
%>
<%
		Connection myConn=null;
		String result=null;
		String dburl="jdbc:oracle:thin:@db.sd.ac.kr:1521:xe";
		String user="db1610049"; String passwd="oracle";
		String dbdriver="oracle.jdbc.driver.OracleDriver";

		try{
			Class.forName(dbdriver);
			myConn=DriverManager.getConnection(dburl,user,passwd);
		}catch(SQLException ex){
			System.out.println("SQLException: "+ex.getMessage());
		}

		CallableStatement cstmt=myConn.prepareCall("{call InsertBook(?,?,?)}");
		cstmt.setString(1, b_id);
		cstmt.setString(2, session_id);
		cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
		try{
			cstmt.execute();
			result=cstmt.getString(3);
			System.out.println(result);
		%>
		<script>
			alert("<%=result%>");
			location.href="bookMenu.jsp";	//나중에 이 부분은 사용자 정보를 출력하는 페이지로 연결해주기
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
	}
%>
</body>
</html>