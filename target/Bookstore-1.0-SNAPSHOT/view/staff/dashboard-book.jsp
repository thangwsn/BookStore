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
<!--================ Start Header Menu Area =================-->
<jsp:include page="/assets/page/header-staff.jsp"></jsp:include>
<!--================ End Header Menu Area =================-->
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- Sidebar -->
            <nav
                    id="sidebarMenu"
                    class="collapse d-lg-block sidebar collapse bg-white"
            >
                <div class="position-sticky">
                    <div class="list-group list-group-flush mx-3 mt-4">
                        <a
                                href="${pageContext.request.contextPath}/dashboard/"
                                class="list-group-item list-group-item-action py-2 ripple "
                                aria-current="true"
                        >
                            <i class="fas fa-chart-bar"></i><span>Statistic</span>
                        </a>
                        <a
                                href="${pageContext.request.contextPath}/dashboard/customer"
                                class="list-group-item list-group-item-action py-2 ripple"
                        >
                            <i class="far fa-user"></i><span>Customer</span>
                        </a>
                        <a
                                href="${pageContext.request.contextPath}/dashboard/book"
                                class="list-group-item list-group-item-action py-2 ripple active"
                        ><i class="fas fa-book"></i><span>Book</span></a
                        >
                    </div>
                </div>
            </nav>
            <!-- Sidebar -->
        </div>
        <div class="col-md-9">
            <main>
                <div class="container pt-4">
                    <!--Section: Sales Performance KPIs-->
                    <section class="mb-4">
                        <div class="card">
                            <div class="card-header text-center py-3">
                                <h5 class="mb-0 text-center">
                                    <strong>Sales Performance KPIs</strong>
                                </h5>
                            </div>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/book/addBookItem">
                                    <button class="btn btn-primary">Add Book</button>
                                </a>
                                <div class="table-responsive">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                        <tr>
                                            <th scope="col">ISBN</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Author</th>
                                            <th scope="col">Publisher</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Buy Price</th>
                                            <th scope="col">In Stock</th>
                                            <th scope="col">Sold</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${bookItemList}" var="bookItem">
                                            <tr>
                                                <td>${bookItem.ISBN}</td>
                                                <td><a style="color: black" href="${pageContext.request.contextPath}/book/detail?bookItemID=${bookItem.ID}">${bookItem.title}</a></td>
                                                <td>
                                                    <c:forEach items="${bookItem.authorList}" var="author">
                                                        ${author.fullName},
                                                    </c:forEach>
                                                </td>
                                                <td>${bookItem.publisher.name}</td>
                                                <td>${bookItem.category}</td>
                                                <td>${bookItem.buyPrice}</td>
                                                <td>${bookItem.quantity}</td>
                                                <td>${bookItem.soldQuantity}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/book/edit?bookItemID=${bookItem.ID}">
                                                        <button class="btn btn-primary">Edit</button>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!--Section: Sales Performance KPIs-->

                    <!--Section: Statistics with subtitles-->
                    <section>
                        <div class="row">
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <i class="fas fa-pencil-alt text-info fa-3x me-4"></i>
                                                </div>
                                                <div>
                                                    <h4>Total Posts</h4>
                                                    <p class="mb-0">Monthly blog posts</p>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <h2 class="h1 mb-0">18,000</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <i
                                                            class="far fa-comment-alt text-warning fa-3x me-4"
                                                    ></i>
                                                </div>
                                                <div>
                                                    <h4>Total Comments</h4>
                                                    <p class="mb-0">Monthly blog posts</p>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <h2 class="h1 mb-0">84,695</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">$76,456.00</h2>
                                                </div>
                                                <div>
                                                    <h4>Total Sales</h4>
                                                    <p class="mb-0">Monthly Sales Amount</p>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="far fa-heart text-danger fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">$36,000.00</h2>
                                                </div>
                                                <div>
                                                    <h4>Total Cost</h4>
                                                    <p class="mb-0">Monthly Cost</p>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fas fa-wallet text-success fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!--Section: Statistics with subtitles-->
                </div>
            </main>
        </div>
    </div>
</div>
<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>
</body>
</html>
