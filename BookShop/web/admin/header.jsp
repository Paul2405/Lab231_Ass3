
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--header-->
<header style="padding-bottom: 100px;">
    <nav class="main-nav menu-dark menu-transparent nav-transparent active">
        <div class="col-md-12">
            <div class="navbar">
                <div class="brand-logo">
                    <a href="#" class="navbar-brand">
                        <img src="img/1.png" alt="" height="100px" width="100px"/>
                    </a>
                </div>
                <!-- brand-logo -->

                <div class="navbar-header">
                    <div class="inner-nav right-nav">
                        <ul class="rightnav-links">

                            <c:if test="${sessionScope.USERNAME ne null}" var="checkUser">
                                <li>
                                    <a href="#" class="dropdown-toggle" >Welcome, ${sessionScope.USERNAME}</a>
                                </li>
                                <c:url var="logoutLink" value="LogoutController">
                                </c:url>
                                <li>
                                    <a href="${logoutLink}">Logout</a>
                                </li>
                            </c:if>
                            <c:if test="${!checkUser}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/registration.jsp">
                                        Registry
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/login.jsp">
                                        Login
                                    </a>
                                </li>

                            </c:if>



                        </ul>
                    </div>
                    <!-- /right-nav -->
                </div>
                <!-- navbar-header -->

                <div class="custom-collapse navbar-collapse collapse inner-nav margin-left-100">
                    <ul class="nav navbar-nav nav-links">
                        <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/index.jsp" class="dropdown-toggle" >HOME</a>

                        </li>
                        <!-- /dropdown -->
                        <c:if test="${sessionScope.ROLE eq 'Admin'}">
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/admin/listProducts.jsp" class="dropdown-toggle" >Books</a>

                            </li>
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/admin/createProduct.jsp" class="dropdown-toggle" >Add Book</a>

                            </li>
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/admin/createCategory.jsp" class="dropdown-toggle" >Category</a>

                            </li>
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/admin/createDiscount.jsp" class="dropdown-toggle" >Add Discount</a>

                            </li>
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/admin/listDiscounts.jsp" class="dropdown-toggle" >Discount</a>

                            </li>

                        </c:if>
                        <!-- /dropdown -->


                        <!-- /dropdown -->
                    </ul>
                    <!-- /nav -->
                </div>
                <!-- /collapse -->
            </div>
            <!-- /navbar -->


        </div>
        <!-- /container -->
    </nav>
    <!-- /nav -->
</header>
<!--end header-->
