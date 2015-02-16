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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

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
                    <li><a href="mainPage.jsp" class="btn btn-lg active"><span
                            class="glyphicon glyphicon-check"></span> Trace</a></li>
                    <li><a href="analyzer.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-tasks"></span>
                        Analyze</a></li>
                    <li><a href="friend.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-user"></span> Friends
                    </a></li>
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
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </div>
</nav>
    <div class="container">
        <div class="row show-grid">
            <div class="col-md-12">
                <div id="accordion" class="list-group">
                    <a data-target="#" class="list-group-item disabled" id="summary">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="../image/itbg.png"/>
                            </div>
                            <div class="col-md-3">
                                <p><strong>Shuqi Zhang</strong></p>
                                <p>Level +infinity</p>
                                <p>1200 records</p>
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group">
                                    <li class="list-group-item disabled">Mood Card</li>
                                    <li class="list-group-item">recent record</li>
                                </ul>
                            </div>
                        </div>
                    </a>
                    <div class="list-group-collapse collapse" id="list">
                        <a class="list-group-item btn disabled" href="#">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-1 col-md-offset-1 btn btn-lg minusBtn">-</div>
                                        <div class="col-md-8">
                                            <div class="row">
                                                <%--<div class="col-md-12 btn disabled">PLEASURE</div>--%>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" style="width:50%">
                                                        <p>Pleasure index</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="col-md-1 btn btn-lg plusBtn">+</button>
                                    </div>
                                </li>
                            </ul>

                        </a>
                    </div>
                    <a class="list-group-item btn btn-lg" data-toggle="collapse" data-parent="#accordion"
                       data-target="#list">Record</a>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
