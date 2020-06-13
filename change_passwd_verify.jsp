<%@ page contentType="text/html; charset=UTF-8" %>
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
	
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";	
	String user = "db1610049";
	String pw = "oracle";
	
	PreparedStatement pstmt = null;
	String formPass = request.getParameter("password");
	String confirmPass = request.getParameter("passwordConfirm");
	
		
	try{          
		myConn = DriverManager.getConnection(dburl, user, pw);
			
		if(formPass.equals(confirmPass)){ // 입력한 비번-비번 확인이 동일 
	
			String mySQL = "UPDATE students SET s_pwd=? WHERE s_id=?";      
			pstmt = myConn.prepareStatement(mySQL);
				
			pstmt.setString(1, formPass);
			pstmt.setString(2, session_id);
			
			pstmt.executeUpdate();
	
		} else {
			%>
			<script>
			alert("비밀번호가 일치하지 않습니다."); 
			location.href="change_passwd.jsp";  
			</script>
			<%
		}
		
		%><script> 
			alert("비밀번호가 변경되었습니다."); 
			location.href="main.jsp";  
		</script><%
	}catch(SQLException ex){
		String sMessage="";
		if (ex.getErrorCode() == 20002)
			sMessage = "암호는 4자리 이상이어야합니다.";
		else if (ex.getErrorCode() == 20003)
			sMessage = "암호에 공란은 입력되지 않습니다.";
		else
			sMessage = "잠시 후 다시 시도하십시오.";
			String err = ex.getMessage();
			System.out.print(err);
		out.println("<script>");
		out.println("alert('"+sMessage+"');");
		out.println("location.href='update.jsp';");
		out.println("</script>");
		out.flush();
		pstmt.close();
		  
	}	
	
%>
</body></html>