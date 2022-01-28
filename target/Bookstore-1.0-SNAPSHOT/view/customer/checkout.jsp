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

<section class="checkout_area section-margin--small">
    <form class="container" method="post" action="${pageContext.request.contextPath}/checkout">
        <div class="billing_details">
            <div class="row">
                <div class="col-lg-8">
                    <h3>Billing Details</h3>
                    <div
                            class="row contact_form"
                            action="#"
                            method="post"
                            novalidate="novalidate"
                    >
                        <div class="col-md-6 form-group p_star">
                            <label>Full name</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="fullName"
                                    name="fullName"
                                    value="${user.fullName.firstName} ${user.fullName.lastName}"
                                    disabled
                            />
                        </div>
                        <div class="col-md-6 form-group p_star">
                            <label>Phone number</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="phoneNumber"
                                    name="phoneNumber"
                                    value="${user.phoneNumber}"
                                    required
                                    minlength="11"
                                    maxlength="11"
                            />
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Address</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="address"
                                    name="address"
                                    value="${user.address.ward}, ${user.address.district}, ${user.address.province}, ${user.address.country}"
                                    required
                            />
                        </div>
                        <div class="col-md-6 form-group p_star">
                            <label>Shipment Type</label>
                            <select class="country_select" name="shipmentType" id="shipment-type">
                                <c:forEach items="${shipmentTypeList}" var="shipmentType">
                                    <option value="${shipmentType.ID}" fee="${shipmentType.fee}">${shipmentType.type}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-12 form-group mb-0">
                            <textarea
                                    class="form-control"
                                    name="note"
                                    rows="1"
                                    placeholder="Order Notes"
                            ></textarea>
                        </div>
                    </div>
                    <br>
                    <h3>Payment</h3>
                    <div class="payment_item">
                        <div class="radion_btn">
                            <input type="radio" id="f-option5" name="paymentType" value="Check"/>
                            <label for="f-option5">Check payments</label>
                            <div class="check"></div>
                        </div>
                        <div id="check-payment">
                            <div class="col-md-8 form-group">
                                <label>Name</label>
                                <input type="text" name="checkPaymentName" class="form-control">
                            </div>
                            <div class="col-md-8 form-group">
                                <label>Bank ID</label>
                                <input type="text" name="bankID" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="payment_item active">
                        <div class="radion_btn">
                            <input type="radio" id="f-option6" name="paymentType" value="Credit"/>
                            <label for="f-option6">Credit Payments</label>
                            <div class="check"></div>
                        </div>
                        <div id="credit-payment">
                            <div class="col-md-8 form-group">
                                <label>Name</label>
                                <input type="text" name="creditPaymentName" class="form-control">
                            </div>
                            <div class="col-md-8 form-group">
                                <label>Number</label>
                                <input type="text" name="number" class="form-control" >
                            </div>
                            <div class="col-md-8 form-group">
                                <label>Expire Date</label>
                                <input type="date" name="expireDate" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="radion_btn">
                        <input type="radio" id="f-option7" name="paymentType" value="COD" checked/>
                        <label for="f-option7">Cash on delivery</label>
                        <div class="check"></div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="order_box">
                        <h2>Your Order</h2>
                        <ul class="list">
                            <li>
                                <a href="#"
                                ><h4>Product <span>Total</span></h4></a
                                >
                            </li>
                            <c:forEach items="${cart.cartDetailList}" var="cartDetail">
                                <li>
                                    <a href="${pageContext.request.contextPath}/book/detail?bookItemID=${cartDetail.bookItem.ID}"
                                    >${cartDetail.bookItem.title} <span class="middle">x ${cartDetail.quantity}</span>
                                        <span class="last">${cartDetail.quantity * cartDetail.buyPrice}</span></a
                                    >
                                </li>
                            </c:forEach>

                        </ul>
                        <ul class="list list_2">
                            <li>
                                <a href="#">Product total <span id="product-total">${cart.total}</span></a>
                            </li>
                            <li>
                                <a href="#">Shipping Fee: <span id="shipment-fee"></span></a>
                            </li>
                            <li>
                                <a href="#">Total <span id="total">$2210.00</span></a>
                            </li>
                        </ul>


                        <div class="text-center">

                            <button type="submit" class="button button-paypal">Place order</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>
<!--================End Checkout Area =================-->

<jsp:include page="/assets/page/footer.jsp"></jsp:include>

<script>

    $(document).ready(function(){

        // payment
        $("#check-payment").hide();
        $("#credit-payment").hide();
        $('input[name=paymentType]').change(function () {
            $("#check-payment").slideUp(500);
            $("#credit-payment").slideUp(500);
            let type = $('input[name=paymentType]:checked').val();
            if (type == 'Check') {
                $("#check-payment").slideDown(500)
            }
            if (type == 'Credit') {
                $("#credit-payment").slideDown(500)
            }
        })

        // shipment
        $('#shipment-fee').text($('option[value=1]').attr("fee")); //default
        $('#total').text(parseFloat($('option[value=1]').attr("fee")) + parseFloat($('#product-total').text()));
        $('select#shipment-type').change(function() {
            let fee = $('option[value='+ $(this).val() +']').attr("fee");
            $('#shipment-fee').text(fee);
            $('#total').text(parseFloat(fee) + parseFloat($('#product-total').text()));
        })
    });
</script>

    <jsp:include page="/assets/page/js-import.jsp"></jsp:include>

</body>
</html>
