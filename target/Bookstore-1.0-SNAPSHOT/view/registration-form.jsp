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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <jsp:include page="/assets/page/css-import.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/assets/page/header.jsp"></jsp:include>

<section class="login_box_area section-margin">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <h3>
                        <center>Create an account</center>
                    </h3>
                    <br/>
                    <form class="row login_form" method="post" action="${pageContext.request.contextPath}/customer/register"
                          id="register_form">
                        <div class="col-md-6 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    name="username"
                                    placeholder="Username"
                                    required
                                    minlength="8"
                                    value="${user.account.username}"
                            />
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    name="email"
                                    placeholder="Email Address"
                                    required
                                    value="${user.email}"
                            />
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    name="password"
                                    placeholder="Password"
                                    required
                                    minlength="8"
                                    value="${user.account.password}"
                            />
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="password"
                                    class="form-control"
                                    id="confirmPassword"
                                    name="confirmPassword"
                                    required
                                    placeholder="Confirm Password"
                            />
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    name="phoneNumber"
                                    required
                                    maxlength="11"
                                    minlength="11"
                                    placeholder="Phone Number"
                                    value="${user.phoneNumber}"
                            />
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="date"
                                    class="form-control"
                                    name="dob"
                                    required
                                    placeholder="Date of Birth"
                                    onmouseover="this.title = 'Date of Birth'"
                                    value="${user.dob}"
                            />
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                                <label for="f-option2">Gender</label><br/>
                                <input type="radio" name="gender" value="Male" checked/>
                                Male
                                <input type="radio" name="gender" value="Female" <c:if test="${user.gender == 'Male'}"> checked </c:if>/>
                                Female
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    required
                                    name="firstName"
                                    placeholder="First Name"
                                    value="${user.fullName.firstName}"
                            />
                        </div>
                        <div class="col-md-6 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    required
                                    name="lastName"
                                    placeholder="Last Name"
                                    value="${user.fullName.lastName}"
                            />
                        </div>
                        <div class="col-md-3 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    required
                                    name="ward"
                                    placeholder="Ward"
                                    value="${user.address.ward}"
                            />
                        </div>
                        <div class="col-md-3 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    required
                                    name="district"
                                    placeholder="District"
                                    value="${user.address.district}"
                            />
                        </div>
                        <div class="col-md-3 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    required
                                    name="province"
                                    placeholder="Province"
                                    value="${user.address.province}"
                            />
                        </div>
                        <div class="col-md-3 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    required
                                    name="country"
                                    placeholder="Country"
                                    value="${user.address.country}"
                            />
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                                <input type="checkbox" id="f-option2" name="selector"/>
                                <label for="f-option2">Accept the terms</label>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <button
                                    type="submit"
                                    value="submit"
                                    class="button button-register w-100"
                            >
                                Register
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/assets/page/footer.jsp"></jsp:include>
<c:if test="${message != null}">
    <script>
        alert('${message}')
    </script>
</c:if>
<jsp:include page="/assets/page/js-import.jsp"></jsp:include>
</body>
</html>
