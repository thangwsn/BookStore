package model.book;

public class Image {
    private String ID;
    private String path;

    public Image(String ID, String path) {
        this.ID = ID;
        this.path = path;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
