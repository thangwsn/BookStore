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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <jsp:include page="/assets/page/css-import.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/assets/page/header.jsp"></jsp:include>
<!--================Order Details Area =================-->
<section class="order_details section-margin--small">
    <div class="container">
        <p class="text-center billing-alert">
            #${order.ID}
        </p>
        <div class="row mb-5">
            <div class="col-md-6 col-xl-6 mb-6 mb-xl-0">
                <div class="confirmation-card">
                    <h3 class="billing-title">Order Info</h3>
                    <table class="order-rable">
                        <tr>
                            <td>Order ID</td>
                            <td>: #${order.ID}</td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td>: ${order.createTime}</td>
                        </tr>
                        <tr>
                            <td>Total</td>
                            <td>: ${order.payment.amount}</td>
                        </tr>
                        <tr>
                            <td>Payment method</td>
                            <td>: ${order.payment.paymentType}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-6 col-xl-6 mb-6 mb-xl-0">
                <div class="confirmation-card">
                    <h3 class="billing-title">Billing Address</h3>
                    <table class="order-rable">
                        <tr>
                            <td>Shipment Type</td>
                            <td>: ${order.shipment.shipmentType.type}</td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>: ${order.shipment.phoneNumber}</td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>: ${order.shipment.address}</td>
                        </tr>
                        <tr>
                            <td>Status Shipment</td>
                            <td>: ${order.orderStatus}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="order_details_table">
            <h2>Order Details</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.cart.cartDetailList}" var="cartDetail">
                        <tr>
                            <td>
                                <p>${cartDetail.bookItem.title}</p>
                            </td>
                            <td>
                                <h5>x ${cartDetail.quantity}</h5>
                            </td>
                            <td>
                                <p>${cartDetail.quantity * cartDetail.buyPrice}</p>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            <h4>Subtotal</h4>
                        </td>
                        <td>
                            <h5></h5>
                        </td>
                        <td>
                            <p>${order.cart.total}</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Shipping</h4>
                        </td>
                        <td>
                            <h5></h5>
                        </td>
                        <td>
                            <p>${order.shipment.shipmentType.fee}</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Total</h4>
                        </td>
                        <td>
                            <h5></h5>
                        </td>
                        <td>
                            <h4>${order.payment.amount}</h4>
                        </td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="2">
                            <div class="checkout_btn_inner d-flex align-items-center">
                                <a class="gray_btn" href="${pageContext.request.contextPath}/">Continue Shopping</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>
<!--================End Order Details Area =================-->
<jsp:include page="/assets/page/footer.jsp"></jsp:include>
<jsp:include page="/assets/page/js-import.jsp"></jsp:include>

</body>
</html>
