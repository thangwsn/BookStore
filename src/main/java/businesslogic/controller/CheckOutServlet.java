package businesslogic.controller;

import businesslogic.orderDao.CartDao;
import businesslogic.orderDao.CartDaoImpl;
import businesslogic.orderDao.OrderDao;
import businesslogic.orderDao.OrderDaoImpl;
import model.book.Book;
import model.enumeration.CodStatus;
import model.enumeration.OrderStatus;
import model.enumeration.PaymentType;
import model.order.*;
import model.user.Customer;
import model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CheckOutServlet", value = "/checkout")
public class CheckOutServlet extends HttpServlet {
    private CartDao cartDao;
    private OrderDao orderDao;

    public void init() {
        cartDao = new CartDaoImpl();
        orderDao = new OrderDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        showCheckoutForm(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        checkout(request, response);
    }

    private void showCheckoutForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Customer customer = new Customer(user.getID());
        Cart cart = cartDao.getCartByCustomerID(customer);
        request.setAttribute("cart", cart);

        List<ShipmentType> shipmentTypeList = orderDao.getAllShipmentType();
        request.setAttribute("shipmentTypeList", shipmentTypeList);
        if (cart.getCartDetailList().size() > 0) {
            request.getRequestDispatcher("/view/customer/checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/cart/");
        }
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order order = new Order();
        User user = (User) request.getSession().getAttribute("user");
        Customer customer = new Customer(user.getID());
        Cart cart = cartDao.getCartByCustomerID(customer);
        order.setCart(cart);

        String orderID = UUID.randomUUID().toString();
        order.setID(orderID);

        List<Book> bookList = orderDao.getBookListForOrder(cart.getCartDetailList());
        if (bookList != null) {
            order.setBookList(bookList);
        }

        // shipment
        String shipmentID = UUID.randomUUID().toString();
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String note = request.getParameter("note");
        String shipmentTypeID = request.getParameter("shipmentType");
        Shipment shipment = new Shipment(shipmentID, address, phoneNumber, note, orderDao.getShipmentTypeByID(shipmentTypeID));
        order.setShipment(shipment);

        // payment
        String paymentID = UUID.randomUUID().toString();
        String paymentType = request.getParameter("paymentType");
        double amount = cart.getTotal() + shipment.getShipmentType().getFee();
        Payment payment = null;
        switch (paymentType) {
            case "COD":
                payment = new COD();
                ((COD) payment).setCodStatus(CodStatus.Unpaid);
                break;
            case "Check":
                payment = new Check();
                ((Check) payment).setName(request.getParameter("checkPaymentName"));
                ((Check) payment).setBankID(request.getParameter("bankID"));
                break;
            case "Credit":
                payment = new Credit();
                ((Credit) payment).setName(request.getParameter("creditPaymentName"));
                ((Credit) payment).setNumber(request.getParameter("number"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    ((Credit) payment).setExpireDate(sdf.parse(request.getParameter("expireDate")));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
        }
        payment.setID(paymentID);
        payment.setPaymentType(PaymentType.valueOf(paymentType));
        payment.setCreateTime(new Date());
        payment.setAmount(amount);
        order.setPayment(payment);
        order.setCustomer(new Customer(user.getID()));

        // status
        order.setOrderStatus(OrderStatus.InProgress);
        order.setCreateTime(new Date());
        if (orderDao.saveOrder(order)) { // thành công
            response.sendRedirect(request.getContextPath() + "/order?orderID=" + order.getID());
        } else { //fail
            response.sendRedirect(request.getContextPath() + "/cart/");
        }
    }
}
