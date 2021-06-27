
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
                                    <a href="${logoutLink}" onclick="signOut()">Logout</a>
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

                <div class="custom-collapse navbar-collapse collapse inner-nav margin-left-100">
                    <ul class="nav navbar-nav nav-links">
                        <li class="dropdown classic-dropdown"><a href="index.jsp" class="dropdown-toggle" >HOME</a>

                        </li>
                        <c:if test="${(sessionScope.ROLE eq 'User')}">
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/user/history.jsp" class="dropdown-toggle" >History</a>

                            </li>
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/user/cart.jsp" class="dropdown-toggle" >CART</a>

                            </li>
                        </c:if>

                        <!-- /dropdown -->
                        <c:if test="${(sessionScope.ROLE eq 'Admin')}">
                            <li class="dropdown classic-dropdown"><a href="${pageContext.request.contextPath}/admin/listProducts.jsp" class="dropdown-toggle" >ADMIN</a>

                            </li>
                        </c:if>
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
<script>
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        console.log("Email: " + profile.get());
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
    }

</script>
