<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>
<body>
	<%@include file="top.jsp"%>
	
	
	<table class="type04" align="center">
	<%
			if (session_id != null) {
		%>
    <tr>
        <td><%=session_id%>님 방문을 환영합니다.</td>
    </tr><%
			} else {
		%>
    <tr>
        <th scope="row">항목명</th>
        <td>로그인한 후 사용하세요.</td>
    </tr>
    <%
			}
		%>
</table>

</body>
</html>