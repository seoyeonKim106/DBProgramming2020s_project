<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title>
</head>
<body>
	<%@include file="top.jsp"%>
	
	
	<table class="type04" align="center">
	<%
			if (session_id != null) {
		%>
    <tr>
        <td><%=session_id%>�� �湮�� ȯ���մϴ�.</td>
    </tr><%
			} else {
		%>
    <tr>
        <td>�α����� �� ����ϼ���.</td>
    </tr>
    <%
			}
		%>
</table>

</body>
</html>