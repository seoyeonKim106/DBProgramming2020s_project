<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head><title>책 대출 및 예약</title>
</head>
<body>
<%@include file="top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String state=request.getParameter("state");
	String b_id=request.getParameter("b_id");
	System.out.println(b_id+"/"+state);
	session_id=(String)session.getAttribute("user");
	if(session_id==null){
%>
<script>
	alert("로그인이 필요한 서비스입니다.");
	location.href="login.jsp";
</script>
	<%
	}
	if(state.equals("1")){
%>
<td colspan=2><div align="center">
		<br><br>
		<button type="button" onclick="javascript:location.href='bookWork_verify.jsp?b_id=<%=b_id%>'">대출</button>
		<button type="button" onclick="javascript:location.href='bookWork_verify.jsp?b_id=<%=b_id%>'">예약</button>
</div></td>
<%
	}else{
%>
<script>
	alert("대출 중인 도서입니다.\n예약만 가능합니다.");
</script>
<td colspan=1><div align="center">
	<br><br>
	<button type="button" onclick="javascript:location.href='bookWork_verify.jsp?b_id=<%=b_id%>'">예약</button>
</div></td>
<%
	}
%>

</body>
</html>