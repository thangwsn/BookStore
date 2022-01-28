package model.order;

import model.enumeration.CartStatus;
import model.user.Customer;

import java.util.List;

public class Cart {
    private String ID;
    private double total;
    private CartStatus cartStatus;
    private Customer customer;
    private List<CartDetail> cartDetailList;

    public Cart() {
    }

    public Cart(String ID, double total, CartStatus cartStatus, Customer customer) {
        this.ID = ID;
        this.total = total;
        this.cartStatus = cartStatus;
        this.customer = customer;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public CartStatus getCartStatus() {
        return cartStatus;
    }

    public void setCartStatus(CartStatus cartStatus) {
        this.cartStatus = cartStatus;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<CartDetail> getCartDetailList() {
        return cartDetailList;
    }

    public void setCartDetailList(List<CartDetail> cartDetailList) {
        this.cartDetailList = cartDetailList;
    }
}
