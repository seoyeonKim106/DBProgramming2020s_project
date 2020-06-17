<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
<%
 	List<String> list=new ArrayList<>();
 	if(application.getAttribute("complete_list")!=null){
 		list=(List<String>)application.getAttribute("complete_list");
 	}
 	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>좌석 예약 시스템</title>
<link rel='stylesheet' href='./dbDesign.css' />
		<style type="text/css">
		#in_b, #in_b:visited {
			width: 80pt;
			font-size: 17pt;
			color: blue;	
		}
	</style>
</head>
<script>
	function show(url){
		document.location.href = url;
	}
</script>
<body>
	<%@include file="top.jsp"%>

<table width="70%" align="center" id="p_seat_table" style="font-size: 1.2em; ">
<tr style="background-color: #4682B4; color:white;">
				<th style="padding-top: 1%; padding-bottom: 1%;">좌석번호</th>
	</tr>
</table>
	<form action="seat_verify.jsp">
		<td align="center"></td>
		<div style="padding-right:20px;font-size: 9pt;">
		<h2 style="text-align:center">
		<input type="checkbox" name="seat" value="S1_A1" >S1_A1
		<input type="checkbox" name="seat" value="S1_A2" >S1_A2
		<input type="checkbox" name="seat" value="S1_A3" >S1_A3
		<input type="checkbox" name="seat" value="S1_A4" >S1_A4
		<input type="checkbox" name="seat" value="S1_A5" >S1_A5
		<br/>
		<input type="checkbox" name="seat" value="S1_B1" >S1_B1
		<input type="checkbox" name="seat" value="S1_B2" >S1_B2
		<input type="checkbox" name="seat" value="S1_B3" >S1_B3
		<input type="checkbox" name="seat" value="S1_B4" >S1_B4
		<input type="checkbox" name="seat" value="S1_B5" >S1_B5
		<br/>
		<input type="checkbox" name="seat" value="S1_C1" >S1_C1
		<input type="checkbox" name="seat" value="S1_C2" >S1_C2
		<input type="checkbox" name="seat" value="S1_C3" >S1_C3
		<input type="checkbox" name="seat" value="S1_C4" >S1_C4
		<input type="checkbox" name="seat" value="S1_C5" >S1_C5
		<br/>
		<input type="checkbox" name="seat" value="S1_D1" >S1_D1
		<input type="checkbox" name="seat" value="S1_D2" >S1_D2
		<input type="checkbox" name="seat" value="S1_D3" >S1_D3
		<input type="checkbox" name="seat" value="S1_D4" >S1_D4
		<input type="checkbox" name="seat" value="S1_D5" >S1_D5
		<br/>
		<input type="checkbox" name="seat" value="S6_A1" >S6_A1
		<input type="checkbox" name="seat" value="S6_A2" >S6_A2
		<input type="checkbox" name="seat" value="S6_A3" >S6_A3
		<input type="checkbox" name="seat" value="S6_A4" >S6_A4
		<br/>
		<input type="checkbox" name="seat" value="S6_B1" >S6_B1
		<input type="checkbox" name="seat" value="S6_B2" >S6_B2
		<input type="checkbox" name="seat" value="S6_B3" >S6_B3
		<input type="checkbox" name="seat" value="S6_B4" >S6_B4
		<br/>
		<input type="checkbox" name="seat" value="S6_C1" >S6_C1
		<input type="checkbox" name="seat" value="S6_C2" >S6_C2
		<input type="checkbox" name="seat" value="S6_C3" >S6_C3
		<input type="checkbox" name="seat" value="S6_C4" >S6_C4

		<br/>
		<br/>
		<input type="submit" value="좌석 예약"/>
		</form>
		<input type="button" value="예약 내역 조회" onclick="show('show.jsp');"/>
</h2>
</div>		
</body>
</html>