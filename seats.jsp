<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<html>
<head>
<meta charset="EUC-KR">
<title>좌석 예약 시스템</title>
</head>
<body>
<%@ include file="top.jsp" %>


<table width="40%" align="center" id="seat_id">
<form method="post" action="seat_verify.jsp" name="seat_form">
	<tr height="50pt;">
		<td id="seat_tag" ><div align="center">좌석번호</div></td>
		<td><div align="center"><input type="text" name="seatID" id="seat_id_in"></div></td>
	</tr>
	</tr> 
	<tr><td colspan=2><div align="center" id = "seat_div_btn"> 
	<table width="75%" align="center" bgcolor="#FFFF99" border>
	<td align="center"><b><a href="seat_verify.jsp">좌석 예약</b></td>
	<td align="center"><b><a href="show.jsp">예약 좌석 조회</b></td>
	</div></td></tr> </table>
</form>
</body>

</html>