<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head><title>å ����</title>
</head>
<body>
<%@include file="top.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String option=request.getParameter("options");
	String keyword=request.getParameter("keyword");
	System.out.println("keyword:"+keyword);
	if(keyword==null){
%>
<script>
	alert("�˻�� �Է��Ͻʽÿ�.");
</script>
<table width="75%" align="center" border>
<br>	
<tr><th>å��ȣ</th><th>å����</th><th>�۰�</th><th>���ǻ�</th><th>��������</th><th>����</th></tr>
<%
	}
	Connection myConn=null;
	Statement stmt=null;
	Statement stmt2=null;
	ResultSet myResultSet=null;
	ResultSet myResultSet_ck=null;
	String dbdriver="oracle.jdbc.driver.OracleDriver";
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	String user="db1610049";
	String passwd="oracle";
	String mySQL="";
		
	try{
		Class.forName(dbdriver);
		myConn=DriverManager.getConnection(dburl,user,passwd);
	}catch(SQLException ex){
		System.out.println("SQLException: "+ex.getMessage());
	}
	stmt=myConn.createStatement();
	stmt2=myConn.createStatement();
	if(option.equals("title"))
		mySQL="select b_id,title,author,publisher,b_major from books where title='"+keyword+"'";
	else if(option.equals("author"))
		mySQL="select b_id,title,author,publisher,b_major from books where author='"+keyword+"'";
	else if(option.equals("publisher"))
		mySQL="select b_id,title,author,publisher,b_major from books where publisher='"+keyword+"'";
	else
		mySQL="select b_id,title,author,publisher,b_major from books where b_major='"+keyword+"'";
	String mySQL_ck="SELECT b_id FROM checkOut";
	myResultSet=stmt.executeQuery(mySQL);
	myResultSet_ck=stmt2.executeQuery(mySQL_ck);
	
	String state="���� ����";
	String b_id="";
	int st=1;
	
	if(myResultSet!=null){
		while(myResultSet.next()){
			b_id=myResultSet.getString("b_id");
			String title=myResultSet.getString("title");
			String author=myResultSet.getString("author");
			String publisher=myResultSet.getString("publisher");
			String major=myResultSet.getString("b_major");
			while(myResultSet_ck.next()){
				String ck_b_id=myResultSet_ck.getString("b_id");
				if(ck_b_id.equals(b_id)) {state="���� ��";st=0;}
			}
%>		
<tr>
<td align="center"><%=b_id%></td>
<td align="center"><%=title%></td>
<td align="center"><%=author%></td>
<td align="center"><%=publisher%></td>
<td align="center"><%=major%></td>
<td align="center"><a href="bookWork.jsp?b_id=<%=b_id%>&state=<%=st%>"><%=state%></a></td>
</tr>
<%
			state="���� ����";
			st=1;
		}
	}
	stmt.close();
	myConn.close();
%>
</table>
</body>
</html>