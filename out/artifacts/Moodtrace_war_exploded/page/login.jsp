<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 30/1/15
  Time: 9:45 PM
--%>
<%@ page import="com.util.*" contentType="text/html;charset=UTF-8" language="java"%>
<jsp:useBean id="user" class="com.po.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<jsp:useBean id="profile" class="com.po.UserProfile"/>
<%
    boolean result;
    String email=user.getEmail();
    result=UserLogSys.Login(user);
    if (result){
            session.setAttribute("email",email);
            profile=UserProfileManager.getProfile(email);
            if(profile!=null)
                session.setAttribute("name",profile.getName());
            response.sendRedirect("tracer.jsp");
        }
%>
