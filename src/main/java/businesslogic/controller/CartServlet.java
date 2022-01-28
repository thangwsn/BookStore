package businesslogic.controller;

import businesslogic.bookDao.BookDao;
import businesslogic.bookDao.BookDaoImpl;
import businesslogic.orderDao.CartDao;
import businesslogic.orderDao.CartDaoImpl;
import model.book.BookItem;
import model.order.Cart;
import model.order.CartDetail;
import model.user.Customer;
import model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CartServlet", value = "/cart/*")
public class CartServlet extends HttpServlet {
    private CartDao cartDao;
    private BookDao bookDao;

    @Override
    public void init() {
        cartDao = new CartDaoImpl();
        bookDao = new BookDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/add":
                addToCart(request, response);
                break;
            case "/remove":
                removeBookFromCart(request, response);
                break;
            case "/":
                showCart(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/update":
                updateCart(request, response);
                break;
        }
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Get cart đã update thông tin
        Customer customer = new Customer(user.getID());
        Cart cart = cartDao.getCartByCustomerID(customer);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/view/customer/cart.jsp").forward(request, response);

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get Params
        String bookItemID = request.getParameter("bookItemID");
        BookItem bookItem = bookDao.getBookItemByID(bookItemID);
        // lấy thông tin user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Get cart
        Customer customer = new Customer(user.getID());
        Cart cart = cartDao.getCartByCustomerID(customer);

        // Kiểm tra xem item đó đã có trong cart chưa
        boolean isExist = false;
        List<CartDetail> cartDetailList = cart.getCartDetailList();
        for (CartDetail cartDetail : cartDetailList) {
            if (cartDetail.getBookItem().getID().equals(bookItemID)) {
                cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                cartDetail.setBuyPrice(bookItem.getBuyPrice());
                // update db
                cartDao.updateCartDetail(cartDetail);
                isExist = true;
                break;
            }
        }
        if (isExist == false) {
            // insert db
            CartDetail cartDetail = new CartDetail();
            cartDetail.setID(UUID.randomUUID().toString());
            cartDetail.setBookItem(bookItem);
            cartDetail.setQuantity(1);
            cartDetail.setBuyPrice(bookItem.getBuyPrice());
            cartDao.insertCartDetail(cart, cartDetail);
        }

        response.sendRedirect(request.getContextPath() + "/cart/");
    }

    private void removeBookFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get Params: cartDetailID
        String cartDetailID = request.getParameter("cartDetailID");
        CartDetail cartDetail = cartDao.getCartDetailByID(cartDetailID);
        if (cartDetail != null) {
            cartDao.removeCartDetail(cartDetail);
        }
        response.sendRedirect(request.getContextPath() + "/cart/");
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // get Cart từ db
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Customer customer = new Customer(user.getID());
        Cart cart = cartDao.getCartByCustomerID(customer);
        // Get params, thực hiện update các record
        List<CartDetail> cartDetailList = cart.getCartDetailList();
        for (CartDetail cartDetail : cartDetailList) {
            int quantity = Integer.parseInt(request.getParameter(cartDetail.getID()));
            cartDetail.setQuantity(quantity);
        }
        cart.setCartDetailList(cartDetailList);

        // update cartDetail
        cartDao.updateCart(cart);
        response.sendRedirect(request.getContextPath() + "/cart/");
    }
}
