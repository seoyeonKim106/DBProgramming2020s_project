<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head><title>å �˻�&��õ</title>
</head>
<body>
<%@include file="top.jsp"%>
	
<br><br>
	<table width="75%" align="center" border>
		<form method="post" action="bookInfo.jsp">
			<tr>
			<td colspan=1><div align="center">
				<br>
					<SELECT NAME="options">
				        <option value="title" selected>����</option>
				        <option value="author">�۰�</option>
				        <option value="publisher">���ǻ�</option>		
				        <option value="major">����</option>	
					</SELECT><p>
			</div></td>
			<td colspan=2><div align="center">
				<input type="text" name="keyword">
				<input TYPE="SUBMIT" VALUE="�˻�">
			</div></td>
			</tr>
		</form>
	</table>
	<br>
	<div align="center">
	<button type="button" onclick="javascript:location.href='bookList.jsp'">å ��� ���̱�</button>
	</div>
	<br><br>
	
<% 
	String recomd;
	if (session_id==null) recomd="empty";
	else recomd = (String)session.getAttribute("major");
	
	System.out.print(recomd);
	if(recomd.equals("empty")){	
%>
<table width="75%" align="center" border>
	<caption><strong>�������ü���</strong></caption>
	<td colspan=1><div align="center">
		<p>������ �� �� �����ϴ�. �α����Ͻʽÿ�.</p>
		</div></td>
</table>
<%
	}else{
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
		stmt2=myConn.createStatement();
		String mySQL="select b_id,title,author from books where b_major='"+recomd+"'";
		String mySQL_ck="SELECT b_id FROM checkOut";
		myResultSet=stmt.executeQuery(mySQL);
		myResultSet_ck=stmt2.executeQuery(mySQL_ck);
		
		String state="���� ����";
		int st=1;
		String b_id="";
		String title="";
		%>
		<table width="75%" align="center" border>
		<caption><strong>�������ü���</strong></caption>
		<tr>
			<th>å��ȣ</th>
			<th>����</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<%
		if(myResultSet!=null){
			while(myResultSet.next()){
				b_id=myResultSet.getString("b_id");
				title=myResultSet.getString("title");
				String author=myResultSet.getString("author");
				while(myResultSet_ck.next()){
					String ck_b_id=myResultSet_ck.getString("b_id");
					if(ck_b_id.equals(b_id)){ state="���� ��";st=0;}
				}
		%>	
		
		<tr>
		<td align="center"><%=b_id%></td>
		<td align="center"><%=title%></td>
		<td align="center"><%=author%></td>
		<td align="center"><a href="bookWork.jsp?b_id=<%=b_id%>&state=<%=st%>"><%=state%></a></td>
		</tr>
		<%
				state="���� ����";
				st=1;
			}
		}
		stmt.close();
		myConn.close();	
	}
%>

</body>
</html>