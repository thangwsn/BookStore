package model.book;

import model.enumeration.Category;

import java.util.Date;
import java.util.List;

public class BookItem {
    private String ID;
    private String ISBN;
    private String title;
    private String summary;
    private Category category;
    private Date publicationDate;
    private int numberOfPage;
    private double buyPrice;
    private int quantity;
    private int soldQuantity;
    private Date createDate;
    private List<Author> authorList;
    private Publisher publisher;
    private List<Image> imageList;

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public BookItem() {

    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public int getNumberOfPage() {
        return numberOfPage;
    }

    public void setNumberOfPage(int numberOfPage) {
        this.numberOfPage = numberOfPage;
    }

    public double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(double buyPrice) {
        this.buyPrice = buyPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public List<Author> getAuthorList() {
        return authorList;
    }

    public void setAuthorList(List<Author> authorList) {
        this.authorList = authorList;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

    @Override
    public String toString() {
        return "BookItem{" +
                "ID='" + ID + '\'' +
                ", ISBN='" + ISBN + '\'' +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", category=" + category +
                ", publicationDate=" + publicationDate +
                ", numberOfPage=" + numberOfPage +
                ", buyPrice=" + buyPrice +
                ", quantity=" + quantity +
                ", soldQuantity=" + soldQuantity +
                ", createDate=" + createDate +
                ", authorList=" + authorList +
                ", publisher=" + publisher +
                ", imageList=" + imageList +
                '}';
    }
}
