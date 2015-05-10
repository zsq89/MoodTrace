<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 9/5/15
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.po.MoodCard" %>
<%@ page import="java.io.Writer" %>
<jsp:useBean id="card" class="com.po.MoodCard"/>
<%
    int i=Integer.parseInt(request.getParameter("Id"));
    card=(MoodCard)((ArrayList)session.getAttribute("list")).get(i);
%>
<div>
    <p><%=card.getRecordDate()+" "+card.getRecordTime()%></p>
    <p><%=card.getMoodValue()%></p>
    <%
        int[] mood=card.getMood();
    %>
    <p>Pleasure: <%=mood[0]%></p>
    <p>Happiness: <%=mood[1]%></p>
    <p>Sorrow: <%=mood[2]%></p>
    <p>Anger: <%=mood[3]%></p>
    <p><%=card.getRemark()%></p>
</div>

