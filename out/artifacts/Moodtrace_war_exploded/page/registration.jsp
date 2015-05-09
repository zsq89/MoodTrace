<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 31/1/15
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="newUser" class="com.po.User" scope="page"/>
<jsp:useBean id="profile" class="com.po.UserProfile"/>
<jsp:setProperty name="newUser" property="*"/>
<jsp:setProperty name="profile" property="name"/>
<jsp:setProperty name="profile" property="gender"/>

<%
    String dob=request.getParameter("birthday");
    SimpleDateFormat dft=new SimpleDateFormat("yyyy-MM-dd");
    try{
        System.out.println(dob);
        Date dt=dft.parse(dob);
        java.sql.Date dtSql=new java.sql.Date(dt.getTime());
        profile.setBirthday(dtSql);
    }catch (Exception ex){
        ex.printStackTrace();
    }
    int i=0;
    i= UserLogSys.Register(newUser,profile);
        if (i>0){
            System.out.println("success");
            session.setAttribute("email",newUser.getEmail());
            session.setAttribute("name",profile.getName());
            response.sendRedirect("tracer.jsp");
        }
        else {
            System.out.println("error");
            response.sendRedirect("index.jsp");
        }
%>