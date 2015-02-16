<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 30/1/15
  Time: 9:45 PM
--%>
<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mt_user","root","");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM users WHERE email='"+email+"' AND password = '"+password+"'");
        if (rs.next()){
            session.setAttribute("email",email);
            response.sendRedirect("mainPage.jsp");
        }
    }catch (ClassNotFoundException e1){
        System.out.println(e1);
    }catch (java.sql.SQLException e2){
        System.out.println(e2);

    }

%>
