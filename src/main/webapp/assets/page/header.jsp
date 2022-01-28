<!--================ Start Header Menu Area =================-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo_h" href="${pageContext.request.contextPath}/">BookShop</a>
                <button
                        class="navbar-toggler"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div
                        class="collapse navbar-collapse offset"
                        id="navbarSupportedContent"
                >
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/book/">Shop</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/order">Order</a>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a
                                    href="#"
                                    class="nav-link dropdown-toggle"
                                    data-toggle="dropdown"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                            ></a
                            >
                            <ul class="dropdown-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="blog.html"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="single-blog.html"
                                    >Blog Details</a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a
                                    href="#"
                                    class="nav-link dropdown-toggle"
                                    data-toggle="dropdown"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                            ></a
                            >
                            <ul class="dropdown-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="login.html">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="register.html">Register</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="tracking-order.html"
                                    >Tracking</a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html"></a>
                        </li>
                    </ul>

                    <ul class="nav-shop">
                        <li class="nav-item">
                            <button>
                                <a href="${pageContext.request.contextPath}/cart/">
                                    <i class="fas fa-shopping-cart"></i><span class="nav-shop__circle">${quantity}</span>
                                </a>
                            </button>
                        </li>
                        <li class="nav-item">
                            <button>
                                <i class="fas fa-user"></i>
                                <span>
                                    <c:if test="${user != null}"></c:if>
                                    ${user.account.username}</span>
                            </button>
                        </li>
                        <c:if test="${user != null}">
                            <li class="nav-link">
                                <a class="button button-header" href="${pageContext.request.contextPath}/logout">Logout</a>
                            </li>
                        </c:if>

                        <c:if test="${user == null}">
                            <li class="nav-link">
                                <a class="button button-header" href="${pageContext.request.contextPath}/login">Login</a>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<!--================ End Header Menu Area =================-->