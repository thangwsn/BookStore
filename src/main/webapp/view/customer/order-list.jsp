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
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Shipment</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Create Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orderList}" var="order">
                        <tr>
                            <td>
                                <div class="media">
                                    <div class="media-body">
                                        <a href="${pageContext.request.contextPath}/order?orderID=${order.ID}">${order.ID}</a>
                                    </div>
                                </div>
                            </td>
                            <td class="buy-price">
                                <h5>${order.shipment.shipmentType.type}</h5>
                            </td>
                            <td>
                                <div class="product_count">
                                    <h5>${order.payment.paymentType}</h5>
                                </div>
                            </td>
                            <td class="sub-total">
                                <h5>${order.payment.amount}</h5>
                            </td>
                            <td>
                                <h5>${order.createTime}</h5>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr class="out_button_area">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="checkout_btn_inner d-flex align-items-center">
                                <a class="gray_btn" href="${pageContext.request.contextPath}/">Continue Shopping</a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<!--================End Cart Area =================-->

<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>

</body>
</html>
