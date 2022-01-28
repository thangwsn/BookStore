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

<!--================Login Box Area =================-->
<section class="login_box_area section-margin">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="login_box_img">
                    <div class="hover">
                        <h4>New to our website?</h4>
                        <a class="button button-account" href="${pageContext.request.contextPath}/customer/register"
                        >Create an Account</a
                        >
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="login_form_inner">
                    <h3>Log in to enter</h3>
                    <form class="row login_form" method="post" action="${pageContext.request.contextPath}/login" id="contactForm">
                        <div class="col-md-12 form-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    name="username"
                                    placeholder="Username"
                                    required
                                    value="${accountInput.username}"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Username'"
                                    minlength="8"
                            />
                        </div>
                        <div class="col-md-12 form-group">
                            <input
                                    type="password"
                                    class="form-control"
                                    name="password"
                                    required
                                    value="${accountInput.password}"
                                    placeholder="Password"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Password'"
                                    minlength="8"
                            />
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                                <input type="checkbox" id="f-option2" name="selector"/>
                                <label for="f-option2">Keep me logged in</label>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <button
                                    type="submit"
                                    value="submit"
                                    class="button button-login w-100"
                            >
                                Log In
                            </button>
                            <a href="#">Forgot Password?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Login Box Area =================-->

<jsp:include page="/assets/page/footer.jsp" ></jsp:include>

<jsp:include page="/assets/page/js-import.jsp" ></jsp:include>
</body>
</html>
