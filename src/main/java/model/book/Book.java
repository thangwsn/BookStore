package model.book;

import model.enumeration.BookStatus;

import java.util.Date;

public class Book {
    private String ID;
    private double importPrice;
    private Date createDate;
    private BookItem bookItem;
    private BookStatus bookStatus;

    public Book(String ID, double importPrice, Date createDate, BookItem bookItem, BookStatus bookStatus) {
        this.ID = ID;
        this.importPrice = importPrice;
        this.createDate = createDate;
        this.bookItem = bookItem;
        this.bookStatus = bookStatus;
    }

    public Book(String id) {
        this.ID = id;
    }

    public BookStatus getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(BookStatus bookStatus) {
        this.bookStatus = bookStatus;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public double getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(double importPrice) {
        this.importPrice = importPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public BookItem getBookItem() {
        return bookItem;
    }

    public void setBookItem(BookItem bookItem) {
        this.bookItem = bookItem;
    }
}
