<%-- 
    Document   : portal
    Created on : May 8, 2020, 5:40:18 AM
    Author     : iammd
--%>

<%@page import="com.conquerors.usermanagementsystem.controller.SessionCounterListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    int isAdmin = (Integer) session.getAttribute("is_admin");
%>

<% if (isLoggedIn != "true")
        response.sendRedirect("../index.jsp");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/portal.css">
    </head>
    <body>
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
                <% if (isAdmin == 1) {%>
                <h2 class="mb-4">Hey Admin,</h2>
<!--                <div class="list-group user-list ">
                    <a href="#" class="list-group-item list-group-item-action active">
                      Cras justo odio
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                    <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                    <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                    <a href="#" class="list-group-item list-group-item-action disabled">Vestibulum at eros</a>
                    <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                    <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                    <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                    <a href="#" class="list-group-item list-group-item-action disabled">Vestibulum at eros</a>
                    <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                    <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                    <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                    <a href="#" class="list-group-item list-group-item-action disabled">Vestibulum at eros</a>
                </div>-->
                <div class="card card-4">
                    <br>
                    <h3>No. of Active Users</h3>
                    <p style='font-size: 6em; color: #3445B4;'><%= SessionCounterListener.getTotalActiveSession() %></p>
                </div>
                <% } else {%>
                <div class="alert alert-danger" role="alert">
                    You are not authorized to access this page. Verify that you have the proper admin privilege !
                </div>
                <% }%>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
