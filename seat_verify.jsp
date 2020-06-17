<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	/* List<String> list=new ArrayList<>();
	if(application.getAttribute("complete_list")!=null){
		list=(List<String>)application.getAttribute("complete_list");
	}
	String[] seat=request.getParameterValues("seat");
	List<String> temp=new ArrayList<>();
	int count =0;
	for(String s:seat){
		if(list.contains(s)){
			break;
		}
		else{
			temp.add(s);
			count++;
		}
	}
	if(count==seat.length){
		list.addAll(temp);
	}
	application.setAttribute("complete_list",list); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<link rel='stylesheet' href='./dbDesign.css' />
<body>
	<%@include file="top.jsp"%>

<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	//String user = "db1416688";
	String user = "db1713926";
	//String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	//String user = "db1610049";

	String passwd = "oracle";
	Statement stmt=null;
	String mySQL = null;
	String sql=null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
	String today = formatter.format(new java.util.Date());
	
	List<String> list=new ArrayList<>();
	if(application.getAttribute("complete_list")!=null){
		list=(List<String>)application.getAttribute("complete_list");
	}
	String[] seat=request.getParameterValues("seat");
	List<String> temp=new ArrayList<>();
	int count =0;
	if(seat==null||seat.length>1){
%>
		        <script>   
		           alert("다시 선택해주세요.");
		           location.href="seats.jsp";
		        </script>
<%
		}
	else{
		for(String s:seat){
			if(list.contains(s)){
				break;
			}
			else{
				temp.add(s);
				count++;
			}
		}
		if(count==seat.length){
			list.addAll(temp);
		}
	application.setAttribute("complete_list",list);
	
		if(count!=seat.length){
%>		
			<script>   
				alert("이미 예약되었습니다.");
				location.href="seats.jsp";
			</script>
<%
		}
%>
		<div align="center">
			<h2>좌석 예약 결과</h2>
			<p>
				선택한 좌석<br>
<% 
		for(String s:seat){
			out.print("<b>["+s+"]</br>");
		}
%>
		<br> 가 예약되었습니다.
		</p>
		<a href="seats.jsp">뒤로가기</a>
		</div>
<%
	try{		
			myConn = DriverManager.getConnection(dburl, user, passwd);
			stmt=myConn.createStatement();
			for(int i=0;i<seat.length;i++){	
				sql="update seats set seat_id='" + seat[i] +"',res_id='"+session_id+"',res_date='"+today+"' where seat_id='" + seat[i] + "'";
				rs2=stmt.executeQuery(sql);
			}
		stmt.close();
		myConn.close();
		
	}catch(SQLException e){
	    out.println(e);
	    e.printStackTrace();
	}
}
%>
</body>
</html>