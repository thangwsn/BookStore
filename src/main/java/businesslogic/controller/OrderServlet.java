package businesslogic.controller;

import businesslogic.orderDao.OrderDao;
import businesslogic.orderDao.OrderDaoImpl;
import model.order.Order;
import model.user.Customer;
import model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    private OrderDao orderDao;

    public void init() {
        orderDao = new OrderDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String orderID = request.getParameter("orderID");
        if (orderID == null) {
            showListOrder(request, response);
        } else {
            showDetailOrder(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void showListOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Customer customer = new Customer(user.getID());
        List<Order> orderList = orderDao.getOrderByCustomerID(customer);
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/view/customer/order-list.jsp").forward(request, response);
    }

    private void showDetailOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("orderID");
        Order order = orderDao.getOrderByOrderID(orderID);
        request.setAttribute("order", order);
        request.getRequestDispatcher("/view/customer/order-detail.jsp").forward(request, response);
    }
}
