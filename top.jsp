<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("user");
String log;
if (session_id == null)
log = "<a href=login.jsp>로그인</a>";
else log = "<a href=logout.jsp>로그아웃</a>"; %>
<table width="75%" align="center" bgcolor="#FFFF99" border>
<tr>
<td align="center"><b><%=log%></b></td>
<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td>
<td align="center"><b><a href="bookMenu.jsp">책 대출 및 예약</b></td>
<td align="center"><b><a href="seats.jsp">좌석 예약</b></td>
<td align="center"><b><a href="select.jsp">사용자 정보 조회</b></td>
</tr>
</table>