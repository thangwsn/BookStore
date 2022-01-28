package businesslogic.controller;

import businesslogic.orderDao.CartDao;
import businesslogic.orderDao.CartDaoImpl;
import model.enumeration.Role;
import model.order.Cart;
import model.user.Customer;
import model.user.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FilterCartInfo", urlPatterns = {"/*"})
public class FilterCartInfo implements Filter {
    private CartDao cartDao;
    public void init(FilterConfig config) throws ServletException {
        cartDao = new CartDaoImpl();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpSession session = request1.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole() == Role.Customer) {
            // update Cart mói nhất (có check quantity, buyPrice)
            cartDao.updateNewestCart(user.getID());
            Customer customer = new Customer(user.getID());
            Cart cart = cartDao.getCartByCustomerID(customer);
            int quantity = cartDao.getQuantityOfCart(cart.getID());
            // set số lượng mặt hàng trong cart vào request
            request.setAttribute("quantity", quantity);
        }
        chain.doFilter(request, response);
    }
}
