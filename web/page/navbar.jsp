<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 1/2/15
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

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
                    <li><a href="#" class="btn btn-lg"><span class="glyphicon glyphicon-check"></span> Trace</a></li>
                    <li><a href="#" class="btn btn-lg"><span class="glyphicon glyphicon-tasks"></span> Analyze</a></li>
                    <li><a href="#" class="btn btn-lg"><span class="glyphicon glyphicon-user"></span> Friends</a></li>
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
</body>
</html>
