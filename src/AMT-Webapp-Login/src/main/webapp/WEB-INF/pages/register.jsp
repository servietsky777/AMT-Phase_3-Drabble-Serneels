<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--
 * File             : register.jsp
 * Authors          : Antoine Drabble & Guillaume Serneels
 * Last Modified    : 21.10.2016
-->
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>AMT Webapp</title>

        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

        <!-- Theme CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/grayscale.min.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

        <!-- Navigation -->
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                        Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
                        <span class="light">AMT</span> HEIG
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/index">Index</a>
                        </li>
                        <c:choose>
                            <c:when test="${empty requestScope.id}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/login">Login</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/register">Register</a>
                                </li>
                            </c:when>    
                            <c:otherwise>
                                <li>
                                    <a href="${pageContext.request.contextPath}/users">Users</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Intro Header -->
        <header class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <h1 class="brand-heading">Register</h1>
                            <c:choose>
                                <c:when test="${not empty requestScope.error}">
                                    <div class="alert alert-danger col-md-12">
                                        <strong>Error with the registration!</strong> ${requestScope.error}
                                    </div>
                                </c:when>    
                            </c:choose>
                            <form id="register-form" action="${pageContext.request.contextPath}/register" method="post" role="form" style="display: block;">                           
                                <div class="form-group col-md-12">
                                    <input style="-webkit-box-shadow: 0 0 0px 1000px white inset;" type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                </div>
                                <div class="form-group col-md-12">
                                    <input style="-webkit-box-shadow: 0 0 0px 1000px white inset;" type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group col-md-12">
                                    <input style="-webkit-box-shadow: 0 0 0px 1000px white inset;" type="text" name="email" id="email" tabindex="3" class="form-control" placeholder="Email" value="">
                                </div>
                                <div class="form-group col-md-12">
                                    <input style="-webkit-box-shadow: 0 0 0px 1000px white inset;" type="text" name="firstname" id="firstname" tabindex="4" class="form-control" placeholder="Firstname" value="">
                                </div>
                                <div class="form-group col-md-12">
                                    <input style="-webkit-box-shadow: 0 0 0px 1000px white inset;" type="text" name="lastname" id="lastname" tabindex="5" class="form-control" placeholder="Lastname" value="">
                                </div>
                                <div class="form-group col-md-6">     
                                    <input type="submit" name="login-submit" id="login-submit" tabindex="6" class="form-control btn btn-login" value="Register">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Footer -->
        <footer>
            <div class="container text-center">
                <p>Copyright &copy; AMT Webapp 2016</p>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

        <!-- Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/js/grayscale.min.js"></script>

    </body>

</html>
