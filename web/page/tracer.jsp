<%@ page import="com.util.MoodManager" %>
<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 31/1/15
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MoodTrace - Trace</title>
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

</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top" id="navbar">
    <div class="container">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
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
                    <li><a href="tracer.jsp" class="btn btn-lg active"><span
                            class="glyphicon glyphicon-check"></span> Trace</a></li>
                    <li><a href="analyzer.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-tasks"></span>
                        Analyze</a></li>
                    <li><a href="friend.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-user"></span> Friends
                    </a></li>
                </ul>
                <ul class="navbar navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="btn btn-lg dropdown-toggle" data-toggle="dropdown" id="userDropdownBtn">
                            <%=session.getAttribute("email")%>
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
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </div>
</nav>
    <div class="container">
        <div class="row show-grid">
            <div class="col-md-12">
                <div id="accordion" class="list-group">
                    <a data-target="#" class="list-group-item disabled" id="summary">
                        <jsp:useBean id="card" class="com.po.MoodCard"/>
                        <%
                            String email=(String) session.getAttribute("email");
                            card= MoodManager.getMoodCard(email);
                            int count=MoodManager.countRecord(email);
                        %>
                        <div class="row">
                            <div class="col-md-3">
                                <img src="../image/eagle.jpg"/>
                            </div>
                            <div class="col-md-3">
                                <p><strong><%=session.getAttribute("name")%></strong></p>
                                <p>Level +infinity</p>
                                <p><%=count%> records</p>
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group">
                                    <li class="list-group-item disabled">Mood Card</li>
                                    <li class="list-group-item">
                                        <% if(card!=null){ %>
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
                                        <% }else {%>
                                        <p>No record</p>
                                        <% } %>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </a>
                    <div class="list-group-collapse collapse" id="list">
                        <%--<a class="list-group-item btn disabled" href="#">--%>
                            <%--<ul class="list-group">--%>
                                <%--<li class="list-group-item">--%>
                                    <%----%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</a>--%>
                        <div class="container">
                            <h3>Please record your mood indices</h3>
                            <form role="form" action="moodTrace.jsp" method="post">
                                <div class="form-group col-sm-5">
                                    <label for="moodp">Pleasure</label>
                                    <input class="form-control" type="number" name="mood[p]" id="moodp"/>
                                </div>
                                <div class="form-group col-sm-5">
                                    <label for="moodh">Happiness</label>
                                    <input class="form-control" type="number" name="mood[h]" id="moodh"/>
                                </div>
                                <div class="form-group col-sm-5">
                                    <label for="moods">Pleasure</label>
                                    <input class="form-control" type="number" name="mood[s]" id="moods"/>
                                </div>
                                <div class="form-group col-sm-5">
                                    <label for="mooda">Happiness</label>
                                    <input class="form-control" type="number" name="mood[a]" id="mooda"/>
                                </div>
                                <div class="form-group col-sm-10">
                                    <label for="remark">Remark</label>
                                    <input class="form-control input-lg" type="text" name="remark" id="remark"/>
                                </div>
                                <div class="form-group col-sm-5">
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <a class="list-group-item btn btn-lg" data-toggle="collapse" data-parent="#accordion"
                       data-target="#list">Record</a>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
