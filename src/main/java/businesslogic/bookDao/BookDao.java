package businesslogic.bookDao;

import model.book.Author;
import model.book.BookItem;
import model.book.Publisher;

import java.util.List;

public interface BookDao {
    public List<BookItem> getBookItemListNewest(int number);
    public List<BookItem> getBookItemListBestSeller(int number);
    public BookItem getBookItemByID(String bookItemID);
    public List<BookItem> getAllBookItem();
    public List<BookItem> searchBookItemByName(String searchName);
    public void updateBookItem(BookItem bookItem);
    public Publisher getPublisherByPublisherID(String publisherID);
    public boolean saveBookItem(BookItem bookItem);
    public List<Publisher> getAllPublisher();
    public List<Author> getAllAuthor();
    public Author getAuthorByAuthorID(String s);
}
