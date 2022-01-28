package model.book;

public class Author {
    private String ID;
    private String fullName;
    private String biography;
    private String address;

    public Author(String ID, String fullName, String biography, String address) {
        this.ID = ID;
        this.fullName = fullName;
        this.biography = biography;
        this.address = address;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
