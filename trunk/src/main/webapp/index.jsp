<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<html>
<body>
	<h2>Hello World!</h2>
	<%
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:jboss/datasources/MySqlDS");
	Connection connection = ds.getConnection();
	PreparedStatement pstmt = connection.prepareStatement("select * from employee");
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		%><%=rs.getInt("id")%><%
	}
	 %>
</body>
</html>
