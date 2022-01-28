package businesslogic.controller;

import businesslogic.bookDao.BookDao;
import businesslogic.bookDao.BookDaoImpl;
import businesslogic.userDao.UserDao;
import businesslogic.userDao.UserDaoImpl;
import model.enumeration.Role;
import model.book.BookItem;
import model.user.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/")
public class UserServlet extends HttpServlet {
    private final int NUMBER_OF_BOOK_RENDER = 8;
    private BookDao bookDao;
    private UserDao userDao;

    @Override
    public void init() {
        bookDao = new BookDaoImpl();
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getServletPath();
        switch (action) {
            case "/login":
                showLoginForm(request, response);
                break;
            case "/logout":
                handleLogout(request, response);
                break;
            case "/":
                loadHome(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getServletPath();
        switch (action) {
            case "/login":
                handleLogin(request, response);
                break;
        }
    }

    private void loadHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy danh sách bookItem theo thứ tự thời gian thêm
        List<BookItem> bookItemListNewest = bookDao.getBookItemListNewest(NUMBER_OF_BOOK_RENDER);
        // lấy danh sách bookItem theo số lượng bán được
        List<BookItem> bookItemListBestSeller = bookDao.getBookItemListBestSeller(NUMBER_OF_BOOK_RENDER);
        // set vào request
        request.setAttribute("bookItemListNewest", bookItemListNewest);
        request.setAttribute("bookItemListBestSeller", bookItemListBestSeller);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/index.jsp");
        dispatcher.forward(request, response);
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account accountInput = new Account(username, password);
        // check db
        Account responseAccount = userDao.login(accountInput);
        if (responseAccount == null) {
            request.setAttribute("accountInput", accountInput);
            request.setAttribute("message", "Account or password are not valid!");
            showLoginForm(request, response);
        } else {
            User user = userDao.getUserByAccountID(responseAccount.getID());
            // lưu thông tin user vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            Role role = user.getRole();
            if (role == Role.Customer) {
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard/");
            }
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // xóa thông tin user trong session
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        response.sendRedirect(request.getContextPath() + "/");
    }

    private void loadAdminInterface(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/staff/dashboard.jsp").forward(request, response);
    }

}
