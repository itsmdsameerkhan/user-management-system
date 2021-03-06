

<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    String first_name = (String) session.getAttribute("first_name");
    if (first_name != null) {
        first_name = first_name.substring(0, 1).toUpperCase() + first_name.substring(1);
    }
    Date loggedIn = new Date(session.getCreationTime());

    if (isLoggedIn != "true" || first_name == null) {
        response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Conquerors</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/clock.js"></script>
        <style>
            #timedate {
                font: small-caps lighter 43px/150% "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
                text-align: left;
                float: right;
                color:#000;
                border-left: 3px solid #3445B4;
                padding-left: 30px;
            }
        </style>
    </head>
    <body onLoad="initClock()">

        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle Menu</span>
                    </button>
                </div>
                <div class="p-4">
                    <h1><a href="index.html" class="logo">Conquerors <span>User Management System</span></a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li class="active">
                            <a href="dashboard.jsp"><span class="fa fa-home mr-3"></span> Dashboard</a>
                        </li>
                        <li>
                            <a href="me.jsp"><span class="fa fa-user mr-3"></span> Profile</a>
                        </li>
                        <li>
                            <a href="history.jsp"><span class="fa fa-history mr-3"></span> History</a>
                        </li>
                        <li>
                            <a href="portal.jsp"><span class="fa fa-cogs mr-3"></span> Admin Portal</a>
                        </li>
                        <li>
                            <a href="contacts.jsp"><span class="fa fa-paper-plane mr-3"></span> Contacts</a>
                        </li>
                        <li>
                            <a href="logout.jsp"><span class="fa fa-sign-out mr-3"></span> Log Out</a>
                        </li>
                    </ul>

                    <div class="mb-5">
                        <h3 class="h6 mb-3">For Newsletters: </h3>
                        <form action="#" class="subscribe-form">
                            <div class="form-group d-flex">
                                <div class="icon"><span class="icon-paper-plane"></span></div>
                                <input type="text" class="form-control" placeholder="Enter Email Address">
                            </div>
                        </form>
                    </div>
                </div>
            </nav>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <div style="width: 70%; display: inline-block;">
                    <a class="weatherwidget-io" href="https://forecast7.com/en/27d7285d32/kathmandu/" data-label_1="Today's Weather" data-label_2="Kathmandu" data-theme="weather_one" >Today's Weather Kathmandu</a>
                    <script>
                        !function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (!d.getElementById(id)) {
                                js = d.createElement(s);
                                js.id = id;
                                js.src = 'https://weatherwidget.io/js/widget.min.js';
                                fjs.parentNode.insertBefore(js, fjs);
                            }
                        }(document, 'script', 'weatherwidget-io-js');
                    </script>
                </div>
                <div style="display: inline-block;" id="timedate">
                    <a id="h">12</a> :
                    <a id="m">00</a>:
                    <a id="s">00</a><br />
                    <a id="mon">January</a>
                    <a id="d">1</a>,
                    <a id="y">0</a>
                </div>
                <div style="clear: both; width: 30px;"></div>
                <script src="https://apps.elfsight.com/p/platform.js" defer></script>
                <div class="elfsight-app-06dfd033-42d0-4ff1-bd0e-79231cd9c985"></div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>