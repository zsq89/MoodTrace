<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 6/2/15
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.po.MoodCard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.util.MoodManager" %>
<html>
<head>
    <title>MoodTrace - Analyze</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=deivce-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <%--jquery lib--%>
    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- override style and js -->
    <link rel="stylesheet" href="../style/style.css"/>
    <link rel="stylesheet" href="../style/main.css"/>
    <link rel="stylesheet" href="../style/analyzer.css"/>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" id="navbar">
    <div class="container">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    Mood<strong>Trace</strong>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="tracer.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-check"></span> Trace
                    </a></li>
                    <li><a href="analyzer.jsp" class="btn btn-lg active"><span
                            class="glyphicon glyphicon-tasks"></span> Analyze</a></li>
                    <li><a href="friend.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-user"></span>
                        Friends</a></li>
                </ul>
                <ul class="navbar navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="btn btn-lg dropdown-toggle" data-toggle="dropdown" id="userDropdownBtn">
                            <%= session.getAttribute("email") %>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" class="btn btn-lg"><span class="glyphicon glyphicon-wrench"></span>
                                Edit profile</a></li>
                            <li><a href="#" class="btn btn-lg"><span class="glyphicon glyphicon-info-sign"></span>
                                Help</a></li>
                            <li><a href="logout.jsp" class="btn btn-lg"><span
                                    class="glyphicon glyphicon-off"></span>
                                Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </div>
</nav>
<div class="container-fluid main-panel">
        <div class="col-md-3 left">
            <ul class="list-group">
                <li class="list-group-item">
                    <a href="#">function</a>
                </li>
                <li class="list-group-item">
                    <a href="#">function</a>
                </li>
                <li class="list-group-item">
                    <a href="#">function</a>
                </li>
            </ul>
        </div>
        <%--get mood cards in recent one week--%>
        <jsp:useBean id="periodUtil" class="com.util.MoodPeriodUtil"/>
        <%
            java.sql.Date[] thisWeek;
            long theFuture = System.currentTimeMillis() - (86400 * 7 * 1000);
            Date dt = new Date(theFuture);
            thisWeek = periodUtil.getThisWeek(dt);
            ArrayList<MoodCard> list;
            String email = (String) session.getAttribute("email");
            list = MoodManager.getMoodCard(email, thisWeek[0], thisWeek[1]);
            MoodCard selectedCard=null;
        %>
        <div class="col-md-3 middle">
            <%
                if (list != null && list.size()!=0) {
                    selectedCard=list.get(0);
            %>
            <%--display mood list--%>
            <ul class="list-group">
                <% for (MoodCard card : list) {%>
                <li class="list-group-item">
                    <a href="#">
                        <p><%=card.getRecordDate() + "  " + card.getRecordTime()%>
                        </p>
                        <p>Mood value: <%=card.getMoodValue()%>
                        </p>
                    </a>
                </li>
                <% } %>
            </ul>
            <% } else { %>
            <p>No record for this week</p>
            <%}%>
        </div>
        <div class="col-md-6 right">
            <ul class="list-group">
                <li class="list-group-item card-panel-header">
                    <h3>This is your card</h3>
                </li>
                <li class="list-group-item card-panel-body">

                    <% if(selectedCard!=null){ %>
                    <p><%=selectedCard.getRecordDate()+" "+selectedCard.getRecordTime()%></p>
                    <p><%=selectedCard.getMoodValue()%></p>
                    <%
                        int[] mood=selectedCard.getMood();
                    %>
                    <p>Pleasure: <%=mood[0]%></p>
                    <p>Happiness: <%=mood[1]%></p>
                    <p>Sorrow: <%=mood[2]%></p>
                    <p>Anger: <%=mood[3]%></p>
                    <p><%=selectedCard.getRemark()%></p>
                    <% }else {%>
                    <p>No record</p>
                    <% } %>
                </li>
            </ul>
        </div>
    </div>


<%--<h3>Mood record</h3>--%>
<%--<%--%>
<%--int[] mood=card.getMood();--%>
<%--%>--%>
<%--<p>Pleasure: <%=mood[0]%></p>--%>
<%--<p>Happiness: <%=mood[1]%></p>--%>
<%--<p>Sorrow: <%=mood[2]%></p>--%>
<%--<p>Anger: <%=mood[3]%></p>--%>
<%--<h3>Notes</h3>--%>
<%--<p><%=card.getRemark()%></p>--%>

</body>
</html>
