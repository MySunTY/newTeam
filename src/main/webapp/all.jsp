<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체사원 조회</title>
		<link rel="stylesheet" href="css/header.css">
		<style>
			table, th, td{
				border: 1px solid black;
				border-collapse: collapse;
			}
			th, td{
				padding: 10px;			
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="contents">
				<div class="title">
					<h2>전제사원 조회</h2>
				</div>
				<div>
					<%
						Connection conn=null;
						Statement stmt=null;
						ResultSet rs=null;
						
						String url="jdbc:mysql://127.0.0.1:3306/team";
						String db_id="root";
						String db_pw="12345678";
						
						try{
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn=DriverManager.getConnection(url, db_id, db_pw);
							String sql="select * from member;";
							stmt=conn.createStatement();
							System.out.println(sql);
							rs=stmt.executeQuery(sql);
							%>
								<div id="inner_wrap">
									<table>
										<tr>
											<th>사번</th>
											<th>이름</th>
											<th>입사일</th>
											<th>주소</th>
											<th>연락처</th>
											<th>이메일</th>
											<th>삭제</th>
										</tr>
							<%
							while(rs.next()){
								String m_num=rs.getString("m_num");
								String name=rs.getString("name");
								String join_date=rs.getString("join_date");
								String address=rs.getString("address");
								String phone=rs.getString("phone");
								String email=rs.getString("email");
							%>			<tr>
											<td><%=m_num %></td>
											<td><%=name %></td>
											<td><%=join_date %></td>
											<td><%=address %></td>
											<td><%=phone %></td>
											<td><%=email %></td>
											<td>
												<form method="post" action="all_delete.jsp">
													<input type="hidden" value="<%=m_num %>" name="delete">
													<input type="submit" value="삭제">
												</form>
											</td>
										</tr>	
								<%
							}
							%>
									</table>
								</div>
							<%
						}catch(Exception e){
							System.out.println("접속 중 오류 발생 : "+e);
						}finally{	
							try{	
								if(rs!=null)rs.close();
								if(stmt!=null)stmt.close();
								if(conn!=null)conn.close();
							}catch(Exception ex){	
								System.out.println("접속 해제 중 오류 발생 : "+ex);
							}
						}
					%>
			</div>
		</div>
	</body>
</html>