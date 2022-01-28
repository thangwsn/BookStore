<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page buffer="8192kb" autoFlush="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Bookshop</title>
<jsp:include page="/assets/page/css-import.jsp"></jsp:include>
</head>
<body>

<c:if test="${user == null || user.role == 'Customer'}">
    <jsp:include page="/assets/page/header.jsp"></jsp:include>
</c:if>
<c:if test="${user.role == 'Staff'}">
    <jsp:include page="/assets/page/header-staff.jsp"></jsp:include>
</c:if>

<main class="site-main">
    <!--================ Hero banner start =================-->
    <section class="hero-banner">
        <div class="container">
            <div class="row no-gutters align-items-center pt-60px">
                <div class="col-5 d-none d-sm-block">
                    <div class="hero-banner__img">
                        <img class="img-fluid"
                             src="https://i.pinimg.com/750x/9f/ef/0a/9fef0a3b5a63fce0697bc7a584eaa3b4.jpg" alt=""/>
                    </div>
                </div>
                <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
                    <div class="hero-banner__content">
                        <h4>Shop is fun</h4>
                        <h1>Browse Our Premium Product</h1>
                        <p>
                            Us which over of signs divide dominion deep fill bring they're
                            meat beho upon own earth without morning over third. Their
                            male dry. They are great appear whose land fly grass.
                        </p>
                        <a class="button button-hero" href="#">Browse Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ Hero banner start =================-->

    <!-- ================ trending product section start ================= -->
    <section class="section-margin calc-60px">
        <div class="container">
            <div class="section-intro pb-60px">
                <p>New Item in the store</p>
                <h2>Trending <span class="section-intro__style">Product</span></h2>
            </div>
            <div class="row">
                <c:forEach items="${bookItemListNewest}" var="bookItem">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="card text-center card-product">
                            <div class="card-product__img">
                                <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">
                                    <img class="card-img" src="${bookItem.imageList[0].path}" alt=""/>
                                </a>
                                <ul class="card-product__imgOverlay">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">
                                            <button><i class="fas fa-info-circle"></i></button>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cart/add?bookItemID=${bookItem.ID}">
                                            <button><i class="fas fa-cart-plus"></i></button>
                                        </a>
                                    </li>
                                    <li>
                                        <button><i class="far fa-heart"></i></button>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <p>${bookItem.category}</p>
                                <h4 class="card-product__title">
                                    <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">${bookItem.title}</a>
                                </h4>
                                <p>
                                    <c:forEach items="${bookItem.authorList}" var="author">
                                        ${author.fullName},
                                    </c:forEach>
                                </p>
                                <p class="card-product__price">${bookItem.buyPrice}</p>
                                <p>Sold ${bookItem.soldQuantity}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- ================ trending product section end ================= -->

    <%-- Best seller--%>
    <section class="section-margin calc-60px">
        <div class="container">
            <div class="section-intro pb-60px">
                <p>Popular Item in the store</p>
                <h2>Best <span class="section-intro__style">Seller</span></h2>
            </div>
            <div class="row">
                <c:forEach items="${bookItemListBestSeller}" var="bookItem">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="card text-center card-product">
                            <div class="card-product__img">
                                <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">
                                    <img class="card-img" src="${bookItem.imageList[0].path}" alt=""/>
                                </a>
                                <ul class="card-product__imgOverlay">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">
                                            <button><i class="fas fa-info-circle"></i></button>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cart/add?bookItemID=${bookItem.ID}">
                                            <button><i class="fas fa-cart-plus"></i></button>
                                        </a>
                                    </li>
                                    <li>
                                        <button><i class="far fa-heart"></i></button>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <p>${bookItem.category}</p>
                                <h4 class="card-product__title">
                                    <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">${bookItem.title}</a>
                                </h4>
                                <p>
                                    <c:forEach items="${bookItem.authorList}" var="author">
                                        ${author.fullName},
                                    </c:forEach>
                                </p>
                                <p class="card-product__price">${bookItem.buyPrice}</p>
                                <p>Sold ${bookItem.soldQuantity}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- ================ Best Selling item  carousel end ================= -->
</main>

<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>
</body>
</html>
