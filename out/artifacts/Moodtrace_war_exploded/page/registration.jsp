<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 31/1/15
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mt_user", "root", "");
        Statement st = con.createStatement();
        int i = st.executeUpdate("INSERT INTO users(email,password,regdate) VALUES ('"+email+"','"+password+"',CURRENT_DATE())");
        if (i>0){
            System.out.println("success");
            session.setAttribute("email",email);
            response.sendRedirect("mainPage.jsp");
        }
        else {
            System.out.println("error");
            response.sendRedirect("index.jsp");
        }
    }catch (ClassNotFoundException e1){
        System.out.println(e1);
    }catch (java.sql.SQLException e2){
        System.out.println(e2);
    }

%>