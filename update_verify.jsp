<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<html>
<head><title> ������ ����� ���� ���� </title></head>
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
	
	if(!formPass.equals(userPw)) { // ��� Ʋ�� 
		%><script> 
		alert("��й�ȣ�� �ٽ� Ȯ�����ּ���."); 
		location.href="update.jsp";  
		</script><%
	}
	else { // ��� ���� -> ���� ���� �������� �̵� 
		
			
			%><script> 
			location.href="change_passwd.jsp";  
			</script><%
		/* }catch(SQLException ex){
			String sMessage="";
			if (ex.getErrorCode() == 20002)
				sMessage = "��ȣ�� 4�ڸ� �̻��̾���մϴ�.";
			else if (ex.getErrorCode() == 20003)
				sMessage = "��ȣ�� ������ �Էµ��� �ʽ��ϴ�.";
			else
				out.println(ex);
				sMessage = "��� �� �ٽ� �õ��Ͻʽÿ�.";
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