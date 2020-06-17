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
	
	
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="db1610049";
	//String user="db1713926";
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
	} catch (SQLException ex){
		String sMessage="";
		if (ex.getErrorCode() == 20002){
			
			%>
			<script>
			alert("암호는 4자리 이상이어야합니다.");
			location.href="change_passwd.jsp";  
			</script>
			<% 
		}
		else if (ex.getErrorCode() == 20003){
			
			%>
			<script>
			alert("암호에 공란은 입력되지 않습니다.");
			location.href="change_passwd.jsp";  
			</script>
			<% 
		}
		else {
			
			String err = ex.getMessage();
			System.out.print(ex.getErrorCode());
			/* System.out.println("<script>");
			System.out.println("alert('"+sMessage+"');");
			System.out.println("location.href='update.jsp';");
			System.out.println("</script>");
			System.out.flush(); */
			pstmt.close();
			%>
			<script>
			alert("잠시 후 다시 시도하십시오.");
			location.href="change_passwd.jsp";  
			</script>
			<% 
		}
	}	
	
%>
</body></html>