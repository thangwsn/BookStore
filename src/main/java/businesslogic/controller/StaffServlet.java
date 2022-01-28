package businesslogic.controller;

import businesslogic.bookDao.BookDao;
import businesslogic.bookDao.BookDaoImpl;
import businesslogic.userDao.CustomerDao;
import businesslogic.userDao.CustomerDaoImpl;
import model.book.BookItem;
import model.user.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StaffServlet", value = "/dashboard/*")
public class StaffServlet extends HttpServlet {
    private BookDao bookDao;
    private CustomerDao customerDao;
    public void init() {
        bookDao = new BookDaoImpl();
        customerDao = new CustomerDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        switch (action) {
            case "/":
                showDashboard(request, response);
                break;
            case "/customer":
                showAllCustomer(request, response);
                break;
            case  "/book":
                showAllBook(request, response);
                break;
        }
    }

    private void showAllBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BookItem> bookItemList = bookDao.getAllBookItem();
        request.setAttribute("bookItemList", bookItemList);
        request.getRequestDispatcher("/view/staff/dashboard-book.jsp").forward(request, response);
    }

    private void showAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerDao.getAllCustomer();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/view/staff/dashboard-customer.jsp").forward(request, response);
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/view/staff/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
