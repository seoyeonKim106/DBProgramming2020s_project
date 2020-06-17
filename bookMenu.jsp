<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head><title>책 검색&추천</title>
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
				        <option value="title" selected>제목</option>
				        <option value="author">작가</option>
				        <option value="publisher">출판사</option>		
				        <option value="major">전공</option>	
					</SELECT><p>
			</div></td>
			<td colspan=2><div align="center">
				<input type="text" name="keyword">
				<input TYPE="SUBMIT" VALUE="검색">
			</div></td>
			</tr>
		</form>
	</table>
	<br>
	<div align="center">
	<button type="button" onclick="javascript:location.href='bookList.jsp'">책 모두 보이기</button>
	</div>
	<br><br>
	
<% //session_id=(String)session.getAttribute("user");
	String recomd;
	if(session_id==null)
	recomd="empty";
	else recomd=(String)session.getAttribute("major");
	
	if(recomd.equals("empty")){	
%>
<table width="75%" align="center" border>
	<caption><strong>전공관련서적</strong></caption>
	<td colspan=1><div align="center">
		<p>전공을 알 수 없습니다. 로그인하십시오.</p>
		</div></td>
</table>
<%
	}else{
		
%>
<table width="75%" align="center" border>
<caption><strong>전공관련서적</strong></caption>
<tr><th>책번호</th><th>책제목</th><th>작가</th><th>상태</th></tr>
<%
		Connection myConn=null;
		Statement stmt=null;
		Statement stmt2=null;
		ResultSet myResultSet=null;
		ResultSet myResultSet_ck=null;
		String dbdriver="oracle.jdbc.driver.OracleDriver";
		//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
		//String user="db1713926";
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
		String mySQL="select B.b_id, B.title, B.author, B.publisher,  NVL(C.s_id, '대출자 없음') as s_id"+
				" from books B, checkout C where B.b_id = C.b_id (+) and B.b_major = '"+recomd+"'";
		myResultSet=stmt.executeQuery(mySQL);
		
		String state="대출 가능";
		int st=1;
		String b_id="";
		String title="";
		String author;
		String s_id ;
		
		if(myResultSet!=null){
			
			while(myResultSet.next()){
				b_id=myResultSet.getString("b_id");
				title=myResultSet.getString("title");
				author=myResultSet.getString("author");
				s_id = myResultSet.getString("s_id");

				if (!s_id.equals("대출자 없음")){
					state="대출 중";
					st=0;
				
				}
				%>	
				<tr>
					<td align="center"><%=b_id%></td>
					<td align="center"><%=title%></td>
					<td align="center"><%=author%></td>
					<td align="center"><a href="bookWork.jsp?b_id=<%=b_id%>&state=<%=st%>"><%=state%></a></td>
				</tr>
				<%
				state="대출 가능";
				st=1;
			}
		}
		stmt.close();
		myConn.close();	
	}
%>

</body>
</html>