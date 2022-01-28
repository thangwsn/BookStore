<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- ================ category section start ================= -->
<section class="section-margin--small mb-5">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-5">
                <div class="sidebar-categories">
                    <div class="head">Browse Categories</div>
                    <ul class="main-categories">
                        <li class="common-filter">
                            <form action="#">
                                <ul>
                                    <li class="filter-list">
                                        <input
                                                class="pixel-radio"
                                                type="radio"
                                                id="men"
                                                name="brand"
                                        /><label for="men">Textbook<span> (3600)</span></label>
                                    </li>
                                    <li class="filter-list">
                                        <input
                                                class="pixel-radio"
                                                type="radio"
                                                id="women"
                                                name="brand"
                                        /><label for="women">Novel<span> (3600)</span></label>
                                    </li>
                                    <li class="filter-list">
                                        <input
                                                class="pixel-radio"
                                                type="radio"
                                                id="accessories"
                                                name="brand"
                                        /><label for="accessories"
                                    >Comic<span> (3600)</span></label
                                    >
                                    </li>
                                    <li class="filter-list">
                                        <input
                                                class="pixel-radio"
                                                type="radio"
                                                id="footwear"
                                                name="brand"
                                        /><label for="footwear"
                                    >Poem<span> (3600)</span></label
                                    >
                                    </li>
                                    <li class="filter-list">
                                        <input
                                                class="pixel-radio"
                                                type="radio"
                                                id="bayItem"
                                                name="brand"
                                        /><label for="bayItem"
                                    >ThrillBook<span> (3600)</span></label
                                    >
                                    </li>
                                </ul>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xl-9 col-lg-8 col-md-7">
                <!-- Start Filter Bar -->
                <div class="filter-bar d-flex flex-wrap align-items-center">
                    <div class="sorting">
                        <select>
                            <option value="1">Sorting</option>
                            <a>
                                <option value="1">Sorting by price</option>
                            </a>
                            <a>
                                <option value="1">Sorting by sold quantity</option>
                            </a>
                            <a>
                                <option value="1">Default sorting</option>
                            </a>
                        </select>
                    </div>
                    <div class="sorting mr-auto">
                        <select>
                            <option value="9">Show 9</option>
                            <option value="15">Show 15</option>
                        </select>
                    </div>
                    <form action="${pageContext.request.contextPath}/book/search" method="POST">
                        <div class="input-group filter-bar-search">
                            <c:if test="${searchName != null}">
                                <input type="text" placeholder="Search" name="search" value="${searchName}"/>
                            </c:if>
                            <c:if test="${searchName == null}">
                                <input type="text" placeholder="Search" name="search" value=""/>
                            </c:if>
                            <div class="input-group-append">
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- End Filter Bar -->
                <!-- Start Best Seller -->
                <section class="lattest-product-area pb-40 category-list">
                    <div class="row">
                        <c:forEach items="${bookItemList}" var="bookItem">
                            <div class="col-md-6 col-lg-4">
                                <div class="card text-center card-product">
                                    <div class="card-product__img">
                                        <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">
                                            <img class="card-img" src="${bookItem.imageList[0].path}" alt="ff"/>
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
                </section>
                <!-- End Best Seller -->
            </div>
        </div>
    </div>
</section>
<!-- ================ category section end ================= -->

<!-- ================ top product area start ================= -->
<section class="related-product-area">
    <div class="container">
        <div class="section-intro pb-60px">
            <p>Popular Item in the market</p>
            <h2>Top <span class="section-intro__style">Product</span></h2>
        </div>
        <div class="row mt-30">
            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-1.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-2.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-3.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-4.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-5.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-6.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-7.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-8.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-9.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-1.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-2.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"
                        ><img src="img/product/product-sm-3.png" alt=""
                        /></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ================ top product area end ================= -->

<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>
</body>
</html>
