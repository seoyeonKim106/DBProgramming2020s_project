<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1610049";
	String password = "oracle"; // Oracle ���� ���� password �Է�
	try {
		Class.forName(driver);
		out.println("1610049 jdbc driver �ε� ����");
		DriverManager.getConnection(url, user, password);
		out.println("1610049 ����Ŭ ���� ����");
	} catch (ClassNotFoundException e) {
		System.out.println("jdbc driver �ε� ����");
	} catch (SQLException e) {
		System.out.println("����Ŭ ���� ����");
	}
	%>


</body>
</html>