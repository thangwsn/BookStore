package businesslogic.controller;

import businesslogic.bookDao.BookDao;
import businesslogic.bookDao.BookDaoImpl;
import model.book.Author;
import model.book.BookItem;
import model.book.Image;
import model.book.Publisher;
import model.enumeration.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "BookServlet", value = "/book/*")
public class BookServlet extends HttpServlet {
    private BookDao bookDao;

    public void init() {
        bookDao = new BookDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/":
                showAllBookItem(request, response);
                break;
            case "/detail":
                showDetailBookItem(request, response);
                break;
            case "/edit":
                showEditBookForm(request, response);
                break;
            case "/addBookItem":
                showBookForm(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/addBookItem":
                addBookItem(request, response);
                break;
            case "/addBook":
                addBook(request, response);
                break;
            case "/search":
                searchBookItem(request, response);
                break;
            case "/editBookItem":
                editBookItem(request, response);
                break;
        }
    }


    private void showBookForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Publisher> publisherList = bookDao.getAllPublisher();
        List<Author> authorList = bookDao.getAllAuthor();
        request.setAttribute("publisherList", publisherList);
        request.setAttribute("authorList", authorList);
        request.getRequestDispatcher("/view/staff/bookitem-form.jsp").forward(request, response);
    }

    private void showEditBookForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Publisher> publisherList = bookDao.getAllPublisher();
        List<Author> authorList = bookDao.getAllAuthor();
        BookItem bookItem = bookDao.getBookItemByID(request.getParameter("bookItemID"));
        request.setAttribute("bookItem", bookItem);
        request.setAttribute("publisherList", publisherList);
        request.setAttribute("authorList", authorList);
        request.getRequestDispatcher("/view/staff/bookitem-form-edit.jsp").forward(request, response);
    }

    private void showDetailBookItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookItemID = request.getParameter("bookItemID");
        BookItem bookItem = bookDao.getBookItemByID(bookItemID);
        request.setAttribute("bookItem", bookItem);
        request.getRequestDispatcher("/view/book-detail.jsp").forward(request, response);
    }

    private void addBookItem(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // get param
        String ISBN = request.getParameter("ISBN");
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String publisherID = request.getParameter("publisher");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date publicationDate = null;
        try {
            publicationDate = sdf.parse(request.getParameter("publicationDate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String category = request.getParameter("category");
        int numberOfPage = Integer.parseInt(request.getParameter("numberOfPage"));
        double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        // image file
        //author
        List<Image> imageList = new ArrayList<>();
        List<Author> authorList = new ArrayList<>();
        String authorParams = request.getParameter("authorText");
        String[] authorArr = authorParams.split(",");
        for (int i = 0; i < authorArr.length; i++) {
            Author author = bookDao.getAuthorByAuthorID(authorArr[i]);
            if (author != null) {
                authorList.add(author);
            }
        }
        BookItem bookItem = new BookItem();
        bookItem.setISBN(ISBN);
        bookItem.setTitle(title);
        bookItem.setSummary(summary);
        bookItem.setPublisher(bookDao.getPublisherByPublisherID(publisherID));
        bookItem.setPublicationDate(publicationDate);
        bookItem.setCategory(Category.valueOf(category));
        bookItem.setNumberOfPage(numberOfPage);
        bookItem.setBuyPrice(buyPrice);
        bookItem.setQuantity(quantity);
        // set image, author
        bookItem.setImageList(imageList);
        bookItem.setAuthorList(authorList);
        bookItem.setID(UUID.randomUUID().toString());
        bookItem.setCreateDate(new Date());
        bookItem.setSoldQuantity(0);
        if (bookDao.saveBookItem(bookItem)) {
            response.sendRedirect(request.getContextPath() + "/dashboard/book");
        } else {
            request.getRequestDispatcher("/view/staff/bookitem-form.jsp").forward(request, response);
        }
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showAllBookItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BookItem> bookItemList = bookDao.getAllBookItem();
        request.setAttribute("bookItemList", bookItemList);
        request.getRequestDispatcher("/view/shop.jsp").forward(request, response);
    }

    private void searchBookItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("search");
        List<BookItem> bookItemList = bookDao.searchBookItemByName(searchName);
        request.setAttribute("bookItemList", bookItemList);
        request.setAttribute("searchName", searchName);
        request.getRequestDispatcher("/view/shop.jsp").forward(request, response);
    }

    private void editBookItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // get param
        String ISBN = request.getParameter("ISBN");
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String publisherID = request.getParameter("publisher");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date publicationDate = null;
        try {
            publicationDate = sdf.parse(request.getParameter("publicationDate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String category = request.getParameter("category");
        int numberOfPage = Integer.parseInt(request.getParameter("numberOfPage"));
        double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        // image file
        //author
        List<Image> imageList = new ArrayList<>();
        List<Author> authorList = new ArrayList<>();
//        String authorParams = request.getParameter("authorText");
//        String[] authorArr = authorParams.split(",");
//        for (int i = 0; i < authorArr.length; i++) {
//            Author author = bookDao.getAuthorByAuthorID(authorArr[i]);
//            if (author != null) {
//                authorList.add(author);
//            }
//        }
        BookItem bookItem = new BookItem();
        bookItem.setISBN(ISBN);
        bookItem.setTitle(title);
        bookItem.setSummary(summary);
        bookItem.setPublisher(bookDao.getPublisherByPublisherID(publisherID));
        bookItem.setPublicationDate(publicationDate);
        bookItem.setCategory(Category.valueOf(category));
        bookItem.setNumberOfPage(numberOfPage);
        bookItem.setBuyPrice(buyPrice);
        bookItem.setQuantity(quantity);
        // set image, author
        bookItem.setImageList(imageList);
        bookItem.setAuthorList(authorList);
        bookItem.setID(request.getParameter("ID"));
        bookItem.setSoldQuantity(Integer.parseInt(request.getParameter("soldQuantity")));
        bookDao.updateBookItem(bookItem);
        response.sendRedirect(request.getContextPath() + "/dashboard/book");
    }
}
