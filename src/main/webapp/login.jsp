
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String notLoggedIn = (String) session.getAttribute("loginuser");
    String registered = (String) session.getAttribute("registered");
    String errorMessage = (String) session.getAttribute("error");
    String isLoggedIn = (String) session.getAttribute("isLoggedIn");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login / Register</title>
        <link rel="stylesheet" href="profile/css/bootstrap.min.css">

        <!--Collapse to scroll lesser-->

        <style type="text/css">
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            .login-page {
                width: 360px;
                padding: 8% 0 0;
                margin: auto;
            }
            .form {
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 360px;
                margin: 0 auto 100px;
                padding: 45px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            .form input {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }
            .form button {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                background: #3445b4;
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
            }
            .form button:hover,.form button:active,.form button:focus {
                background: #3b368b;
            }
            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }
            .form .message a {
                color: #3445b4;
                text-decoration: none;
            }
            .form .register-form {
                display: none;
            }
            .container {
                position: relative;
                z-index: 1;
                max-width: 300px;
                margin: 0 auto;
            }
            .container:before, .container:after {
                content: "";
                display: block;
                clear: both;
            }
            .container .info {
                margin: 50px auto;
                text-align: center;
            }
            .container .info h1 {
                margin: 0 0 15px;
                padding: 0;
                font-size: 36px;
                font-weight: 300;
                color: #1a1a1a;
            }
            .container .info span {
                color: #4d4d4d;
                font-size: 12px;
            }
            .container .info span a {
                color: #000000;
                text-decoration: none;
            }
            .container .info span .fa {
                color: #EF3B3A;
            }
            body {
                background: #3445b4; /* fallback for old browsers */
                background: -webkit-linear-gradient(right, #3445b4, #3b368b);
                background: -moz-linear-gradient(right, #3445b4, #3b368b);
                background: -o-linear-gradient(right, #3445b4, #3b368b);
                background: linear-gradient(to left, #3445b4, #3b368b);
                font-family: "Roboto", sans-serif;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;      
            }
        </style>
        <% if (isLoggedIn == "true") {
                response.sendRedirect("profile/dashboard.jsp");
            } %>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <% if (errorMessage != null) {%>
                <p style="color:red; font-size: 12px;"> 
                    <%= errorMessage%>
                    <% session.removeAttribute("error");%>
                </p>
                <% }%> 
                <% if (notLoggedIn != null) {%>
                <p style="color:red; font-size: 12px;"> 
                    <%= notLoggedIn%>
                    <% session.removeAttribute("loginuser");%>
                </p>
                <% }%>
                <% if (registered != null) {%>
                <p style="color:green; font-size: 12px;"> 
                    <%= registered%>
                    <% session.removeAttribute("registered");%>
                </p>
                <% }%>
                <form method="POST" action="register" class="register-form">
                    <input required type="text" name="first_name" placeholder="first name"/>
                    <input required type="text" name="last_name" placeholder="last name"/>
                    <input required minlength="10" maxlength="10" type="text" name="phone_number" placeholder="phone"/>
                    <input required type="email" name="email" placeholder="email address"/>
                    <input required type="text" name="username" placeholder="username"/>
                    <input required minlength="8" type="password" name="password" placeholder="password"/>
                    <input required type="text" name="birth_date" placeholder="YYYY-MM-DD"/>
                    <button>create</button>
                    <p class="message">Already registered? <a class="new" href="#">Sign In</a></p>
                </form>
                <form method="POST" action="login" class="login-form">
                    <input type="text" name="username" placeholder="username"/>
                    <input type="password" name="password" placeholder="password"/>
                    <button>login</button>
                    <p class="message"><a href="help.jsp">Forgot Password?</a></p>
                    <p class="message">Not registered? <a class="new" href="#">Create an account</a></p>
                </form>
                
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type="text/javascript">
            $('.message .new').click(function () {
                $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
            });
        </script>
    </body>
</html>
