<%-- 
    Document   : registration
    Created on : Jan 14, 2020, 12:56:42 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Discount</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png" />

        <!-- CSS -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/media.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.transitions.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.bxslider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider-set.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container text-center padding-vertical-50">
            <h2 class="double-line"><span>add new discount</span></h2>
            <div class="row justify-content-md-center"  >
                <div class="col-md-6 col-sm-6" >
                    <form action="AddDiscountAdminController" method="POST" class="contact-form padding-top-50 margin-bottom-15">
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group text-center">
                                    <label for="author">Creator: </label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <div class="fom-group text-center">
                                    <label id="author" > <h3 class="fontawesome-icon-list" style="font-weight: bold;">${sessionScope.FULLNAME}</h3> </label>
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                                <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-center">
                                    <label for="cate_name">Discount Name</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-right">
                                    <input type="text" name="txtName" id="cate_name" class="form-control" value="${param.txtName}" required/>
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-center">
                                    <label for="code">Discount Code</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-right">
                                    <input type="text" name="txtCode" id="code" class="form-control" value="${param.txtCode}" required/>
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <font color="red">${requestScope.INVALID}<font>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-center">
                                    <label for="percent">Percent</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-right">
                                    <input type="number" min="0" max="100" name="txtPercent" id="percent" class="form-control" value="${param.txtPercent}" required/>
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <input type="submit" name="action" value="Add Discount" class="btn btn-login"/>
                        </div>




                    </form>

                </div>

            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lib/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lib/moderniz.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery.bxslider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery.flexslider-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/flexslider-init.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/smoothscroll.js"></script>
    </body>
</html>
