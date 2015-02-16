<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 29/1/15
  Time: 3:45 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Homepage</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=deivce-width, initial-scale=1">
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

      <!-- Latest compiled JavaScript -->
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

      <!-- override style and js -->
      <link rel="stylesheet" href="style/style.css"/>
  </head>
  <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
              <div class="container-fluid">
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
                  <div class="collapse navbar-collapse">
                      <form class="navbar-form navbar-right" role="search" method="post" action="page/login.jsp">
                          <div class="form-group">
                              <input type="email" class="form-control" name="email" placeholder="email">
                              <input type="password" class="form-control" name="password" placeholder="password">
                          </div>
                          <button type="submit" class="btn btn-default">Login</button>
                      </form>
                  </div>
              </div>
          </div>
      </nav>
      <div class="container" id="poster">
          <div class="jumbotron">
              <h1>MoodTrace</h1>
              <p>Intelligent mood tracing & analysis</p>
              <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#regModal">Sign up</button>
          </div>
          <div class="row">
              <div class="col-md-4">
                  <h2>Tracing</h2>
                  <p>MoodTrace is your private mood-diary: It helps you record your mood quantitatively</p>
              </div>
              <div class="col-md-4">
                  <h2>Analysis</h2>
                  <p>MoodTrace is your loyal assistant and friend: It helps you analyze your mood fluctuation and
                      listen to your heart</p>
              </div>
              <div class="col-md-4">
                  <h2>Care about who you care</h2>
                  <p>Ask your friend for the permission, or share your mood with them. In either way, your happiness
                  doubles</p>
              </div>
          </div>
      </div>
      <div class="navbar navbar-default navbar-fixed-bottom">
          <div class="container">
              <p>Created by Shuqi Zhang @ 29-01-2015</p>
          </div>
      </div>

      <!-- Modal HTML -->
      <div id="regModal" class="modal fade">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title">Sign up</h4>
                  </div>
                  <div class="modal-body">
                      <form class="form-horizontal" role="form" method="post" action="page/registration.jsp">
                          <div class="form-group">
                              <label for="email" class="control-label col-sm-4">Email</label>
                              <div class="col-sm-6">
                                  <input type="email" class="form-control" id="email"
                                         name="email" placeholder="Enter your email">
                              </div>
                          </div>
                          <div class="form-group">
                              <label for="pwd" class="control-label col-sm-4">Password</label>
                              <div class="col-sm-6">
                                  <input type="password" class="form-control" id="pwd"
                                         name="password" placeholder="Create a new password">
                              </div>
                          </div>
                          <div class="form-group">
                              <%--<label for="pwdConf" class="control-label col-sm-4">Confirm password</label>--%>
                              <div class="col-sm-offset-4 col-sm-6">
                                  <input type="password" class="form-control" id="pwdConf"
                                         placeholder="Confirm your password">
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="col-sm-offset-4 col-sm-6">
                                  <button type="submit" class="btn btn-primary">Submit</button>
                              </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>

  </body>

</html>
