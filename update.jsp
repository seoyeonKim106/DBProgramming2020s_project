<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<style type="text/css">
	* {
		font-family: ppi;
	}
</style>
<html>
<head>
	<title>도서관 사용자 정보 수정</title>
	<link rel='stylesheet' href='./dbDesign.css' />
</head>
<body>
<%@ include file="top.jsp" %>
<%
	Connection myConn=null;

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
	String user= "db1610049";
	//String user = "db1713926";
	String pw = "oracle";
	Statement stmt = null;	
	String mySQL = null;	
	ResultSet rs = null; 	
	String userId = "";
	String userPw = "";
%>
<%
	if (session_id == null) { %>
		<script> 
			alert("로그인 후 사용하세요."); 
			location.href="login.jsp";  
		</script>
<%
	} else { 
		try{
			myConn = DriverManager.getConnection(dburl, user, pw);
			stmt = myConn.createStatement(); 
			
			mySQL = "select s_id, s_pwd from students where s_id='" + session_id + "'";
			rs = stmt.executeQuery(mySQL);
			
		}catch(SQLException e){
		    out.println(e);
		    e.printStackTrace();
		}finally{
			if(rs != null ){
				if (rs.next()) {
					userId = rs.getString("s_id");
					userPw = rs.getString("s_pwd");
				}
			}
				else {
%>
					<script> 
						alert("세션이 종료되었습니다. 다시 로그인 해주세요."); 
						location.href="login.jsp";  
					</script>  
<%
				}
			}	
%>
			<form action="update_verify.jsp?id=<%=session_id%>" method="post">
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
			  <td colspan="4" align="center">
			  <input id="update_btn" type="submit" value="확인">
			</tr>
			</table>
			</form>
<%	
			stmt.close(); 
			myConn.close();
		}

%>
</body>
</html>