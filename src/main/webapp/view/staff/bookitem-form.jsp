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
            <div class="container" style="margin-top: 30px">
                <div class="row">
                    <div class="col-lg-12">
                        <div>
                            <h3>
                                <center>Add Book</center>
                            </h3>
                            <br/>
                            <form class="row" method="post" action="${pageContext.request.contextPath}/book/addBookItem"
                                  id="register_form">
                                <div class="col-md-6 form-group">
                                    <label>ISBN</label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            name="ISBN"
                                            required
                                            value="${bookItem.ISBN}"
                                    />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Title</label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            name="title"
                                            required
                                            value="${bookItem.title}"
                                    />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Author</label><br>
                                    <select class="form-control" name="author" multiple >
                                        <c:forEach items="${authorList}" var="author">
                                            <option value="${author.ID}">${author.fullName}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" name="authorText" value="">
                                    <br>
                                    <br>
                                    <ul class="list-group" id="author-list">
                                    </ul>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Summary</label>
                                    <textarea class="form-control" rows="5" name="summary">
                                    </textarea>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Publisher</label> <br>
                                    <select class="form-control" name="publisher">
                                        <c:forEach items="${publisherList}" var="publisher">
                                            <option value="${publisher.ID}"
                                                    <c:if test="${publisher.ID == bookItem.publisher.ID}">selected </c:if> >${publisher.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Publication Date</label>
                                    <input
                                            type="date"
                                            class="form-control"
                                            name="publicationDate"
                                            required
                                            value="${bookItem.publicationDate}"
                                    />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Category</label> <br>
                                    <select class="form-control" name="category">
                                        <option value="Textbook" <c:if test='${bookItem.category == "Textbook"}'> selected</c:if> >Textbook</option>
                                        <option value="Novel" <c:if test='${bookItem.category == "Novel"}'> selected</c:if> >Novel</option>
                                        <option value="Comic" <c:if test='${bookItem.category == "Comic"}'> selected</c:if> >Comic</option>
                                        <option value="Poem" <c:if test='${bookItem.category == "Poem"}'> selected</c:if> >Poem</option>
                                        <option value="ThrillerBook" <c:if test='${bookItem.category == "ThrillerBook"}'> selected</c:if> >Thriller Book</option>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Number of Page</label>
                                    <input
                                            type="number"
                                            class="form-control"
                                            required
                                            name="numberOfPage"
                                            value="${bookItem.numberOfPage}"
                                    />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Buy Price</label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            required
                                            name="buyPrice"
                                            value="${bookItem.buyPrice}"
                                    />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Quantity</label>
                                    <input
                                            type="number"
                                            class="form-control"
                                            required
                                            name="quantity"
                                            value="${bookItem.quantity}"
                                    />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="exampleFormControlFile1">Image</label>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image">
                                    <input type="file" class="form-control-file" id="exampleFormControlFile2" name="image">
                                </div>

                                <div class="col-md-12 form-group">
                                    <button
                                            type="submit"
                                            value="submit"
                                            class="button button-register w-100"
                                    >
                                        Add
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/assets/page/footer.jsp"></jsp:include>
<script>
    var authors = new Set();
    var authorList = $('#author-list');
    var authorsText = $('input[name=authorText]');
    $('select[name=author]').change(function() {

        $('select[name=author] option:selected').each(function() {
            let author = $(this).val() + "," + $(this).text();
            authors.add(author);
        })
        renderAuthorList(authors);

    })
    function renderAuthorList(authors) {
        authorList.empty();
        let text = "";
        authors.forEach(author => {
            authorList.append('<li>' + author.split(',')[1] + '&nbsp;&nbsp;<a href="#" id=' + author.split(',')[0]+ ' style="color: black" onclick=""><i class="fas fa-user-times"></i></a> </li>');
            text += author.split(',')[0] + ",";
        })
        authorsText.val(text);
    }

</script>

<jsp:include page="/assets/page/js-import.jsp"></jsp:include>
</body>
</html>
