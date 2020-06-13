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
	<meta charset="UTF-8">
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
	String user = "db1713926";
	String pw = "oracle";
	
	Connection con = DriverManager.getConnection(dburl, user, pw);
	
	String query_books = "select * from books where res_id="+session_id;
	String query_seats = "select * from seats where res_id="+session_id;

	Statement stmt_books = con.createStatement();
	Statement stmt_seats = con.createStatement();
	
	ResultSet rs_books = stmt_books.executeQuery(query_books);
	ResultSet rs_seats = stmt_seats.executeQuery(query_seats);

	String title = null;
	String author = null;
	String publisher = null;
	String date_book = null;
	
	String seat = null;
	String date_seat = null;
	
	SimpleDateFormat bookFormat = new SimpleDateFormat("yyyy-mm-dd");
	SimpleDateFormat seatFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm");

	int count = 0;
%>
	<table width="75%" align="center">
		<tr>
			<td align="center"><b><%=session_id%>님 도서 대출 내역 </b></td>
		</tr>
		<%
			while (rs_books.next()) {
				count++;
				title = rs_books.getString("title");
				author = rs_books.getString("author");
				publisher = rs_books.getString("publisher");
				date_book = rs_books.getString("res_date");
				date_book = bookFormat.format(bookFormat.parse(date_book));
		%>
			<tr>
				<td><%=title%> </td>
				<td><%=author%></td>
				<td><%=publisher%></td>
				<td>반납 기한:<%=date_book%> </td>
				
			</tr>
		<%
			}
		
			if (count == 0){
		%>
		<tr>
			<td>대출 내역이 없습니다.</td>
		</tr>
		<%} else { %>
		<tr>
			<td>총 <%=count%>권 대출하셨습니다.</td>
		</tr>
		<% } %>
		<tr>
			<td align="center"><b><%=session_id%>님 좌석 예약 및 사용 현황 </b></td>	
		</tr>
		<%
			while (rs_seats.next()) {
				seat = rs_seats.getString("seat_id");
				date_seat = rs_seats.getString("res_date");
				System.out.println(date_seat);
				date_seat = seatFormat.format(seatFormat.parse(date_seat));
		%>
			<tr>
				<td>예약 좌석: <%=seat%> </td>
				<td>예약 시각: <%=date_seat%> </td>
			</tr>
		<%
			}
		%>
		
	</table>

</body>
</html>