<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<style type="text/css">
	* {
		font-family: ppi;
	}
</style>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>도서관 사용자 정보 조회 </title>
	<link rel='stylesheet' href='./dbDesign.css' />	
</head>
<body>
<%@ include file="top.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";	
	String user = "db1610049";
	//String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	//String user = "db1713926";
	String pw = "oracle";
	
	Connection con = DriverManager.getConnection(dburl, user, pw);
	
	String b_id ;
	String title = null;
	String author = null;
	String publisher = null;
	String date_book = null;
	
	String seat = null;
	String date_seat = null;
	
	SimpleDateFormat bookFormat = new SimpleDateFormat("yyyy-mm-dd");
	SimpleDateFormat seatFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm");

	String query_reserv_books ;
	String query_check_out_books ;
	String query_seats = "select * from seats where res_id="+session_id;

	Statement stmt_reserv_books = con.createStatement();
	Statement stmt_check_out_books = con.createStatement();
	Statement stmt_seats = con.createStatement();

	ResultSet rs_reserv_books ;
	ResultSet rs_check_out_books;
	ResultSet rs_seats = stmt_seats.executeQuery(query_seats);

	int count = 0;
	int count_ck = 0;

	if (session_id == null) { 
		
	%>
		<script> 
			alert("로그인 후 사용하세요."); 
			location.href="login.jsp";  
		</script>
	<% } else {
	%>
		<table class="type02" width="75%" align="center">
			<tr>
				<td><b><%=session_id%>님 도서 예약 내역 </b></td><p>
			</tr>
			<%
				query_reserv_books = "select * from books, reserve " + 
										 "where books.b_id=reserve.b_id " + 
										 "and reserve.s_id='"+session_id+"'";
					
				rs_reserv_books = stmt_reserv_books.executeQuery(query_reserv_books);
					
				while (rs_reserv_books.next()) {
					b_id = rs_reserv_books.getString("b_id");
					title = rs_reserv_books.getString("title");
					author = rs_reserv_books.getString("author");
					publisher = rs_reserv_books.getString("publisher");
				
					count++;
					
				%>
					<tr>
						<th scope="row"><%=count%></th>
						<td><%=title%> </td>
						<td><%=author%></td>
						<td><%=publisher%></td>
						<td><b><a href="resDelete.jsp?b_id=<%=b_id%>">예약 취소</b></td>
					</tr>
				<%
					
				}
				if (count == 0){
			%>
			<tr>
				<td align="center">예약 내역이 없습니다.</td><p>
			</tr>
			<%} else { %>
			<tr>
				<td align="center">총 <%=count%>권 예약하셨습니다.</td><p>
			</tr>
			<% } %>
		</table>
		<table class="type02" width="75%" align="center">
			<tr>
				<td><b><%=session_id%>님 도서 대출 내역 </b></td><p>
			</tr>
				<%
				query_check_out_books = "select * from books, checkout "+
						"where books.b_id=checkout.b_id and " + 
						"checkout.s_id='" + session_id + "'";		
				System.out.println(query_check_out_books);
				rs_check_out_books = stmt_check_out_books.executeQuery(query_check_out_books);
							
				while (rs_check_out_books.next()) {
					count_ck++;
					
					b_id = rs_check_out_books.getString("b_id");
					title = rs_check_out_books.getString("title");
					author = rs_check_out_books.getString("author");
					publisher = rs_check_out_books.getString("publisher");
					date_book = rs_check_out_books.getString("ck_date");
					
					%>
						<tr>
							<th scope="row"><%=count_ck%></th>
							<td><%=title%> </td>
							<td><%=author%></td>
							<td><%=publisher%></td>
							<td><%=date_book%></td>
							
							<td><b><a href="returnBook.jsp?b_id=<%=b_id%>">반납</b></td>
						</tr>
					<%
				}
				if (count_ck == 0){
			%>
			<tr>
				<td align="center">대출 내역이 없습니다.</td><p>
			</tr>
			<%} else { %>
			<tr>
				<td align="center">총 <%=count_ck%>권 대출하셨습니다.</td><p>
			</tr>
			<% 			
			} 						
			%>
		</table>
		<table class="type02" width="75%" align="center">
			<tr>
				<td><b><%=session_id%>님 좌석 예약 내역 </b></td><p>
			</tr>
			<%
				int count_seats = 0;
				while (rs_seats.next()) {
					count_seats++;
					
					seat = rs_seats.getString("seat_id");
					date_seat = rs_seats.getString("res_date");
					date_seat = seatFormat.format(seatFormat.parse(date_seat));
			%>
				<tr>
					<th scope="row">예약 좌석</th>
					<td><%=seat%> </td><p>
				</tr>
				<tr>
					<th scope="row">예약 시각</th>
					<td><%=date_seat%> </td><p>
				</tr>
			<%
				}
				if (count_seats == 0){
					%>
					<tr>
						<td align="center">예약하신 좌석이 없습니다.</td><p>
					</tr>
					<%
				}
			%>
			
		</table>

	<%
	}%>
</body>
</html>