<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 6/2/15
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MoodTrace - Analyze</title>
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
    <link rel="stylesheet" href="../style/analyzer.css"/>

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
                    <li><a href="mainPage.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-check"></span> Trace</a></li>
                    <li><a href="analyzer.jsp" class="btn btn-lg active"><span
                            class="glyphicon glyphicon-tasks"></span> Analyze</a></li>
                    <li><a href="friend.jsp" class="btn btn-lg"><span class="glyphicon glyphicon-user"></span> Friends</a></li>
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
        <div class="row">
            <div class="col-md-4">
                <div id="accordion" class="list-group sidebar">
                    <div data-target="#" class="list-group-item disabled" id="title"><strong>Analyzer</strong></div>
                    <a class="list-group-item btn" data-toggle="collapse" data-parent="#accordion"
                       data-target="#period">Period</a>
                    <div class="list-group-collapse collapse" id="period">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Month | Week | Day</h3>
                        </a>
                    </div>
                    <a class="list-group-item btn" data-toggle="collapse" data-parent="#accordion"
                       data-target="#function">Function</a>
                    <div class="list-group-collapse collapse" id="function">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Month | Week | Day</h3>
                        </a>
                    </div>
                    <a class="list-group-item btn" data-toggle="collapse" data-parent="#accordion"
                       data-target="#filter">Filter</a>
                    <div class="list-group-collapse collapse" id="filter">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Month | Week | Day</h3>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="list-group">
                    <div data-target="#" class="list-group-item summary">
                        <p>2015/02/08 10:30am</p>
                        <p>Mood value: + 7.2</p>
                    </div>
                    <a class="list-group-item btn" data-toggle="collapse" data-target="#1234"><strong>+</strong></a>
                    <div class="list-group-collapse collapse" id="1234">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Mood record</h3>
                            <p>a,b,c,d</p>
                            <h3>Note</h3>
                            <p>bla bla bla</p>
                        </a>
                    </div>
                </div>
                <div class="list-group">
                    <div data-target="#" class="list-group-item summary">
                        <p>2015/02/08 10:30am</p>
                        <p>Mood value: + 7.2</p>
                    </div>
                    <a class="list-group-item btn" data-toggle="collapse" data-target="#1235"><strong>+</strong></a>
                    <div class="list-group-collapse collapse" id="1235">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Mood record</h3>
                            <p>a,b,c,d</p>
                            <h3>Note</h3>
                            <p>bla bla bla</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="list-group">
                    <div data-target="#" class="list-group-item summary">
                        <p>2015/02/08 10:30am</p>
                        <p>Mood value: + 7.2</p>
                    </div>
                    <a class="list-group-item btn" data-toggle="collapse" data-target="#1244"><strong>+</strong></a>
                    <div class="list-group-collapse collapse" id="1244">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Mood record</h3>
                            <p>a,b,c,d</p>
                            <h3>Note</h3>
                            <p>bla bla bla</p>
                        </a>
                    </div>
                </div>
                <div class="list-group">
                    <div data-target="#" class="list-group-item summary">
                        <p>2015/02/08 10:30am</p>
                        <p>Mood value: + 7.2</p>
                    </div>
                    <a class="list-group-item btn" data-toggle="collapse" data-target="#1245"><strong>+</strong></a>
                    <div class="list-group-collapse collapse" id="1245">
                        <a class="list-group-item btn disabled" href="#">
                            <h3>Mood record</h3>
                            <p>a,b,c,d</p>
                            <h3>Note</h3>
                            <p>bla bla bla</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
