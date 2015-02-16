<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 1/2/15
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("email", null);
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>
