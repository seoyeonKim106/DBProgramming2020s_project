<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="EUC-KR"%>
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
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";	
	String user = "db1610049";
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
	else { // 비번 맞음 -> 정보 수정 페이지로 이동 
		
			
			%><script> 
			location.href="change_passwd.jsp";  
			</script><%
		/* }catch(SQLException ex){
			String sMessage="";
			if (ex.getErrorCode() == 20002)
				sMessage = "암호는 4자리 이상이어야합니다.";
			else if (ex.getErrorCode() == 20003)
				sMessage = "암호에 공란은 입력되지 않습니다.";
			else
				out.println(ex);
				sMessage = "잠시 후 다시 시도하십시오.";
			out.println("<script>");
			out.println("alert('"+sMessage+"');");
			out.println("location.href='update.jsp';");
			out.println("</script>");
			out.flush();
			pstmt.close();
		}   */
	}	
	
%>
</body></html>