package model.order;

import model.enumeration.OrderStatus;
import model.book.Book;
import model.user.Customer;

import java.util.Date;
import java.util.List;

public class Order {
    private String ID;
    private Date createTime;
    private OrderStatus orderStatus;
    private Cart cart;
    private Shipment shipment;
    private Payment payment;
    private List<Book> bookList;
    private Customer customer;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Order(String ID, Date createTime, OrderStatus orderStatus, Cart cart, Shipment shipment, Payment payment, List<Book> bookList) {
        this.ID = ID;
        this.createTime = createTime;
        this.orderStatus = orderStatus;
        this.cart = cart;
        this.shipment = shipment;
        this.payment = payment;
        this.bookList = bookList;
    }

    public Order() {

    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }
}
