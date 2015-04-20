<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 30/3/15
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.lang.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.util.*" %>
<jsp:useBean id="card" class="com.po.MoodCard"/>
<jsp:setProperty name="card" property="*"/>
<%
    String email= (String) session.getAttribute("email");
    String ind=request.getParameter("mood");
    System.out.println(ind);
    boolean result;
    result=MoodManager.moodTrace(email,card);
    if (result){
      response.sendRedirect("tracer.jsp");
    }else {
      response.sendRedirect("analyzer.jsp");
      System.out.println("error");
    }
%>
