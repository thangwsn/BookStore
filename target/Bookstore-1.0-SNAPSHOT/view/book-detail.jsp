<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Bookshop</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <jsp:include page="/assets/page/css-import.jsp"></jsp:include>
</head>
<body>
<c:if test="${user == null || user.role == 'Customer'}">
    <jsp:include page="/assets/page/header.jsp"></jsp:include>
</c:if>
<c:if test="${user.role == 'Staff'}">
    <jsp:include page="/assets/page/header-staff.jsp"></jsp:include>
</c:if>

<!--================Single Product Area =================-->
<div class="product_image_area">

    <div class="container">
        <div class="row s_product_inner">
            <div class="col-lg-3">
                <img class="img-fluid" src="${bookItem.imageList[0].path}" alt="book"/>
            </div>
            <div class="col-lg-5 offset-lg-1">
                <div class="s_product_text">
                    <h3>${bookItem.title}</h3>
                    <h2>${bookItem.buyPrice}</h2>
                    <ul class="list">
                        <li>
                            <a class="active" href="#"
                            ><span>Category</span> : ${bookItem.category}</a
                            >
                        </li>
                        <li>
                            <a href="#"><span>Sold</span> : ${bookItem.soldQuantity}</a> <br>
                            <a href="#"><span>In stock</span> : ${bookItem.quantity}</a>
                        </li>
                    </ul>
                    <br>
                    <div class="product_count">
<%--                        <label for="qty">Quantity:</label>--%>
<%--                        <input--%>
<%--                                type="number"--%>
<%--                                name="qty"--%>
<%--                                id="qty"--%>
<%--                                size="2"--%>
<%--                                maxlength="12"--%>
<%--                                value="1"--%>
<%--                                title="Quantity:"--%>
<%--                                class="input-text qty"--%>
<%--                                min="1"--%>
<%--                                max="${bookItem.quantity}"--%>
<%--                        /> <br> <br>--%>
                        <a class="button primary-btn" href="${pageContext.request.contextPath}/cart/add?bookItemID=${bookItem.ID}">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================End Single Product Area =================-->

<!--================Product Description Area =================-->
<section class="product_description_area">
    <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a
                        class="nav-link"
                        id="home-tab"
                        data-toggle="tab"
                        href="#description"
                        role="tab"
                        aria-controls="home"
                        aria-selected="true"
                >Description</a
                >
            </li>
            <li class="nav-item">
                <a
                        class="nav-link"
                        id="profile-tab"
                        data-toggle="tab"
                        href="#profile"
                        role="tab"
                        aria-controls="profile"
                        aria-selected="false"
                >Specification</a
                >
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div
                    class="tab-pane"
                    id="description"
                    role="tabpanel"
                    aria-labelledby="home-tab"
            >
                <p>
                    ${bookItem.summary}
                </p>
            </div>
            <div
                    class="tab-pane"
                    id="profile"
                    role="tabpanel"
                    aria-labelledby="profile-tab"
            >
                <div class="table-responsive">
                    <table class="table">
                        <tbody>
                        <tr>
                        <tr>
                            <td>
                                <h5>ISBN</h5>
                            </td>
                            <td>
                                <h5>${bookItem.ISBN}</h5>
                            </td>
                        </tr>
                        <td>
                            <h5>Author</h5>
                        </td>
                        <td>
                            <h5>
                                <c:forEach items="${bookItem.authorList}" var="author">
                                    ${author.fullName},
                                </c:forEach>
                            </h5>
                        </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Publication Date</h5>
                            </td>
                            <td>
                                <h5>${bookItem.publicationDate}</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Publisher</h5>
                            </td>
                            <td>
                                <h5>${bookItem.publisher.name}</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Number of Page</h5>
                            </td>
                            <td>
                                <h5>${bookItem.numberOfPage}</h5>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Product Description Area =================-->


<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>
</body>
</html>
