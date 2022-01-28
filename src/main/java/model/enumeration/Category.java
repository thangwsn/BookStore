package model.enumeration;

public enum Category {
    Textbook("Textbook"), Novel("Novel"), Comic("Comic"), Poem("Poem"), ThrillerBook("ThrillerBook");

    private String value;
    Category(String value) {
        this.value = value;
    }
}
