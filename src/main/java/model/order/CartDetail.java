package model.order;

import model.book.BookItem;

public class CartDetail {
    private String ID;
    private BookItem bookItem;
    private int quantity;
    private double buyPrice;

    public CartDetail(String ID, BookItem bookItem, int quantity, double buyPrice) {
        this.ID = ID;
        this.bookItem = bookItem;
        this.quantity = quantity;
        this.buyPrice = buyPrice;
    }

    public CartDetail() {

    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public BookItem getBookItem() {
        return bookItem;
    }

    public void setBookItem(BookItem bookItem) {
        this.bookItem = bookItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(double buyPrice) {
        this.buyPrice = buyPrice;
    }
}
