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
<jsp:include page="/assets/page/header.jsp"></jsp:include>

<!--================Cart Area =================-->
<section class="cart_area">
    <div class="container">
        <div class="cart_inner">
            <form class="table-responsive" method="POST" action="${pageContext.request.contextPath}/cart/update">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cart.cartDetailList}" var="cartDetail">
                        <tr>
                            <td>
                                <div class="media">
                                    <div class="d-flex">
                                        <img src="${cartDetail.bookItem.imageList[0].path}" style="width: 20%; height: 20%"/>
                                    </div>
                                    <div class="media-body">
                                        <p>${cartDetail.bookItem.title}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="buy-price">
                                <h5>${cartDetail.buyPrice}</h5>
                            </td>
                            <td>
                                <div class="product_count">
                                    <input
                                            type="number"
                                            name="${cartDetail.ID}"
                                            id="${cartDetail.ID}"
                                            value="${cartDetail.quantity}"
                                            max="${cartDetail.bookItem.quantity}"
                                            min="0"
                                            title="Quantity:"
                                            class="input-text qty"
                                            onchange="return updateTotal('${cartDetail.ID}');"
                                    />
                                </div>
                            </td>
                            <td class="sub-total">
                                <h5>${cartDetail.quantity * cartDetail.buyPrice}</h5>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/cart/remove?cartDetailID=${cartDetail.ID}">
                                    <i class="far fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr class="bottom_button">
                        <td>
                            <button type="submit" class="gray_btn">Update Cart</button>
                        </td>
                        <td></td>
                        <td><h5>Subtotal</h5></td>
                        <td>
                            <h5>${cart.total}</h5>
                        </td>
                    </tr>
                    <tr class="out_button_area">
                        <td class="d-none-l"></td>
                        <td class=""></td>
                        <td></td>
                        <td colspan="2">
                            <div class="checkout_btn_inner d-flex align-items-center">
                                <a class="gray_btn" href="${pageContext.request.contextPath}/">Continue Shopping</a>
                                <a class="primary-btn ml-2" href="${pageContext.request.contextPath}/checkout"
                                >Proceed to checkout</a
                                >
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</section>
<!--================End Cart Area =================-->

<%--<script>--%>
<%--    function updateTotal(idDetail) {--%>
<%--        let proQty = parseFloat(document.getElementById(idDetail).value);--%>
<%--        let buyPrice = parseFloat(document.querySelector('td.buy-price h5' + idDetail).innerHTML);--%>
<%--        let subTotal = proQty * buyPrice;--%>
<%--        console.log(document.querySelector('id.sub-total h5#'+idDetail));--%>
<%--    }--%>
<%--</script>--%>
<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>

</body>
</html>
