package model.book;

public class Publisher {
    private String ID;
    private String name;
    private String address;

    public Publisher(String ID, String name, String address) {
        this.ID = ID;
        this.name = name;
        this.address = address;
    }

    public Publisher(String publisherID, String name) {
        this.ID = publisherID;
        this.name = name;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
