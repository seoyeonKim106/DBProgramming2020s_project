<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<% String session_id = (String) session.getAttribute("user");
String log;
if (session_id == null)
log = "<a href=login.jsp>�α���</a>";
else log = "<a href=logout.jsp>�α׾ƿ�</a>"; %>
<p style="text-align: center;">
<a href=main.jsp><img src="sym01_l.gif"  height="100"></a>
<a href=main.jsp><img src="log01_l_01.gif" height="80"></a>
</p>


<table class="type04" align = 'center'>
    <tr>
        <td><b><%=log%></b></td>
        <td><b><a href="update.jsp">����� ���� ����</b></td>
        <td><b><a href="bookMenu.jsp">å ���� �� ����</b></td>
        <td><b><a href="seats.jsp">�¼� ����</b></td>
        <td><b><a href="select.jsp">����� ���� ��ȸ</b></td>
    </tr>
    
</table>


</body>
</html>